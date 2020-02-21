use std::error::Error;
use std::io::stdin;

use super::api_client;
use super::models;
use super::ux;

type BoxResult<T> = Result<T, Box<dyn Error>>;

pub fn add_to_shelf(
    shelf: &Option<String>,
    title: &Option<String>,
    gr_client: &api_client::GoodreadsApiClient,
) -> BoxResult<()> {
    let mut shelf_answer = String::new();
    let mut title_answer = String::new();
    let target_shelf = shelf.as_ref().unwrap_or_else(|| {
        println!("❓: Which shelf would you like to add the book to?");
        stdin()
            .read_line(&mut shelf_answer)
            .expect("Failed to read your input");
        &shelf_answer
    });
    let title_query = title.as_ref().unwrap_or_else(|| {
        println!("🔎 What's the title of the book?");
        stdin()
            .read_line(&mut title_answer)
            .expect("Failed to read your input");
        &title_answer
    });
    let res = gr_client
        .search_books(&title_query, "title")
        .and_then(|xml| models::parse_book_search_results(&xml).map_err(|err| err.to_string()))
        .and_then(|results| {
            println!("📖 Results:");
            for (i, result) in results.iter().enumerate() {
                println!("{}. {} - {}", i + 1, result.1, result.2);
            }
            println!("\nWhich one is the one you'd like to add?");
            let choice = ux::get_choice(1, results.len() as u32)
                .map_err(|_err| "Failed to get user choice")?;
            let book_to_update = results
                .get((choice as usize) - 1)
                .expect("Should never access an invalid index here");
            Ok(book_to_update.0)
        })
        .and_then(|id| {
            gr_client.add_to_shelf(id, target_shelf)?;
            Ok(id)
        });
    match res {
        Ok(_) => {
            println!("✅ Added to {}", target_shelf);
            Ok(())
        }
        Err(err) => bail!("Error: {}", err),
    }
}
