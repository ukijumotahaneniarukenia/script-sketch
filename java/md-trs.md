# 1

- 事象
  - 意図せず消してしまった
```
elasticsearch@ed6e5fe8105a ~/script-sketch$git reset
Unstaged changes after reset:
D	java/bin/xml2json
D	java/java-crawler/.gitignore
D	java/java-crawler/JAR-INF/META-INF/MANIFEST.MF
D	java/java-crawler/manual.md
D	java/java-crawler/pom.xml
D	java/java-crawler/src/app/MyCrawler.java
D	java/java-detect-encoding/.gitignore
D	java/java-detect-encoding/JAR-INF/META-INF/MANIFEST.MF
D	java/java-detect-encoding/manual.md
D	java/java-detect-encoding/pom.xml
D	java/java-detect-encoding/src/app/DetectEnc.java
D	java/java-normalize/.gitignore
D	java/java-normalize/JAR-INF/META-INF/MANIFEST.MF
D	java/java-normalize/manual.md
D	java/java-normalize/src/app/Full2Half.java
D	java/java-normalize/src/app/Half2Full.java
D	java/java-normalize/test.txt
```

直前のコミットから戻して

```
elasticsearch@ed6e5fe8105a ~/script-sketch$git reset | tail -n+2 | awk '{print $2}' | xargs -I@ echo git checkout HEAD @
git checkout HEAD java/bin/xml2json
git checkout HEAD java/java-crawler/.gitignore
git checkout HEAD java/java-crawler/JAR-INF/META-INF/MANIFEST.MF
git checkout HEAD java/java-crawler/manual.md
git checkout HEAD java/java-crawler/pom.xml
git checkout HEAD java/java-crawler/src/app/MyCrawler.java
git checkout HEAD java/java-detect-encoding/.gitignore
git checkout HEAD java/java-detect-encoding/JAR-INF/META-INF/MANIFEST.MF
git checkout HEAD java/java-detect-encoding/manual.md
git checkout HEAD java/java-detect-encoding/pom.xml
git checkout HEAD java/java-detect-encoding/src/app/DetectEnc.java
git checkout HEAD java/java-normalize/.gitignore
git checkout HEAD java/java-normalize/JAR-INF/META-INF/MANIFEST.MF
git checkout HEAD java/java-normalize/manual.md
git checkout HEAD java/java-normalize/src/app/Full2Half.java
git checkout HEAD java/java-normalize/src/app/Half2Full.java
git checkout HEAD java/java-normalize/test.txt
```

良さげだったら実行

```
elasticsearch@ed6e5fe8105a ~/script-sketch$git reset | tail -n+2 | awk '{print $2}' | xargs -I@ echo git checkout HEAD @ | sh
```
