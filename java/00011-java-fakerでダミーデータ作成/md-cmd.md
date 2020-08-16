
戻り値が文字列で引数の個数が0個のメソッド一覧取得

アクセス修飾子がパブリック

スタティックメソッドはマイノリティーだったため、インスタンス作成後、呼び出すような形式で

```
curl -fsSLO https://github.com/ukijumotahaneniarukenia/jardump/releases/download/4-0-0/jardump-4-0-0-SNAPSHOT.jar

curl -fsSLO https://repo1.maven.org/maven2/com/github/javafaker/javafaker/1.0.2/javafaker-1.0.2.jar

java -jar jardump-4-0-0-SNAPSHOT.jar javafaker-1.0.2.jar | grep -P 'java\.lang\.String' | awk '$4 ~ /java.lang.String/ && $7 == 0 {print $2,$3,$4,$5}' OFS="\t"
```

ローけるのぶっこぬき

- https://github.com/DiUS/java-faker

```
cd /tmp

git clone https://github.com/DiUS/java-faker.git

cd java-faker

find src/main/resources -maxdepth 1 -type f | grep yml$ | grep -Po '.*(?=\.yml)' | perl -F/ -anlE 'say @F[$#F]'|sort|xargs|ruby -anle '$F.group_by{|e|e[0]}.to_a.map{|e|puts e[0],e[1].join(",")}' | xargs -n2|sed 's/,/ /g'

a ar
b bg by
c ca ca-CAT cs-CZ
d da-DK de de-AT de-CH
e ee en en-AU en-BORK en-CA en-GB en-IND en-MS en-NEP en-NG en-NZ en-PAK en-SG en-UG en-US en-ZA en-au-ocker es es-MX
f fa fi-FI fr fr-CA fr-CH
h he hu hy
i id in-ID it
j ja
k ko
l lv
n nb-NO nl no-NO
p pl pt pt-BR
r ru
s sk sv sv-SE
t th tr
u uk
v vi
z zh-CN zh-TW
```
