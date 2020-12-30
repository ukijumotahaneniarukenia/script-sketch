WEBコンソールがあるがコマンドライン上では</dev/nullしないとバッググラウンド起動ができないようなプロセスを常駐デーモン化すると便利になりそう

WEBコンソールがなければ探す

探してなければ作成する

systemd-nspawnコンテナでなくてもsystemd管理できる環境であればsupervisor化できる

問題を棲み分けるためにもデフォはsystemd-nspawnコンテナで設定する

systemd-nspawnコンテナでもコンテナホストとは別にcronが動いたので、うまく活用できそう

ポートはコンテナホストとコンテナゲスト間で一意であるようにする

Db ranking
- https://db-engines.com/en/ranking/

No sql
- https://hostingdata.co.uk/nosql-database/

- [✅] jupyter-notebook

- [✅] [json-server](https://www.webprofessional.jp/mock-rest-apis-using-json-server/)

- [ ] apache-solr

- [ ] rstudio-server

- [ ] monetdb

- [ ] Groonga

- [ ] Mroonga

- [ ] PGroonga

- [ ] MySQL

- [ ] Elasticsearch

- [ ] [sonic-server](https://crates.io/crates/sonic-server)

- [ ] [Sophinx](http://sphinxsearch.com/blog/2020/07/06/sphinx-3-3-1-released/)
