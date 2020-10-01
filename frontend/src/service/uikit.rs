//! UIkit related helpers

use serde_json;
use std::fmt;
use wasm_bindgen::{prelude::*, JsCast};

/// The UIkit service
pub struct UIkitService;

/// Possible status for notifications
pub enum NotificationStatus {
    Warning,
    Danger,
}

impl fmt::Display for NotificationStatus {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match self {
            NotificationStatus::Warning => write!(f, "warning"),
            NotificationStatus::Danger => write!(f, "danger"),
        }
    }
}

#[wasm_bindgen]
extern "C" {
    #[ wasm_bindgen ( extends = :: js_sys :: Object , js_namespace = UIkit , js_name = notification ) ]
    pub fn notification_with_options(options: &js_sys::Object);
}

impl UIkitService {
    /// Create a new UIkitService instance
    pub fn new() -> Self {
        Self {}
    }

    /// Create a new notification
    pub fn notify(&self, message: &str, status: &NotificationStatus) {
        notification_with_options(
            JsValue::from_serde(&serde_json::json!({
                "message": message,
                "status": status.to_string(),
                "timeout": 3000
            }))
            .unwrap()
            .unchecked_ref(),
        );
    }
}
