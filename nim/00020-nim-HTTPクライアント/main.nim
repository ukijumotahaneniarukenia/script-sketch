import httpclient
import json

const url = "https://ja.wikipedia.org/wiki/特別:新着ファイル"

var client = newHttpClient()
var response = client.get(url)

echo response.body
