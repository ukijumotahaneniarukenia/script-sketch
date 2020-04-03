- IN

```
$cat test.tsv
apple	banana	orange
100	200	300
A	B	C
```

- CMD

```
$python3 -c 'with open("test.tsv") as f:[ print(e.strip()) for e in f.readlines() if e.strip() != ""]'
```

- OUT

```
apple	banana	orange
100	200	300
A	B	C
```

- IN

```
$cat test-nlp.txt
金縛り。
つばさしゃっか。
ほたくすたつ。
泳ぐれつあく江戸ちょさくけん。
ざんぴんハチのす投資むぜいしょうかする。
下さい壮年かんりょうてき失うふさい華やか。
きゅうりょう疾走徳川廃墟やさいかんぜん鍋。
撃つかん禍根果樹液体避けるみさき勇気。
凝固推奨ざぜん誤用つばさ恨み始まるしょうじょう店舗。
恨み歯を磨く学者たつかつ陳列室しゅしょうはりいせいしんもうす。
```

- CMD

```
$python3 -c 'with open("test-nlp.txt") as f:[ print(e.strip()) for e in f.readlines() if e.strip() != ""]'
```

- OUT

```
金縛り。
つばさしゃっか。
ほたくすたつ。
泳ぐれつあく江戸ちょさくけん。
ざんぴんハチのす投資むぜいしょうかする。
下さい壮年かんりょうてき失うふさい華やか。
きゅうりょう疾走徳川廃墟やさいかんぜん鍋。
撃つかん禍根果樹液体避けるみさき勇気。
凝固推奨ざぜん誤用つばさ恨み始まるしょうじょう店舗。
恨み歯を磨く学者たつかつ陳列室しゅしょうはりいせいしんもうす。
```
