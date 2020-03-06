import bs4
import requests

from dataclasses import dataclass

# TODO(Jonathon): Capture category as well
# TODO(Jonathon): Improve code quality and structure


@dataclass
class Book:
    title: str
    author: str


def run():
    target_url = "https://www.nytimes.com/books/best-sellers/"
    response = requests.get(target_url)
    soup = bs4.BeautifulSoup(response.text, "html.parser")

    books = []

    for section in soup.find_all("section"):
        for li in section.find_all("li"):
            maybe_title = li.find_all("h3")
            if maybe_title:
                title = maybe_title[0].text
            else:
                continue

            maybe_author = li.find_all(attrs={"itemprop": "author"})
            if maybe_author:
                author = maybe_author[0].text.replace("by ", "")
            else:
                continue
            book = Book(title=title, author=author)
            books.append(book)

    print("Found books:")
    for b in books:
        print(b)


if __name__ == "__main__":
    run()
