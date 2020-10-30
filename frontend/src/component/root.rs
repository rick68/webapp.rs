//! The Root component as main entry point of the frontend application

use crate::{
    api::Response,
    component::{content::ContentComponent, login::LoginComponent},
    route::RouterTarget,
    service::{
        cookie::CookieService,
        uikit::{NotificationStatus, UIkitService},
    },
    string::{REQUEST_ERROR, RESPONSE_ERROR},
    SESSION_COOKIE,
};
use log::{error, info, warn};
use webapp::{
    protocol::{model::Session, request::LoginSession, response::Login},
    API_URL_LOGIN_SESSION,
};
use yew::{agent::Bridged, format::Json, html, prelude::*, services::fetch::FetchTask};
use yew_router::{
    agent::{RouteAgent, RouteRequest::ChangeRoute},
    route::Route,
    switch::Switch,
};

/// Data Model for the Root Component
pub struct RootComponent {
    child_component: Option<RouterTarget>,
    cookie_service: CookieService,
    fetch_task: Option<FetchTask>,
    router_agent: Box<dyn Bridge<RouteAgent<()>>>,
    uikit_service: UIkitService,
}

/// Available message types to process
pub enum Message {
    Fetch(Response<Login>),
    Route(Route<()>),
}

impl Component for RootComponent {
    type Message = Message;
    type Properties = ();

    fn create(_: Self::Properties, link: ComponentLink<Self>) -> Self {
        // Create needed services
        let cookie_service = CookieService::new();
        let mut fetch_task = None;
        let mut router_agent = RouteAgent::bridge(link.callback(Message::Route));
        let uikit_service = UIkitService::new();

        // Verify if a session cookie already exist and try to authenticate if so
        if let Ok(token) = cookie_service.get(SESSION_COOKIE) {
            fetch_task = fetch! {
                LoginSession(Session::new(token)) => API_URL_LOGIN_SESSION,
                link, Message::Fetch,
                || {},
                || {
                    error!("Unable to create session login request");
                    uikit_service.notify(REQUEST_ERROR, &NotificationStatus::Danger);
                    cookie_service.remove(SESSION_COOKIE);
                    router_agent.send(ChangeRoute(RouterTarget::Login.into()));
                }
            };
        } else {
            info!("No token found, routing to login");
            router_agent.send(ChangeRoute(RouterTarget::Login.into()));
        }

        // Return the component
        Self {
            child_component: Some(RouterTarget::Loading),
            cookie_service,
            fetch_task,
            router_agent,
            uikit_service,
        }
    }

    fn change(&mut self, _: Self::Properties) -> ShouldRender {
        true
    }

    fn update(&mut self, msg: Self::Message) -> ShouldRender {
        match msg {
            // Route to the appropriate child component
            Message::Route(route) => self.child_component = RouterTarget::switch(route),

            // The message for all fetch responses
            Message::Fetch(response) => {
                let (meta, Json(body)) = response.into_parts();

                // Check the response type
                if meta.status.is_success() {
                    match body {
                        Ok(Login(Session { token })) => {
                            info!("Session based login succeed");

                            // Set the retrieved session cookie
                            self.cookie_service.set(SESSION_COOKIE, &token);

                            // Route to the content component
                            self.router_agent
                                .send(ChangeRoute(RouterTarget::Content.into()));
                        }
                        _ => {
                            // Send an error notification to the user on any failure
                            warn!("Got wrong session login response");
                            self.uikit_service
                                .notify(RESPONSE_ERROR, &NotificationStatus::Danger);
                            self.router_agent
                                .send(ChangeRoute(RouterTarget::Login.into()));
                        }
                    }
                } else {
                    // Remove the existing cookie
                    warn!("Session login failed with status: {}", meta.status);
                    self.cookie_service.remove(SESSION_COOKIE);
                    self.router_agent
                        .send(ChangeRoute(RouterTarget::Login.into()));
                }

                // Remove the ongoing task
                self.fetch_task = None;
            }
        }
        true
    }

    fn view(&self) -> Html {
        if let Some(cc) = &self.child_component {
            match cc {
                RouterTarget::Loading => {
                    html! {
                        <div class="bg-withe h-screen mx-auto h-full flex justify-center items-center",>
                            <svg width="60" height="60" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg" data-svg="cloud-download"><path fill="none" stroke="#000" stroke-width="1.1" d="M6.5,14.61 L3.75,14.61 C1.96,14.61 0.5,13.17 0.5,11.39 C0.5,9.76 1.72,8.41 3.3,8.2 C3.38,5.31 5.75,3 8.68,3 C11.19,3 13.31,4.71 13.89,7.02 C14.39,6.8 14.93,6.68 15.5,6.68 C17.71,6.68 19.5,8.45 19.5,10.64 C19.5,12.83 17.71,14.6 15.5,14.6 L12.5,14.6"></path><polyline fill="none" stroke="#000" points="11.75 16 9.5 18.25 7.25 16"></polyline><path fill="none" stroke="#000" d="M9.5,18 L9.5,9.5"></path></svg>
                        </div>
                    }
                }
                RouterTarget::Login => {
                    html! {
                        <LoginComponent:/>
                    }
                }
                RouterTarget::Content => {
                    html! {
                        <ContentComponent:/>
                    }
                }
                RouterTarget::Error => {
                    html! {
                        <div class="bg-withe h-screen mx-auto h-full flex justify-center items-center",>
                            <svg width="60" height="60" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg" data-svg="ban"><circle fill="none" stroke="#000" stroke-width="1.1" cx="10" cy="10" r="9"></circle><line fill="none" stroke="#000" stroke-width="1.1" x1="4" y1="3.5" x2="16" y2="16.5"></line></svg>
                        </div>
                    }
                }
            }
        } else {
            html! { "No child component available" }
        }
    }
}
