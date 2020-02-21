use regex::Regex;
use std::fmt::{self, Display, Formatter};

use roxmltree::Node;

const MAX_DESC_LEN: usize = 20;

pub struct Shelf {
    pub books: Vec<Book>,
}

#[derive(Clone, Debug)]
pub struct Book {
    pub id: u32,
    pub description: String,
    pub title: String,
    // Sometimes num_pages is missing from XML data.
    pub num_pages: Option<u32>,
}

#[derive(Clone, Debug, Default)]
pub struct Author {
    pub id: u32,
    pub name: String,
}

impl Display for Book {
    fn fmt(&self, f: &mut Formatter) -> fmt::Result {
        match self.description.len() {
            0 => write!(f, "{}", self.title),
            1..=MAX_DESC_LEN => write!(f, "{}: {}...", self.title, self.description),
            _ => {
                let shortened_desc = &self.description[..MAX_DESC_LEN];
                write!(f, "{}: {}...", self.title, shortened_desc)
            }
        }
    }
}

// TODO(Jonathon): These XML -> Models methods shouldn't be in this module
pub fn parse_book_search_results(
    results_xml: &str,
) -> Result<Vec<(u32, String, String)>, roxmltree::Error> {
    let mut book_results: Vec<(u32, String, String)> = Vec::new();
    let doc = match roxmltree::Document::parse(results_xml) {
        Ok(doc) => doc,
        Err(e) => {
            println!("Error: {}.", e);
            return Err(e);
        }
    };

    for node in doc.descendants() {
        if node.is_element() && node.has_tag_name("best_book") {
            match parse_search_result_from_best_book(node) {
                Ok(r) => book_results.push(r),
                Err(_err) => {}
            }
        }
    }
    Ok(book_results)
}

fn parse_search_result_from_best_book(
    best_book_xml_node: Node,
) -> Result<(u32, String, String), roxmltree::Error> {
    let mut result: (u32, String, String) = Default::default();
    for child_node in best_book_xml_node.descendants() {
        match child_node.tag_name().name() {
            "id" => {
                let id_str = child_node.text().unwrap_or("");
                // Don't set it twice. The second is probably an author ID
                if result.0 == 0 {
                    result.0 = id_str.parse::<u32>().unwrap();
                }
            }
            "title" => {
                result.1 = String::from(child_node.text().unwrap_or(""));
            }
            "author" => {
                let author = parse_author_node(child_node).unwrap();
                result.2 = author.name;
            }
            _ => {}
        }
    }
    Ok(result)
}

fn parse_author_node(author_node: Node) -> Result<Author, roxmltree::Error> {
    let mut author: Author = Default::default();

    for child_node in author_node.descendants() {
        match child_node.tag_name().name() {
            "id" => {
                author.id = child_node.text().unwrap().parse::<u32>().unwrap();
            }
            "name" => {
                author.name = String::from(child_node.text().unwrap());
            }
            _ => {}
        }
    }
    Ok(author)
}

pub fn parse_shelf(shelf_xml: &str) -> Result<Shelf, roxmltree::Error> {
    let mut books: Vec<Book> = Vec::new();
    let doc = match roxmltree::Document::parse(shelf_xml) {
        Ok(doc) => doc,
        Err(e) => {
            println!("Error: {}.", e);
            return Err(e);
        }
    };

    for node in doc.descendants() {
        if node.is_element() && node.has_tag_name("book") {
            books.push(book_from_xml_node(node));
        }
    }

    Ok(Shelf { books })
}

/// For some insane reason the 'id' field that appears in the XML is NOT
/// the id value that you want to use in API calls.
/// The usable ID value can only be found in URLs in the XML object.
/// This function can extract the ID from the '<link>' node.
fn extract_book_id_from_book_link(book_link: &str) -> Option<u32> {
    let re: Regex = Regex::new(
        r"(?x)
        ^https://www.goodreads.com/book/show/(?P<book_id>[\d]+)[\-|\.]
        ([[:word:]]+-)*
        ([[:word:]]+_)*
        [[:word:]]+$
        ",
    )
    .expect("Regex should always compile");
    re.captures(book_link)
        .and_then(|cap| {
            cap.name("book_id")
                .map(|book_id| book_id.as_str())
                .map(|book_id| book_id.parse::<u32>())
        })
        .and_then(|parse_res| match parse_res {
            Ok(num) => Some(num),
            Err(_err) => None,
        })
}

fn book_from_xml_node(node: Node) -> Book {
    let mut book = Book {
        id: 0,
        description: "".to_owned(),
        title: "".to_owned(),
        num_pages: None,
    };

    for child_node in node.descendants() {
        match child_node.tag_name().name() {
            "link" => {
                let parent = child_node.parent();
                // Don't attempt to parse the <link> node that is within the <author> node.
                if parent.is_some() && parent.unwrap().tag_name().name() == "book" {
                    let link_txt = child_node.text().unwrap_or("");
                    let book_id = extract_book_id_from_book_link(link_txt);
                    book.id = book_id.expect(&format!(
                        "Could not get book id from <link> URL: {}",
                        link_txt
                    ));
                }
            }
            "description" => {
                book.description = String::from(child_node.text().unwrap_or(""));
            }
            "title" => {
                book.title = String::from(child_node.text().unwrap_or(""));
            }
            "num_pages" => {
                book.num_pages = child_node.text().and_then(|txt| txt.parse::<u32>().ok());
            }
            _ => {}
        }
    }
    book
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::fs;
    use std::io::prelude::*;
    use std::path::PathBuf;

    #[allow(dead_code)]
    fn load_file(path: &PathBuf) -> String {
        let mut file = fs::File::open(&path).unwrap();
        let mut text = String::new();
        file.read_to_string(&mut text).unwrap();
        text
    }

    //    #[test]
    //    fn test_parse_shelf() {
    //        let mut path = PathBuf::from(env!("CARGO_MANIFEST_DIR"));
    //        path.push("src/api_responses/currently_reading_shelf_resp.xml");
    //        println!("{}", path.display());
    //        let text = load_file(&path);
    //        parse_shelf(&text);
    //    }

    #[test]
    fn test_extract_book_id_from_book_link() {
        let cases = vec![
            (
                "https://www.goodreads.com/book/show/1234.The_First_Book",
                1234 as u32,
            ),
            (
                "https://www.goodreads.com/book/show/4444-The-Second-Book",
                4444 as u32,
            ),
            (
                "https://www.goodreads.com/book/show/934343-The_Book",
                934343 as u32,
            ),
        ];

        for (url, book_id) in cases.iter() {
            let actual = extract_book_id_from_book_link(url);
            assert_eq!(actual, Some(*book_id));
        }
    }
}
