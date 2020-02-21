use serde::{Deserialize, Serialize};

use super::models;
use oauth_client;
use reqwest::{Client, StatusCode};
use std::borrow::Cow;
use std::collections::HashMap;

pub mod goodreads_api_endpoints {
    pub const USER_ID: &str = "https://www.goodreads.com/api/auth_user";
    pub const LIST_SHELF: &str = "https://www.goodreads.com/review/list?v=2";
    pub const ADD_TO_SHELF: &str = "https://www.goodreads.com/shelf/add_to_shelf.xml";
    pub const UPDATE_STATUS: &str = "https://www.goodreads.com/user_status.json";
    pub const SEARCH_BOOKS: &str = "https://www.goodreads.com/search/index.xml";
}

#[derive(Serialize, Deserialize)]
pub struct GoodreadsApiClientAuth {
    developer_key: String,
    developer_secret: String,
    oauth_access_token: String,
    oauth_access_token_secret: String,
}

pub struct GoodreadsApiClient {
    pub auth: GoodreadsApiClientAuth,
    pub user_id: u32,
    pub client: Client,
}

impl GoodreadsApiClient {
    pub fn add_to_shelf(&self, book_id: u32, shelf_name: &str) -> Result<(), String> {
        let mut req_params = HashMap::new();
        let _ = req_params.insert(Cow::from("name"), Cow::from(shelf_name));
        let _ = req_params.insert(Cow::from("book_id"), Cow::from(book_id.to_string()));

        let res = make_oauthd_request(
            self,
            reqwest::Method::POST,
            goodreads_api_endpoints::ADD_TO_SHELF,
            Some(&req_params),
        );

        match res {
            Ok(resp) => match resp.status() {
                StatusCode::CREATED => Ok(()),
                _ => Err(format!("Request failed. Status code: {}", resp.status())),
            },
            Err(err) => Err(format!("Request failed: {}", err)),
        }
    }

    pub fn remove_from_shelf(&self, book_id: u32, shelf_name: &str) -> Result<(), String> {
        // NOTE: Ugly API design from Goodreads has us calling the ADD_TO_SHELF endpoint to remove
        let mut req_params = HashMap::new();
        let _ = req_params.insert(Cow::from("name"), Cow::from(shelf_name));
        let _ = req_params.insert(Cow::from("book_id"), Cow::from(book_id.to_string()));
        let _ = req_params.insert(Cow::from("a"), Cow::from("remove"));

        let res = make_oauthd_request(
            self,
            reqwest::Method::POST,
            goodreads_api_endpoints::ADD_TO_SHELF,
            Some(&req_params),
        );

        match res {
            Ok(resp) => match resp.status() {
                StatusCode::OK => Ok(()),
                _ => Err(format!("Request failed. Status code: {}", resp.status())),
            },
            Err(err) => Err(format!("Request failed: {}", err)),
        }
    }

    pub fn search_books(&self, query: &str, search_field: &str) -> Result<String, String> {
        let mut req_params = HashMap::new();
        let _ = req_params.insert(Cow::from("q"), Cow::from(query));
        let _ = req_params.insert(Cow::from("search[field]"), Cow::from(search_field));
        let _ = req_params.insert(Cow::from("key"), Cow::from(self.auth.developer_key.clone()));

        let res = make_oauthd_request(
            self,
            reqwest::Method::GET,
            goodreads_api_endpoints::SEARCH_BOOKS,
            Some(&req_params),
        );

        match res {
            Ok(mut resp) => match resp.status() {
                StatusCode::OK => {
                    let txt = resp.text().unwrap_or_else(|err| err.to_string());
                    Ok(txt)
                }
                _ => Err(format!("Request failed. Status code: {}", resp.status())),
            },
            Err(err) => Err(format!("Request failed: {}", err)),
        }
    }

    pub fn user_id(&self) -> Result<u32, String> {
        let res = make_oauthd_request(
            self,
            reqwest::Method::GET,
            goodreads_api_endpoints::USER_ID,
            None,
        );

        match res {
            Ok(mut resp) => match resp.status() {
                StatusCode::OK => {
                    let resp_xml = resp.text().unwrap_or_else(|_| {
                        format!(
                            "Could not decode response text from {}",
                            goodreads_api_endpoints::USER_ID
                        )
                    });
                    let doc = match roxmltree::Document::parse(&resp_xml) {
                        Ok(doc) => doc,
                        Err(e) => {
                            println!("Error: {}.", e);
                            return Err(String::from("Failed to parse XML response"));
                        }
                    };

                    let user_nodes: Vec<roxmltree::Node> = doc
                        .descendants()
                        .filter(|n| n.has_tag_name("user"))
                        .collect::<Vec<_>>();

                    if user_nodes.len() != 1 {
                        Err(String::from("fuck"))
                    } else {
                        let user_node = user_nodes.get(0).unwrap();
                        let id = user_node.attribute("id").unwrap();
                        let id = id.parse::<u32>().unwrap();
                        Ok(id)
                    }
                }
                _ => Err(String::from("Request to get user id failed")),
            },
            Err(_err) => Err(String::from("Request to get user id failed")),
        }
    }

