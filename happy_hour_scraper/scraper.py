# import libraries
import requests
from bs4 import BeautifulSoup
from urllib.parse import urlparse
import re

# specify the url
food_page = 'http://www.patspubnkc.com/specials.html'
parsed_uri = urlparse(food_page)
domain = '{uri.scheme}://{uri.netloc}/'.format(uri=parsed_uri)

searched = []

def getTimes():
    print("This is a time")

def recURLSearch(url):
    page = requests.get(url)
    pass_page = page.text
    soup = BeautifulSoup(pass_page, 'html.parser')
    page_text = str(soup).lower()

    urls = {}

    threshold = 0

    for url in soup.find_all('a', href=True):
        urls[url['href']] = url.getText()

    for url, text in urls.items():
        if "happy hour" in text.lower():
            threshold = threshold + 1
    print(page_text)
    print("////////////")
    #print(page_text.count('happy hour'))
    if page_text.count('happy hour') > threshold:
        getTimes()

    else:
        for url, text in urls.items():
            if url not in searched and "http" not in url:
                #print(url)
                searched.append(url)
                recURLSearch(domain + url)

def initSearch():
    recURLSearch(food_page)


initSearch()
