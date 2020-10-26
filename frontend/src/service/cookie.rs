//! A cookie handling service to read and write cookies

use anyhow::Result;
use thiserror::Error;
use wasm_bindgen::JsCast;
use web_sys::{window, HtmlDocument};

#[derive(Debug, Error)]
pub enum CookieError {
    #[error("no cookie found for the given name")]
    NotFound,
}

pub struct CookieService;

impl CookieService {
    /// Create a new cookie service instance
    pub fn new() -> Self {
        CookieService
    }

    /// Set a cookie for a given name and value for a default validity of one
    /// year
    pub fn set(&self, name: &str, value: &str) {
        self.set_expiring(name, value, 365)
    }

    /// Retrieve a cookie for a given name
    pub fn get(&self, name: &str) -> Result<String> {
        window()
            .and_then(|window| window.document())
            .and_then(|document| document.dyn_into::<HtmlDocument>().ok())
            .and_then(|html_document| html_document.cookie().ok())
            .and_then(|cookie| {
                cookie
                    .split(';')
                    .map(|x| x.to_owned())
                    .filter_map(|x| {
                        let name_value: Vec<_> = x.splitn(2, '=').collect();
                        match name_value.get(0) {
                            None => None,
                            Some(c) => {
                                if c.trim_start() == name {
                                    name_value.get(1).map(|x| (x[1..x.len() - 1]).to_owned())
                                } else {
                                    None
                                }
                            }
                        }
                    })
                    .collect::<Vec<String>>()
                    .pop()
            })
            .ok_or_else(|| CookieError::NotFound.into())
    }

    /// Remove a cookie for a given name
    pub fn remove(&self, name: &str) {
        self.set_expiring(name, "", -1);
    }

    /// Set a cookie for a given name, value and validity days
    fn set_expiring(&self, name: &str, value: &str, days: i32) {
        window()
            .and_then(|window| window.document())
            .and_then(|document| document.dyn_into::<HtmlDocument>().ok())
            .and_then(|html_document| {
                html_document
                    .set_cookie(&format!(
                        r#"{}="{}";max-age={};path=/"#,
                        name,
                        value,
                        days * 24 * 60 * 60
                    ))
                    .ok()
            });
    }
}