    pub fn update_status(
        &self,
        book: Option<&models::Book>,
        page: Option<u32>,
        percent: Option<Percentage>,
        body: Option<String>,
    ) -> Result<(), String> {
        if body.is_some() {
            return Err("Sending status updates with a 'body' is not yet supported.".to_owned());
        } else if book.is_none() {
            return Err("Sending status updates without a book is not yet supported.".to_owned());
        } else if page.is_some() && percent.is_some() {
            return Err(
                "Cannot specify both 'page' and 'percent' progress indicators. Choose 1."
                    .to_owned(),
            );
        }

        let mut req_params = HashMap::new();
        if page.is_some() {
            let page = page.unwrap().to_string();
            let _ = req_params.insert(Cow::from("user_status[page]"), Cow::from(page));
        } else if percent.is_some() {
            let percent = Percentage::unwrap(percent.unwrap()).to_string();
            let _ = req_params.insert(Cow::from("user_status[percent]"), Cow::from(percent));
        }
        let book_id = book.unwrap().id.to_string();
        let _ = req_params.insert(Cow::from("user_status[book_id]"), Cow::from(book_id));
        let _ = req_params.insert(Cow::from("user_status[body]"), Cow::from(""));

        let res = make_oauthd_request(
            self,
            reqwest::Method::POST,
            goodreads_api_endpoints::UPDATE_STATUS,
            Some(&req_params),
        );

        match res {
            Ok(mut _resp) => {
                //                println!("Updated: {}", resp.text().unwrap());
                Ok(())
            }
            Err(err) => Err(format!("Request failed: {}", err)),
        }
    }

    pub fn list_shelf(&self, shelf_name: &str) -> Result<String, String> {
        let mut req_params = HashMap::new();
        let _ = req_params.insert(Cow::from("id"), Cow::from(self.user_id.to_string()));
        let _ = req_params.insert(Cow::from("shelf"), Cow::from(shelf_name));
        let _ = req_params.insert(Cow::from("key"), Cow::from(self.auth.developer_key.clone()));

        let res = make_oauthd_request(
            self,
            reqwest::Method::GET,
            goodreads_api_endpoints::LIST_SHELF,
            Some(&req_params),
        );

        match res {
            Ok(mut resp) => {
                if resp.status() == StatusCode::OK {
                    Ok(resp.text().unwrap())
                } else {
                    Err(format!(
                        "Request failed. Response status: {}",
                        resp.status()
                    ))
                }
            }
            Err(err) => Err(format!("Request failed: {}", err)),
        }
    }

    pub fn new(
        user_id: u32,
        developer_key: &str,
        developer_secret: &str,
        oauth_access_token: &str,
        oauth_access_token_secret: &str,
    ) -> GoodreadsApiClient {
        let auth = GoodreadsApiClientAuth {
            developer_key: developer_key.to_string(),
            developer_secret: developer_secret.to_string(),
            oauth_access_token: oauth_access_token.to_string(),
            oauth_access_token_secret: oauth_access_token_secret.to_string(),
        };

        GoodreadsApiClient {
            auth,
            user_id,
            client: Client::new(),
        }
    }
}

fn make_oauthd_request(
    gr_client: &GoodreadsApiClient,
    method: reqwest::Method,
    url: &str,
    req_params: Option<&oauth_client::ParamList>,
) -> Result<reqwest::Response, reqwest::Error> {
    let consumer = oauth_client::Token::new(
        gr_client.auth.developer_key.clone(),
        gr_client.auth.developer_secret.clone(),
    );
    let access = oauth_client::Token::new(
        gr_client.auth.oauth_access_token.clone(),
        gr_client.auth.oauth_access_token_secret.clone(),
    );
    let (header, _body) = oauth_client::authorization_header(
        method.as_str(),
        url,
        &consumer,
        Some(&access),
        req_params,
    );
    let req = gr_client
        .client
        .request(method, url)
        .header(reqwest::header::AUTHORIZATION, header);
    if req_params.is_some() {
        let req = req.form(&req_params);
        req.send()
    } else {
        req.send()
    }
}

#[derive(Clone, Copy, Debug)]
pub struct Percentage(u8);

impl Percentage {
    #[allow(dead_code)]
    pub fn new(x: u8) -> Option<Percentage> {
        if x <= 100 {
            Some(Percentage(x))
        } else {
            None
        }
    }

    pub fn unwrap(p: Percentage) -> u8 {
        p.0
    }
}
