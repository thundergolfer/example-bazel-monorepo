import sqlite3
import requests
import bs4
import re

from dataclasses import dataclass
from loguru import logger


@dataclass
class WikiScrapedUnicorn:
    name: str
    valuation: float
    country: str


def setup_db():
    logger.info("Creating DB...")
    # NOTE: Supply ':memory:' to create DB in RAM
    conn = sqlite3.connect('/tmp/bazel_adoption.db')

    cursor = conn.cursor()
    # Create table
    cursor.execute('''CREATE TABLE companies
                     (name text, stock_symbol text, market_cap real, adopted_bazel boolean)''')

    # Insert a row of data
    cursor.execute("INSERT INTO stocks VALUES ('2006-01-05','BUY','RHAT',100,35.14)")

    # Save (commit) the changes
    conn.commit()

    # We can also close the connection if we are done with it.
    # Just be sure any changes have been committed or they will be lost.
    conn.close()


def scrape_most_valuable_unicorns():
    article_url = "https://en.wikipedia.org/wiki/List_of_unicorn_startup_companies"
    companies = []

    response = requests.get(article_url)
    soup = bs4.BeautifulSoup(response.text, 'html.parser')

    companies_table = soup.find(
        "table",
        {"class": "wikitable sortable"}
    )

    valuation_cleaner_regex = re.compile("[^0-9.]")

    rows = companies_table.find_all("tr")
    for r in rows:
        columns = r.find_all("td")
        if columns:
            name = columns[0].text
            valuation = float(valuation_cleaner_regex.sub("", columns[1].text))
            unclean_country_txt = columns[3].text
            country = unclean_country_txt.split("/")[0].replace(" ", "")

            companies.append(
                WikiScrapedUnicorn(name=name, valuation=valuation, country=country)
            )

    print(companies)


def main():
    scrape_most_valuable_unicorns()


if __name__ == "__main__":
    main()