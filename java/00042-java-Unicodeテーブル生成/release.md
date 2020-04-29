# ポータブル化

```
cd 00042-java-Unicodeテーブル生成/nnn/

mvn clean package

cp target/nnn-1.0-SNAPSHOT-bin.zip ../../

cd ../../

export alias unidat="java -jar $HOME/script-sketch/java/nnn-1.0-SNAPSHOT/nnn-1.0-SNAPSHOT.jar">>~/.bashrc

source ~/.bashrc
```

# 使用

  - unidatと打てばhelp出る

```
unidat
```
  - --helpとしても出る
```
unidat --help
```
