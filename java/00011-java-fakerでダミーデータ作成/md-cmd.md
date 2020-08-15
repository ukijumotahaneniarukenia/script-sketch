
戻り値が文字列で引数の個数が0個のメソッド一覧取得

アクセス修飾子がパブリック

スタティックメソッドはマイノリティーだったため、インスタンス作成後、呼び出すような形式で

```
curl -fsSLO https://github.com/ukijumotahaneniarukenia/jardump/releases/download/4-0-0/jardump-4-0-0-SNAPSHOT.jar

curl -fsSLO https://repo1.maven.org/maven2/com/github/javafaker/javafaker/1.0.2/javafaker-1.0.2.jar

java -jar jardump-4-0-0-SNAPSHOT.jar javafaker-1.0.2.jar | grep -P 'java\.lang\.String' | awk '$4 ~ /java.lang.String/ && $7 == 0 {print $2,$3,$4,$5}' OFS="\t"
```
