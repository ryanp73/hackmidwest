# import libraries
import requests
from bs4 import BeautifulSoup
from urllib.parse import urlparse
import re
import random

# specify the url
#food_page = 'http://caddyshackkc.com/Happy_Hour_.html' #bad
#food_page = 'https://therecordbar.com'
#food_page = 'https://www.johnnystavern.com/locations/johnnys-olathe/'
food_page = 'https://www.trezomare.com/'
parsed_uri = urlparse(food_page)
domain = '{uri.scheme}://{uri.netloc}'.format(uri=parsed_uri)

searched = []

def getTimes(page_text):
    hhour_index = [m.start() for m in re.finditer('happy hour', page_text)]

    DAY = ['mon', 'tue', 'wed', 'thur', 'fri', 'sat', 'sun', 'every']
    TIME = ['am', 'pm', 'a.m', 'p.m']

    time_possibilities = []

    for integer in range(0, 13):
        time_possibilities.append(str(integer))
        time_possibilities.append(str(integer) + 'am')
        time_possibilities.append(str(integer) + ':30' + 'am')
        time_possibilities.append(str(integer) + ':00' + 'am')

        time_possibilities.append(str(integer) + 'a.m.')
        time_possibilities.append(str(integer) + ':30' + 'a.m.')
        time_possibilities.append(str(integer) + ':00' + 'a.m.')

        time_possibilities.append(str(integer) + 'pm')
        time_possibilities.append(str(integer) + ':30' + 'pm')
        time_possibilities.append(str(integer) + ':00' + 'pm')

        time_possibilities.append(str(integer) + 'p.m.')
        time_possibilities.append(str(integer) + ':30' + 'p.m.')
        time_possibilities.append(str(integer) + ':00' + 'p.m.')

        time_possibilities.append(str(integer) + ' am')
        time_possibilities.append(str(integer) + ':30' + ' am')
        time_possibilities.append(str(integer) + ':00' + ' am')

        time_possibilities.append(str(integer) + ' a.m.')
        time_possibilities.append(str(integer) + ':30' + ' a.m.')
        time_possibilities.append(str(integer) + ':00' + ' a.m.')

        time_possibilities.append(str(integer) + ' pm')
        time_possibilities.append(str(integer) + ':30' + ' pm')
        time_possibilities.append(str(integer) + ':00' + ' pm')

        time_possibilities.append(str(integer) + ' p.m.')
        time_possibilities.append(str(integer) + ':30' + ' p.m.')
        time_possibilities.append(str(integer) + ':00' + ' p.m.')

    day_indices = []
    time_indices = []

    for day in DAY:
        dayIndices = [m.start() for m in re.finditer(day, page_text)]
        for index in dayIndices:
            day_indices.append(index)

    for time in time_possibilities:
        timeIndices = [m.start() for m in re.finditer(time, page_text)]
        for index in timeIndices:
            time_indices.append(index)

    day_indices.sort()
    time_indices.sort()
    #print(hhour_index)
    #print(day_indices)
    #print(time_indices)

    day_index = -1
    time_index = -1
    main_index = -1

    for index in day_indices:
        if index > hhour_index[0]:
            day_index = index
            break

    for index in time_indices:
        if index > hhour_index[0]:
            time_index = index
            break

    if day_index > time_index:
        main_index = day_index

    else:
        main_index = time_index

    word = ''
    word2 = ''
    time = ''

    if page_text[day_index] is 'm' and page_text[day_index + 1] is 'o':
        word = 'Monday'
    elif page_text[day_index] is 't' and page_text[day_index + 1] is 'u':
        word = 'Tuesday'
    elif page_text[day_index] is 'w' and page_text[day_index + 1] is 'e':
        word = 'Wednesday'
    elif page_text[day_index] is 't' and page_text[day_index + 1] is 'h':
        word = 'Thursday'
    elif page_text[day_index] is 'f' and page_text[day_index + 1] is 'r':
        word = 'Friday'
    elif page_text[day_index] is 's' and page_text[day_index + 1] is 'a':
        word = 'Saturday'
    elif page_text[day_index] is 's' and page_text[day_index + 1] is 'u':
        word = 'Sunday'
    elif page_text[day_index] is 'e' and page_text[day_index + 1] is 'v':
        word = 'Everyday'

    if page_text[day_indices[day_indices.index(day_index) + 1]] is 'm' and page_text[day_indices[day_indices.index(day_index) + 1] + 1] is 'o':
        word2 = 'Monday'
    elif page_text[day_indices[day_indices.index(day_index) + 1]] is 't' and page_text[day_indices[day_indices.index(day_index) + 1] + 1] is 'u':
        word2 = 'Tuesday'
    elif page_text[day_indices[day_indices.index(day_index) + 1]] is 'w' and page_text[day_indices[day_indices.index(day_index) + 1] + 1] is 'e':
        word2 = 'Wednesday'
    elif page_text[day_indices[day_indices.index(day_index) + 1]] is 't' and page_text[day_indices[day_indices.index(day_index) + 1] + 1] is 'h':
        word2 = 'Thursday'
    elif page_text[day_indices[day_indices.index(day_index) + 1]] is 'f' and page_text[day_indices[day_indices.index(day_index) + 1] + 1] is 'r':
        word2 = 'Friday'
    elif page_text[day_indices[day_indices.index(day_index) + 1]] is 's' and page_text[day_indices[day_indices.index(day_index) + 1] + 1] is 'a':
        word2 = 'Saturday'
    elif page_text[day_indices[day_indices.index(day_index) + 1]] is 's' and page_text[day_indices[day_indices.index(day_index) + 1] + 1] is 'u':
        word2 = 'Sunday'
    elif page_text[day_indices[day_indices.index(day_index) + 1]] is 'e' and page_text[day_indices[day_indices.index(day_index) + 1] + 1] is 'v':
        word2 = 'Everyday'

    #print(page_text[day_indices[day_indices.index(day_index) + 1]])
    #print(page_text[day_indices[day_index+1]])

    allTimes = []

    #print(page_text[(time_index-8):(time_index+16)])

    for time in time_possibilities:
        if time in page_text[(time_index-8):(time_index+16)]:
            allTimes.append(time)
    #print(allTimes)
    reducedTimes = allTimes
    #print(reducedTimes)
    finalTimes = []

    # for i in range(0, len(reducedTimes)):
    #     for j in range(0, len(reducedTimes)):
    #         if reducedTimes[i] in reducedTimes[j] and len(reducedTimes[i]) < len(reducedTimes[j]):
    #             reducedTimes.pop(i)

    #startTime = random.randint(1,4)
    #endTime = random.randint(startTime + 1, 8)

    for time in reducedTimes:
        for oTime in reducedTimes:
            if time in oTime and len(time) < len(oTime):
                reducedTimes.remove(time)
    print(word, word2, reducedTimes)


def recURLSearch(url):
    page = requests.get(url)
    pass_page = page.text
    soup = BeautifulSoup(pass_page, 'html.parser')
    page_text = str(soup).lower()
    print(url)
    urls = {}

    threshold = 0

    for url1 in soup.find_all('a', href=True):
        urls[url1['href']] = url1.getText()

    for url1, text in urls.items():
        if "happy hour" in text.lower():
            threshold = threshold + 1
    #print(page_text)
    #print("////////////")
    #print(page_text.count('happy hour'))
    if page_text.count('happy hour') > threshold:
        getTimes(page_text)

    else:
        for url2, text in urls.items():
            if url2 not in searched and "http" not in url2 and '@' not in url2:
                print(url2)
                searched.append(url2)
                recURLSearch(domain + url2)

def initSearch():
    recURLSearch(food_page)

initSearch()
