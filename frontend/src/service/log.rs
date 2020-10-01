//! The log service

use anyhow::{format_err, Result};
use log::{set_logger, set_max_level, Level, LevelFilter, Log, Metadata, Record};
use wasm_bindgen::prelude::*;
use web_sys::console;

/// The public static logger instance
static LOGGER: LogService = LogService;

/// Initialize the static logger
pub fn init_logger() -> Result<()> {
    set_logger(&LOGGER)
        .map(|()| set_max_level(LevelFilter::Trace))
        .map_err(|_| format_err!("Logger init failed"))
}

/// The service used for logging purposes
struct LogService;

impl Log for LogService {
    fn enabled(&self, metadata: &Metadata) -> bool {
        metadata.level() <= Level::Trace
    }

    fn log(&self, record: &Record) {
        // Verify that the logger is enabled
        if self.enabled(record.metadata()) {
            // Create the log entry
            let mut log_entry = format!("%c{}: %c", record.level());

            // Add file and line if available
            if let (Some(file), Some(line)) = (record.file(), record.line()) {
                log_entry += &format!("{}:{}: ", file, line);
            }

            // Add the body
            log_entry += &format!("{}", record.args());

            // Log the entry
            const BOLD: &str = "font-weight: bold";
            const NORMAL: &str = "font-weight: normal";
            match record.level() {
                Level::Error => {
                    console::error_3(
                        &JsValue::from_str(&log_entry),
                        &JsValue::from_str(BOLD),
                        &JsValue::from_str(NORMAL),
                    );
                }
                Level::Warn => {
                    console::warn_3(
                        &JsValue::from_str(&log_entry),
                        &JsValue::from_str(BOLD),
                        &JsValue::from_str(NORMAL),
                    );
                }
                Level::Info => {
                    console::log_3(
                        &JsValue::from_str(&log_entry),
                        &JsValue::from_str(BOLD),
                        &JsValue::from_str(NORMAL),
                    );
                }
                Level::Debug => {
                    console::debug_3(
                        &JsValue::from_str(&log_entry),
                        &JsValue::from_str(BOLD),
                        &JsValue::from_str(NORMAL),
                    );
                }
                Level::Trace => {
                    console::debug_3(
                        &JsValue::from_str(&log_entry),
                        &JsValue::from_str(BOLD),
                        &JsValue::from_str(NORMAL),
                    );
                }
            }
        }
    }

    fn flush(&self) {}
}
