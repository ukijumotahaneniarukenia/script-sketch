```
kuraine@71ecc4cebf8f ~/script-sketch/jq$cat non-flat.json | jq '.[].items'
[
  {
    "key": "items-id",
    "value": "o4c78CJ7GRAjsoP/B6cRtDxUlCNgoXrxoDqXv9xTIBc=_17048fcbb4a:c598b0e:31d4c877"
  },
  {
    "key": "items-title",
    "value": "Open RadarのようにAppleへのフィードバックを公開できるGitHubリポジトリ「Open Feedback Assistant」が公開。"
  },
  {
    "key": "items-summary-content",
    "value": "Open Radarのように、Appleに投稿したバグレポートを公開するためのGitHubリポジトリ「Open Feedback Assistant」を元Googleのエンジニアで現在フルタイムでオープンソースに貢献しているSindre Sorhusさんが公開しています。"
  },
  {
    "key": "items-alternate-href",
    "value": "https://applech2.com/archives/20200215-open-feedback-assistant-for-apple.html"
  },
  {
    "key": "items-crawled",
    "value": 1581772487498
  },
  {
    "key": "items-published",
    "value": 1581771758000
  },
  {
    "key": "items-origin-title",
    "value": "Menthas #all"
  },
  {
    "key": "items-origin-htmlUrl",
    "value": "https://menthas.com"
  },
  {
    "key": "items-categories-id",
    "value": "user/26c34d27-f858-40be-89a3-527fa5cb76ef/category/Programming"
  }
]
kuraine@71ecc4cebf8f ~/script-sketch/jq$cat non-flat.json | jq '.[].items|from_entries'
{
  "items-id": "o4c78CJ7GRAjsoP/B6cRtDxUlCNgoXrxoDqXv9xTIBc=_17048fcbb4a:c598b0e:31d4c877",
  "items-title": "Open RadarのようにAppleへのフィードバックを公開できるGitHubリポジトリ「Open Feedback Assistant」が公開。",
  "items-summary-content": "Open Radarのように、Appleに投稿したバグレポートを公開するためのGitHubリポジトリ「Open Feedback Assistant」を元Googleのエンジニアで現在フルタイムでオープンソースに貢献しているSindre Sorhusさんが公開しています。",
  "items-alternate-href": "https://applech2.com/archives/20200215-open-feedback-assistant-for-apple.html",
  "items-crawled": 1581772487498,
  "items-published": 1581771758000,
  "items-origin-title": "Menthas #all",
  "items-origin-htmlUrl": "https://menthas.com",
  "items-categories-id": "user/26c34d27-f858-40be-89a3-527fa5cb76ef/category/Programming"
}
```
