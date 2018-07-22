from flask import Flask, Response, jsonify
import requests
import json
import os

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello World!'

@app.route('/all')
def list_happy_hour_pages():
    restaurants = {}
    if not os.path.exists('server/data/list.json'):
        
        data = search_four_square("bar")
        with open('server/data/list.json', 'w+') as f:
            json.dump(data, f, indent=4)
    else:
        with open('server/data/list.json', 'r') as f:
            data = json.load(f)
    for venue in data["response"]["venues"]:
        restaurants[venue["id"]] = {
            "name": venue["name"],
            "latlong": str(venue["location"]["lat"]) + "," + str(venue["location"]["lng"]),
            "location": ",".join(venue["location"]["formattedAddress"][:2])
        }
    r = jsonify(restaurants)
    r.status_code = 200

    return r

def search_four_square(query):
    url = 'https://api.foursquare.com/v2/venues/search'

    params = dict(
        client_id='HD3RI1T40PMLHC0XZ10LV3AXZYFG1XMGPA00FLZ5Q1Y4AH0F ',
        client_secret='5FSV3FWX134JYGR5LNGO3CFEEZLBCXKGO20KFR3UNYHJD03D',
        ll='39.1369717,-94.5821201',
        limit=20,
        radius=16000,
        query='{}'.format(query),
        v='20180721',
        categoryId='4d4b7105d754a06374d81259,4d4b7105d754a06376d81259'
    )

    resp = requests.get(url=url, params=params)
    return resp.json()

@app.route('/<venue_id>')
def get_venue_details(venue_id):
    path = 'server/data/venues/{}.json'.format(venue_id)
    if not os.path.exists(path):
        data = search_venue_id(venue_id)
        with open(path, 'w+') as f:
            json.dump(data, f, indent=4)
    else:
        with open(path, 'r') as f:
            data = json.load(f)
    
    venue = data["response"]["venue"]

    useful_data = {
        "id": venue_id,
        "name": venue["name"],
        "lat": venue["location"]["lat"],
        "lng": venue["location"]["lng"]
    }

    if "price" in list(venue.keys()):
        useful_data["price"] = venue["price"]["currency"] * venue["price"]["tier"]

    if "rating" in list(venue.keys()):
        useful_data["rating"] = venue["rating"]

    if "url" in list(venue.keys()):
        useful_data["url"] = venue["url"]

    r = jsonify(useful_data)
    r.status_code = 200
    return r

def search_venue_id(venue_id):
    url = 'https://api.foursquare.com/v2/venues/{}'.format(venue_id)

    params = dict(
        client_id='HD3RI1T40PMLHC0XZ10LV3AXZYFG1XMGPA00FLZ5Q1Y4AH0F ',
        client_secret='5FSV3FWX134JYGR5LNGO3CFEEZLBCXKGO20KFR3UNYHJD03D',
        v='20180721'
    )

    resp = requests.get(url=url, params=params)
    return resp.json()

if __name__=='__main__':
    app.run()
