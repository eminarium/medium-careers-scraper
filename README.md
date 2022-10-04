# Medium Careers Scraper
A simple scraper to scrape career opportunities available on Medium careers page

Class has 2 methods:


- get_positions  (Scrapes the provided url)
- print_report (Prints report for scraped positions)

### Used gems
Scraper program uses 'nokogiri' and 'HTTParty' gems

- The [Nokogiri::HTML](https://github.com/sparklemotion/nokogiri) construct takes in the opened file’s info and wraps it in a special Nokogiri data object.
- [HTTParty](https://github.com/jnunemaker/httparty) is a gem that makes HTTP fun! It is the gem our scraper will use to send an HTTP request to the page(s) we’re scraping.
