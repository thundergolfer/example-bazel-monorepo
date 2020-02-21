use std::cmp::{self, Ord};
use std::error::Error;

use super::models;

type BoxResult<T> = Result<T, Box<dyn Error>>;

pub fn get_choice(min: u32, max: u32) -> BoxResult<u32> {
    loop {
        let mut input = String::new();
        let _res = std::io::stdin().read_line(&mut input)?;

        let value = input.trim().parse::<u32>();
        match value {
            Ok(num) => return Ok(num),
            Err(_) => {
                println!("Please input a choice in the range [{}, {}]", min, max);
            }
        }
    }
}

pub fn get_confirm() -> BoxResult<bool> {
    loop {
        let mut input = String::new();
        std::io::stdin().read_line(&mut input)?;
        let value = &input.trim().to_lowercase();

        match value.as_ref() {
            "y" => return Ok(true),
            "n" => return Ok(false),
            _ => continue,
        }
    }
}

pub fn select_by_edit_distance(
    shelf: &models::Shelf,
    target: &str,
) -> (Option<models::Book>, Option<usize>) {
    let mut books = shelf.books.to_vec();
    books.sort_by_key(|b| levenshtein_distance(&b.title, target));

    let closest: Option<&models::Book> = books.get(0);
    match closest {
        Some(b) => (
            Some(b.clone()),
            Some(levenshtein_distance(&b.title, target)),
        ),
        None => (None, None),
    }
}

fn levenshtein_distance(source: &str, target: &str) -> usize {
    if source.is_empty() {
        return target.len();
    }

    if target.is_empty() {
        return source.len();
    }

    let mut cache: Vec<usize> = (0..=target.len()).collect();

    for (i, source_char) in source.chars().enumerate() {
        let mut next_dist = i + 1;

        for (j, target_char) in target.chars().enumerate() {
            let current_dist = next_dist;

            let mut dist_if_substitute = cache[j];
            if source_char != target_char {
                dist_if_substitute += 1;
            }

            let dist_if_insert = current_dist + 1;
            let dist_if_delete = cache[j + 1] + 1;

            next_dist = min_3(dist_if_substitute, dist_if_insert, dist_if_delete);

            cache[j] = current_dist;
        }

        cache[target.len()] = next_dist;
    }

    cache[target.len()]
}

fn min_3<T: Ord>(a: T, b: T, c: T) -> T {
    cmp::min(a, cmp::min(b, c))
}
