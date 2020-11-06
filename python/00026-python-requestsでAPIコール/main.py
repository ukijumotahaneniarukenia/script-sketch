import requests
import json

url = "https://tetsudo.rti-giken.jp/free/delay.json"

response = requests.get(url)

print(json.dumps(response.json(), ensure_ascii=False))
