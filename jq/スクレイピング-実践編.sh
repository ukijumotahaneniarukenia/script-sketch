#!/bin/bash


#curl -s -H 'Authorization: Bearer A9pkpfplWP7jE2LphCjPK9xGpsVV4LalMSv9yBAVN8fk4FvR0qfvbAuQJrvn7ZhafJj4fyN_ZTyfC6edKRQpmHOqYx0gMPmGojHeMOc3PoOXdd1P_t3sx4piQPyBFAaITqzwOSxK-e9w7XN9mLo4WE3OALLiarVqMSgTIOPhwLuu4Z5OPqodfKTdnSqJTs9tHv4AslNBa7PJFZrF5mNe8JkVUe1h0yvOCCHFvRetevCz3g:feedly' https://cloud.feedly.com/v3/streams/user%2F26c34d27-f858-40be-89a3-527fa5cb76ef%2Fcategory%2FProgramming/contents?count=2 | jq -c --stream 'select(length==2)|{key:.[0]|join("."),value:.[1]}' | jq -s -c '.[]|select(.key|test("items\\.[0-9]\\.(title|id|htmlUrl|origin\\.htmlUrl|origin\\.title|crawled|summary\\.content|published|alternate\\.[0-9]{1,}\\.href|categories\\.[0-9]{1,}\\.id)"))' | jq -s 'from_entries'



ACESS_TOKEN='A9pkpfplWP7jE2LphCjPK9xGpsVV4LalMSv9yBAVN8fk4FvR0qfvbAuQJrvn7ZhafJj4fyN_ZTyfC6edKRQpmHOqYx0gMPmGojHeMOc3PoOXdd1P_t3sx4piQPyBFAaITqzwOSxK-e9w7XN9mLo4WE3OALLiarVqMSgTIOPhwLuu4Z5OPqodfKTdnSqJTs9tHv4AslNBa7PJFZrF5mNe8JkVUe1h0yvOCCHFvRetevCz3g:feedly'


STREAM_ID=user%2F26c34d27-f858-40be-89a3-527fa5cb76ef%2Fcategory%2FProgramming


REGEXP="items\\.[0-9]\\.(title|id|htmlUrl|origin\\.htmlUrl|origin\\.title|crawled|summary\\.content|published|alternate\\.[0-9]{1,}\\.href|categories\\.[0-9]{1,}\\.id"


curl -s -H "Authorization: Bearer $ACCESS_TOKEN" https://cloud.feedly.com/v3/streams/$STREAM_ID/contents?count=2 | jq -c --stream 'select(length==2)|{key:.[0]|join("."),value:.[1]}' #| \
#jq -s -c ".[]|select(.key|test("$REGEXP"))" | \
#jq -s 'from_entries'


{
  "items.0.id": "o4c78CJ7GRAjsoP/B6cRtDxUlCNgoXrxoDqXv9xTIBc=_17048fcbb4a:c598b0f:31d4c877",
  "items.0.title": "Androidスマホでホーム画面の左にあるGoogle Discoverを非表示にする方法",
  "items.0.summary.content": "比較的に新しい機種のホーム画面には、メインとなるホーム画面の左側（一番左）に “Google（Discover/フィード）” が表示されていることがありますが、これは好みに応じて非表示にすることも可能です。",
  "items.0.alternate.0.href": "https://novlog.me/android/apk-google-disable/",
  "items.0.crawled": 1581772487498,
  "items.0.published": 1581771762000,
  "items.0.origin.title": "Menthas #all",
  "items.0.origin.htmlUrl": "https://menthas.com",
  "items.0.categories.0.id": "user/26c34d27-f858-40be-89a3-527fa5cb76ef/category/Programming",
  "items.1.id": "o4c78CJ7GRAjsoP/B6cRtDxUlCNgoXrxoDqXv9xTIBc=_17048fcbb4a:c598b0e:31d4c877",
  "items.1.title": "Open RadarのようにAppleへのフィードバックを公開できるGitHubリポジトリ「Open Feedback Assistant」が公開。",
  "items.1.summary.content": "Open Radarのように、Appleに投稿したバグレポートを公開するためのGitHubリポジトリ「Open Feedback Assistant」を元Googleのエンジニアで現在フルタイムでオープンソースに貢献しているSindre Sorhusさんが公開しています。",
  "items.1.alternate.0.href": "https://applech2.com/archives/20200215-open-feedback-assistant-for-apple.html",
  "items.1.crawled": 1581772487498,
  "items.1.published": 1581771758000,
  "items.1.origin.title": "Menthas #all",
  "items.1.origin.htmlUrl": "https://menthas.com",
  "items.1.categories.0.id": "user/26c34d27-f858-40be-89a3-527fa5cb76ef/category/Programming"
}

