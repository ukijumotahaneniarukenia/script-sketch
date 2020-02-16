```
cat test.json | jq  'to_entries|map({"grp":.key|gsub("[a-zA-Z]{1,}";"")|gsub("^\\.";"")|gsub("\\..*";""),"item":
item))'
[
  {
    "grp": "0",
    "items-id": "o4c78CJ7GRAjsoP/B6cRtDxUlCNgoXrxoDqXv9xTIBc=_17048fcbb4a:c598b0f:31d4c877",
    "items-title": "Androidスマホでホーム画面の左にあるGoogle Discoverを非表示にする方法",
    "items-summary-content": "比較的に新しい機種のホーム画面には、メインとなるホーム画面の左側（一番左）に “Google（Discover/フィード）” が表示されていることがありますが、これは好みに応じて非表示にすることも可能です。",
    "items-alternate-href": "https://novlog.me/android/apk-google-disable/",
    "items-crawled": 1581772487498,
    "items-published": 1581771762000,
    "items-origin-title": "Menthas #all",
    "items-origin-htmlUrl": "https://menthas.com",
    "items-categories-id": "user/26c34d27-f858-40be-89a3-527fa5cb76ef/category/Programming"
  },
  {
    "grp": "1",
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
]
```
