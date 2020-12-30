# script-supervisor

WEBコンソールがあるがコマンドライン上では</dev/nullしないとバッググラウンド起動ができないようなプロセスを常駐デーモン化すると便利になる

systemd-nspawnコンテナでなくてもsystemd管理できる環境であればsupervisor化できる

問題を棲み分けるためにもデフォはsystemd-nspawnコンテナで設定する

WEBコンソールなければ[これ](https://github.com/ukijumotahaneniarukenia/node-debug-method)を昇華させる

昇華させる前にGUIで試す

systemd-nspawnコンテナでもコンテナホストとは別にcronが動いたので、うまく活用する

nodejsでアクセスできるかがハンディさの見極めポイント

ポートはコンテナホストとコンテナゲスト間で一意であるようにする

Db ranking
https://db-engines.com/en/ranking/

No sql

https://hostingdata.co.uk/nosql-database/

- [✅] jupyter-notebook

- [✅] [json-server](https://www.webprofessional.jp/mock-rest-apis-using-json-server/)

- [ ] apache-solr

- [ ] rstudio-server

- [ ] monetdb(WEBコンソールあるかなければ作るか)

- [ ] Groonga(WEBコンソールあるかなければ作るか)

- [ ] Mroonga(WEBコンソールあるかなければ作るか)

- [ ] PGroonga(WEBコンソールあるかなければ作るか)

- [ ] MySQL(WEBコンソールあるかなければ作るか)

- [ ] Elasticsearch(WEBコンソールあるかなければ作るか)

- [ ] [sonic-server](https://crates.io/crates/sonic-server)(WEBコンソールあるかなければ作るか)

- [ ] [Sophinx](http://sphinxsearch.com/blog/2020/07/06/sphinx-3-3-1-released/) (WEBコンソールあるかなければ作るか)
