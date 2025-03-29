#!/usr/bin/env python3

from urllib.request import urlopen
import json
import sys

# Get the json data
url = "https://space.fmi.fi/MIRACLE/RWC/data/r_index_latest_en.json"

response = urlopen(url)
data = response.read().decode("utf-8")
json_data = json.loads(data)

# Get the different cities
city_number = int(sys.argv[1])
cities = []
for city_code in json_data["data"]:
    cities.append(city_code)

city_code = cities[city_number]

# Get the probability of the auroras
probability = json_data["data"][city_code]["Probability of auroras"]
probability = probability.split(' ', 1)[0].lower()

# Get the city name
city_name = json_data["data"][city_code]["Station"]

out_data = { 
    "text": f"{city_name}",
    "tooltip": f"{city_name}",
    "alt": f"{probability}",
    "class": f"{probability}",
}

print(json.dumps(out_data))


