```

$ java -jar nnn/target/nnn-1.0-SNAPSHOT.jar
^CUsageだよーん



$ java -jar nnn/target/nnn-1.0-SNAPSHOT.jar うんこ モリモリ 💩 moriougai 森鴎外
Usageだよーん


$ echo 'うんこ モリモリ 💩 盛岡　冷麺 moriougai 森鴎外' | java -jar nnn/target/nnn-1.0-SNAPSHOT.jar
0	[うんこ, モリモリ, 💩, 盛岡　冷麺, moriougai, 森鴎外]

$ echo 'うんこ モリモリ 💩 盛岡　冷麺 moriougai 森鴎外' | xargs -n1 | java -jar nnn/target/nnn-1.0-SNAPSHOT.jar
0	[うんこ]
1	[モリモリ]
2	[💩]
3	[盛岡　冷麺]
4	[moriougai]
5	[森鴎外]
```
