- IN

```
$cat test.json
[
  {
    "id": 1,
    "title": "Metal auxiliary Quality",
    "tag": "Investment Account",
    "updated": 1581748485,
    "crawled": 1581749225,
    "published": 1581748485,
    "url": "https://seize-Technician-Morocco"
  },
  {
    "id": 2,
    "title": "Incredible Concrete Chair",
    "tag": "Home Loan Account",
    "updated": 1581748485,
    "crawled": 1581749448,
    "published": 1581748485,
    "url": "https://Rand-Namibia-Dollar"
  },
  {
    "id": 3,
    "title": "architecture bandwidth-monitored matrix",
    "tag": "moderator calculating",
    "updated": 1581748485,
    "crawled": 1581749140,
    "published": 1581748485,
    "url": "https://deposit-grey"
  }
]
```

- CMD
  - 単一キーごとに処理してパイプで流していく
  - mapだから透過的に振る舞う

```
$cat test.json | jq '.|map(.updated|=strftime("%Y-%M-%dT%H:%M:%S"))|map(.crawled|=strftime("%Y-%M-%dT%H:%M:%S"))|map(.published|=strftime("%Y-%M-%dT%H:%M:%S"))'
```


- OUT

```
[
  {
    "id": 1,
    "title": "Metal auxiliary Quality",
    "tag": "Investment Account",
    "updated": "2020-34-15T06:34:45",
    "crawled": "2020-47-15T06:47:05",
    "published": "2020-34-15T06:34:45",
    "url": "https://seize-Technician-Morocco"
  },
  {
    "id": 2,
    "title": "Incredible Concrete Chair",
    "tag": "Home Loan Account",
    "updated": "2020-34-15T06:34:45",
    "crawled": "2020-50-15T06:50:48",
    "published": "2020-34-15T06:34:45",
    "url": "https://Rand-Namibia-Dollar"
  },
  {
    "id": 3,
    "title": "architecture bandwidth-monitored matrix",
    "tag": "moderator calculating",
    "updated": "2020-34-15T06:34:45",
    "crawled": "2020-45-15T06:45:40",
    "published": "2020-34-15T06:34:45",
    "url": "https://deposit-grey"
  }
]
```
