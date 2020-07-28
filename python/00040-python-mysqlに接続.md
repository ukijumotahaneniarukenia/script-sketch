# 01-sqlalchemy-setting.py

参考文献
- https://www.m3tech.blog/entry/sqlalchemy-tutorial#SQLAlchemy-%E3%81%AE%E4%BD%BF%E3%81%84%E6%96%B9%E5%AE%9F%E8%A1%8C%E7%B7%A8
- https://qiita.com/tomo0/items/a762b1bc0f192a55eae8#%E3%81%BE%E3%81%9Asession%E3%81%AE%E4%BD%9C%E6%88%90settingpy
- https://qiita.com/xfan/items/f2c88aeb0d3945ed4775


```python
from sqlalchemy import create_engine
engine = create_engine('mysql://root:Mysql3306@localhost/sakila')
```

```
pip install sqlalchemy
pip install mysqlclient
```

Mysqlに接続

```python
from sqlalchemy import create_engine

engine = create_engine('mysql://root:Mysql3306@localhost/sakila')

result = engine.execute("select * from actor")

for row in result:
    print(row)
```


<details><summary>開く</summary><div>

```
python .\01-sqlalchemy-setting.py
(1, 'PENELOPE', 'GUINESS', datetime.datetime(2006, 2, 15, 4, 34, 33))
(2, 'NICK', 'WAHLBERG', datetime.datetime(2006, 2, 15, 4, 34, 33))
(3, 'ED', 'CHASE', datetime.datetime(2006, 2, 15, 4, 34, 33))
(4, 'JENNIFER', 'DAVIS', datetime.datetime(2006, 2, 15, 4, 34, 33))
(5, 'JOHNNY', 'LOLLOBRIGIDA', datetime.datetime(2006, 2, 15, 4, 34, 33))
(6, 'BETTE', 'NICHOLSON', datetime.datetime(2006, 2, 15, 4, 34, 33))
(7, 'GRACE', 'MOSTEL', datetime.datetime(2006, 2, 15, 4, 34, 33))
(8, 'MATTHEW', 'JOHANSSON', datetime.datetime(2006, 2, 15, 4, 34, 33))
(9, 'JOE', 'SWANK', datetime.datetime(2006, 2, 15, 4, 34, 33))
(10, 'CHRISTIAN', 'GABLE', datetime.datetime(2006, 2, 15, 4, 34, 33))
(11, 'ZERO', 'CAGE', datetime.datetime(2006, 2, 15, 4, 34, 33))
(12, 'KARL', 'BERRY', datetime.datetime(2006, 2, 15, 4, 34, 33))
(13, 'UMA', 'WOOD', datetime.datetime(2006, 2, 15, 4, 34, 33))
(14, 'VIVIEN', 'BERGEN', datetime.datetime(2006, 2, 15, 4, 34, 33))
(15, 'CUBA', 'OLIVIER', datetime.datetime(2006, 2, 15, 4, 34, 33))
(16, 'FRED', 'COSTNER', datetime.datetime(2006, 2, 15, 4, 34, 33))
(17, 'HELEN', 'VOIGHT', datetime.datetime(2006, 2, 15, 4, 34, 33))
(18, 'DAN', 'TORN', datetime.datetime(2006, 2, 15, 4, 34, 33))
(19, 'BOB', 'FAWCETT', datetime.datetime(2006, 2, 15, 4, 34, 33))
(20, 'LUCILLE', 'TRACY', datetime.datetime(2006, 2, 15, 4, 34, 33))
(21, 'KIRSTEN', 'PALTROW', datetime.datetime(2006, 2, 15, 4, 34, 33))
(22, 'ELVIS', 'MARX', datetime.datetime(2006, 2, 15, 4, 34, 33))
(23, 'SANDRA', 'KILMER', datetime.datetime(2006, 2, 15, 4, 34, 33))
(24, 'CAMERON', 'STREEP', datetime.datetime(2006, 2, 15, 4, 34, 33))
(25, 'KEVIN', 'BLOOM', datetime.datetime(2006, 2, 15, 4, 34, 33))
(26, 'RIP', 'CRAWFORD', datetime.datetime(2006, 2, 15, 4, 34, 33))
(27, 'JULIA', 'MCQUEEN', datetime.datetime(2006, 2, 15, 4, 34, 33))
(28, 'WOODY', 'HOFFMAN', datetime.datetime(2006, 2, 15, 4, 34, 33))
(29, 'ALEC', 'WAYNE', datetime.datetime(2006, 2, 15, 4, 34, 33))
(30, 'SANDRA', 'PECK', datetime.datetime(2006, 2, 15, 4, 34, 33))
(31, 'SISSY', 'SOBIESKI', datetime.datetime(2006, 2, 15, 4, 34, 33))
(32, 'TIM', 'HACKMAN', datetime.datetime(2006, 2, 15, 4, 34, 33))
(33, 'MILLA', 'PECK', datetime.datetime(2006, 2, 15, 4, 34, 33))
(34, 'AUDREY', 'OLIVIER', datetime.datetime(2006, 2, 15, 4, 34, 33))
(35, 'JUDY', 'DEAN', datetime.datetime(2006, 2, 15, 4, 34, 33))
(36, 'BURT', 'DUKAKIS', datetime.datetime(2006, 2, 15, 4, 34, 33))
(37, 'VAL', 'BOLGER', datetime.datetime(2006, 2, 15, 4, 34, 33))
(38, 'TOM', 'MCKELLEN', datetime.datetime(2006, 2, 15, 4, 34, 33))
(39, 'GOLDIE', 'BRODY', datetime.datetime(2006, 2, 15, 4, 34, 33))
(40, 'JOHNNY', 'CAGE', datetime.datetime(2006, 2, 15, 4, 34, 33))
(41, 'JODIE', 'DEGENERES', datetime.datetime(2006, 2, 15, 4, 34, 33))
(42, 'TOM', 'MIRANDA', datetime.datetime(2006, 2, 15, 4, 34, 33))
(43, 'KIRK', 'JOVOVICH', datetime.datetime(2006, 2, 15, 4, 34, 33))
(44, 'NICK', 'STALLONE', datetime.datetime(2006, 2, 15, 4, 34, 33))
(45, 'REESE', 'KILMER', datetime.datetime(2006, 2, 15, 4, 34, 33))
(46, 'PARKER', 'GOLDBERG', datetime.datetime(2006, 2, 15, 4, 34, 33))
(47, 'JULIA', 'BARRYMORE', datetime.datetime(2006, 2, 15, 4, 34, 33))
(48, 'FRANCES', 'DAY-LEWIS', datetime.datetime(2006, 2, 15, 4, 34, 33))
(49, 'ANNE', 'CRONYN', datetime.datetime(2006, 2, 15, 4, 34, 33))
(50, 'NATALIE', 'HOPKINS', datetime.datetime(2006, 2, 15, 4, 34, 33))
(51, 'GARY', 'PHOENIX', datetime.datetime(2006, 2, 15, 4, 34, 33))
(52, 'CARMEN', 'HUNT', datetime.datetime(2006, 2, 15, 4, 34, 33))
(53, 'MENA', 'TEMPLE', datetime.datetime(2006, 2, 15, 4, 34, 33))
(54, 'PENELOPE', 'PINKETT', datetime.datetime(2006, 2, 15, 4, 34, 33))
(55, 'FAY', 'KILMER', datetime.datetime(2006, 2, 15, 4, 34, 33))
(56, 'DAN', 'HARRIS', datetime.datetime(2006, 2, 15, 4, 34, 33))
(57, 'JUDE', 'CRUISE', datetime.datetime(2006, 2, 15, 4, 34, 33))
(58, 'CHRISTIAN', 'AKROYD', datetime.datetime(2006, 2, 15, 4, 34, 33))
(59, 'DUSTIN', 'TAUTOU', datetime.datetime(2006, 2, 15, 4, 34, 33))
(60, 'HENRY', 'BERRY', datetime.datetime(2006, 2, 15, 4, 34, 33))
(61, 'CHRISTIAN', 'NEESON', datetime.datetime(2006, 2, 15, 4, 34, 33))
(62, 'JAYNE', 'NEESON', datetime.datetime(2006, 2, 15, 4, 34, 33))
(63, 'CAMERON', 'WRAY', datetime.datetime(2006, 2, 15, 4, 34, 33))
(64, 'RAY', 'JOHANSSON', datetime.datetime(2006, 2, 15, 4, 34, 33))
(65, 'ANGELA', 'HUDSON', datetime.datetime(2006, 2, 15, 4, 34, 33))
(66, 'MARY', 'TANDY', datetime.datetime(2006, 2, 15, 4, 34, 33))
(67, 'JESSICA', 'BAILEY', datetime.datetime(2006, 2, 15, 4, 34, 33))
(68, 'RIP', 'WINSLET', datetime.datetime(2006, 2, 15, 4, 34, 33))
(69, 'KENNETH', 'PALTROW', datetime.datetime(2006, 2, 15, 4, 34, 33))
(70, 'MICHELLE', 'MCCONAUGHEY', datetime.datetime(2006, 2, 15, 4, 34, 33))
(71, 'ADAM', 'GRANT', datetime.datetime(2006, 2, 15, 4, 34, 33))
(72, 'SEAN', 'WILLIAMS', datetime.datetime(2006, 2, 15, 4, 34, 33))
(73, 'GARY', 'PENN', datetime.datetime(2006, 2, 15, 4, 34, 33))
(74, 'MILLA', 'KEITEL', datetime.datetime(2006, 2, 15, 4, 34, 33))
(75, 'BURT', 'POSEY', datetime.datetime(2006, 2, 15, 4, 34, 33))
(76, 'ANGELINA', 'ASTAIRE', datetime.datetime(2006, 2, 15, 4, 34, 33))
(77, 'CARY', 'MCCONAUGHEY', datetime.datetime(2006, 2, 15, 4, 34, 33))
(78, 'GROUCHO', 'SINATRA', datetime.datetime(2006, 2, 15, 4, 34, 33))
(79, 'MAE', 'HOFFMAN', datetime.datetime(2006, 2, 15, 4, 34, 33))
(80, 'RALPH', 'CRUZ', datetime.datetime(2006, 2, 15, 4, 34, 33))
(81, 'SCARLETT', 'DAMON', datetime.datetime(2006, 2, 15, 4, 34, 33))
(82, 'WOODY', 'JOLIE', datetime.datetime(2006, 2, 15, 4, 34, 33))
(83, 'BEN', 'WILLIS', datetime.datetime(2006, 2, 15, 4, 34, 33))
(84, 'JAMES', 'PITT', datetime.datetime(2006, 2, 15, 4, 34, 33))
(85, 'MINNIE', 'ZELLWEGER', datetime.datetime(2006, 2, 15, 4, 34, 33))
(86, 'GREG', 'CHAPLIN', datetime.datetime(2006, 2, 15, 4, 34, 33))
(87, 'SPENCER', 'PECK', datetime.datetime(2006, 2, 15, 4, 34, 33))
(88, 'KENNETH', 'PESCI', datetime.datetime(2006, 2, 15, 4, 34, 33))
(89, 'CHARLIZE', 'DENCH', datetime.datetime(2006, 2, 15, 4, 34, 33))
(90, 'SEAN', 'GUINESS', datetime.datetime(2006, 2, 15, 4, 34, 33))
(91, 'CHRISTOPHER', 'BERRY', datetime.datetime(2006, 2, 15, 4, 34, 33))
(92, 'KIRSTEN', 'AKROYD', datetime.datetime(2006, 2, 15, 4, 34, 33))
(93, 'ELLEN', 'PRESLEY', datetime.datetime(2006, 2, 15, 4, 34, 33))
(94, 'KENNETH', 'TORN', datetime.datetime(2006, 2, 15, 4, 34, 33))
(95, 'DARYL', 'WAHLBERG', datetime.datetime(2006, 2, 15, 4, 34, 33))
(96, 'GENE', 'WILLIS', datetime.datetime(2006, 2, 15, 4, 34, 33))
(97, 'MEG', 'HAWKE', datetime.datetime(2006, 2, 15, 4, 34, 33))
(98, 'CHRIS', 'BRIDGES', datetime.datetime(2006, 2, 15, 4, 34, 33))
(99, 'JIM', 'MOSTEL', datetime.datetime(2006, 2, 15, 4, 34, 33))
(100, 'SPENCER', 'DEPP', datetime.datetime(2006, 2, 15, 4, 34, 33))
(101, 'SUSAN', 'DAVIS', datetime.datetime(2006, 2, 15, 4, 34, 33))
(102, 'WALTER', 'TORN', datetime.datetime(2006, 2, 15, 4, 34, 33))
(103, 'MATTHEW', 'LEIGH', datetime.datetime(2006, 2, 15, 4, 34, 33))
(104, 'PENELOPE', 'CRONYN', datetime.datetime(2006, 2, 15, 4, 34, 33))
(105, 'SIDNEY', 'CROWE', datetime.datetime(2006, 2, 15, 4, 34, 33))
(106, 'GROUCHO', 'DUNST', datetime.datetime(2006, 2, 15, 4, 34, 33))
(107, 'GINA', 'DEGENERES', datetime.datetime(2006, 2, 15, 4, 34, 33))
(108, 'WARREN', 'NOLTE', datetime.datetime(2006, 2, 15, 4, 34, 33))
(109, 'SYLVESTER', 'DERN', datetime.datetime(2006, 2, 15, 4, 34, 33))
(110, 'SUSAN', 'DAVIS', datetime.datetime(2006, 2, 15, 4, 34, 33))
(111, 'CAMERON', 'ZELLWEGER', datetime.datetime(2006, 2, 15, 4, 34, 33))
(112, 'RUSSELL', 'BACALL', datetime.datetime(2006, 2, 15, 4, 34, 33))
(113, 'MORGAN', 'HOPKINS', datetime.datetime(2006, 2, 15, 4, 34, 33))
(114, 'MORGAN', 'MCDORMAND', datetime.datetime(2006, 2, 15, 4, 34, 33))
(115, 'HARRISON', 'BALE', datetime.datetime(2006, 2, 15, 4, 34, 33))
(116, 'DAN', 'STREEP', datetime.datetime(2006, 2, 15, 4, 34, 33))
(117, 'RENEE', 'TRACY', datetime.datetime(2006, 2, 15, 4, 34, 33))
(118, 'CUBA', 'ALLEN', datetime.datetime(2006, 2, 15, 4, 34, 33))
(119, 'WARREN', 'JACKMAN', datetime.datetime(2006, 2, 15, 4, 34, 33))
(120, 'PENELOPE', 'MONROE', datetime.datetime(2006, 2, 15, 4, 34, 33))
(121, 'LIZA', 'BERGMAN', datetime.datetime(2006, 2, 15, 4, 34, 33))
(122, 'SALMA', 'NOLTE', datetime.datetime(2006, 2, 15, 4, 34, 33))
(123, 'JULIANNE', 'DENCH', datetime.datetime(2006, 2, 15, 4, 34, 33))
(124, 'SCARLETT', 'BENING', datetime.datetime(2006, 2, 15, 4, 34, 33))
(125, 'ALBERT', 'NOLTE', datetime.datetime(2006, 2, 15, 4, 34, 33))
(126, 'FRANCES', 'TOMEI', datetime.datetime(2006, 2, 15, 4, 34, 33))
(127, 'KEVIN', 'GARLAND', datetime.datetime(2006, 2, 15, 4, 34, 33))
(128, 'CATE', 'MCQUEEN', datetime.datetime(2006, 2, 15, 4, 34, 33))
(129, 'DARYL', 'CRAWFORD', datetime.datetime(2006, 2, 15, 4, 34, 33))
(130, 'GRETA', 'KEITEL', datetime.datetime(2006, 2, 15, 4, 34, 33))
(131, 'JANE', 'JACKMAN', datetime.datetime(2006, 2, 15, 4, 34, 33))
(132, 'ADAM', 'HOPPER', datetime.datetime(2006, 2, 15, 4, 34, 33))
(133, 'RICHARD', 'PENN', datetime.datetime(2006, 2, 15, 4, 34, 33))
(134, 'GENE', 'HOPKINS', datetime.datetime(2006, 2, 15, 4, 34, 33))
(135, 'RITA', 'REYNOLDS', datetime.datetime(2006, 2, 15, 4, 34, 33))
(136, 'ED', 'MANSFIELD', datetime.datetime(2006, 2, 15, 4, 34, 33))
(137, 'MORGAN', 'WILLIAMS', datetime.datetime(2006, 2, 15, 4, 34, 33))
(138, 'LUCILLE', 'DEE', datetime.datetime(2006, 2, 15, 4, 34, 33))
(139, 'EWAN', 'GOODING', datetime.datetime(2006, 2, 15, 4, 34, 33))
(140, 'WHOOPI', 'HURT', datetime.datetime(2006, 2, 15, 4, 34, 33))
(141, 'CATE', 'HARRIS', datetime.datetime(2006, 2, 15, 4, 34, 33))
(142, 'JADA', 'RYDER', datetime.datetime(2006, 2, 15, 4, 34, 33))
(143, 'RIVER', 'DEAN', datetime.datetime(2006, 2, 15, 4, 34, 33))
(144, 'ANGELA', 'WITHERSPOON', datetime.datetime(2006, 2, 15, 4, 34, 33))
(145, 'KIM', 'ALLEN', datetime.datetime(2006, 2, 15, 4, 34, 33))
(146, 'ALBERT', 'JOHANSSON', datetime.datetime(2006, 2, 15, 4, 34, 33))
(147, 'FAY', 'WINSLET', datetime.datetime(2006, 2, 15, 4, 34, 33))
(148, 'EMILY', 'DEE', datetime.datetime(2006, 2, 15, 4, 34, 33))
(149, 'RUSSELL', 'TEMPLE', datetime.datetime(2006, 2, 15, 4, 34, 33))
(150, 'JAYNE', 'NOLTE', datetime.datetime(2006, 2, 15, 4, 34, 33))
(151, 'GEOFFREY', 'HESTON', datetime.datetime(2006, 2, 15, 4, 34, 33))
(152, 'BEN', 'HARRIS', datetime.datetime(2006, 2, 15, 4, 34, 33))
(153, 'MINNIE', 'KILMER', datetime.datetime(2006, 2, 15, 4, 34, 33))
(154, 'MERYL', 'GIBSON', datetime.datetime(2006, 2, 15, 4, 34, 33))
(155, 'IAN', 'TANDY', datetime.datetime(2006, 2, 15, 4, 34, 33))
(156, 'FAY', 'WOOD', datetime.datetime(2006, 2, 15, 4, 34, 33))
(157, 'GRETA', 'MALDEN', datetime.datetime(2006, 2, 15, 4, 34, 33))
(158, 'VIVIEN', 'BASINGER', datetime.datetime(2006, 2, 15, 4, 34, 33))
(159, 'LAURA', 'BRODY', datetime.datetime(2006, 2, 15, 4, 34, 33))
(160, 'CHRIS', 'DEPP', datetime.datetime(2006, 2, 15, 4, 34, 33))
(161, 'HARVEY', 'HOPE', datetime.datetime(2006, 2, 15, 4, 34, 33))
(162, 'OPRAH', 'KILMER', datetime.datetime(2006, 2, 15, 4, 34, 33))
(163, 'CHRISTOPHER', 'WEST', datetime.datetime(2006, 2, 15, 4, 34, 33))
(164, 'HUMPHREY', 'WILLIS', datetime.datetime(2006, 2, 15, 4, 34, 33))
(165, 'AL', 'GARLAND', datetime.datetime(2006, 2, 15, 4, 34, 33))
(166, 'NICK', 'DEGENERES', datetime.datetime(2006, 2, 15, 4, 34, 33))
(167, 'LAURENCE', 'BULLOCK', datetime.datetime(2006, 2, 15, 4, 34, 33))
(168, 'WILL', 'WILSON', datetime.datetime(2006, 2, 15, 4, 34, 33))
(169, 'KENNETH', 'HOFFMAN', datetime.datetime(2006, 2, 15, 4, 34, 33))
(170, 'MENA', 'HOPPER', datetime.datetime(2006, 2, 15, 4, 34, 33))
(171, 'OLYMPIA', 'PFEIFFER', datetime.datetime(2006, 2, 15, 4, 34, 33))
(172, 'GROUCHO', 'WILLIAMS', datetime.datetime(2006, 2, 15, 4, 34, 33))
(173, 'ALAN', 'DREYFUSS', datetime.datetime(2006, 2, 15, 4, 34, 33))
(174, 'MICHAEL', 'BENING', datetime.datetime(2006, 2, 15, 4, 34, 33))
(175, 'WILLIAM', 'HACKMAN', datetime.datetime(2006, 2, 15, 4, 34, 33))
(176, 'JON', 'CHASE', datetime.datetime(2006, 2, 15, 4, 34, 33))
(177, 'GENE', 'MCKELLEN', datetime.datetime(2006, 2, 15, 4, 34, 33))
(178, 'LISA', 'MONROE', datetime.datetime(2006, 2, 15, 4, 34, 33))
(179, 'ED', 'GUINESS', datetime.datetime(2006, 2, 15, 4, 34, 33))
(180, 'JEFF', 'SILVERSTONE', datetime.datetime(2006, 2, 15, 4, 34, 33))
(181, 'MATTHEW', 'CARREY', datetime.datetime(2006, 2, 15, 4, 34, 33))
(182, 'DEBBIE', 'AKROYD', datetime.datetime(2006, 2, 15, 4, 34, 33))
(183, 'RUSSELL', 'CLOSE', datetime.datetime(2006, 2, 15, 4, 34, 33))
(184, 'HUMPHREY', 'GARLAND', datetime.datetime(2006, 2, 15, 4, 34, 33))
(185, 'MICHAEL', 'BOLGER', datetime.datetime(2006, 2, 15, 4, 34, 33))
(186, 'JULIA', 'ZELLWEGER', datetime.datetime(2006, 2, 15, 4, 34, 33))
(187, 'RENEE', 'BALL', datetime.datetime(2006, 2, 15, 4, 34, 33))
(188, 'ROCK', 'DUKAKIS', datetime.datetime(2006, 2, 15, 4, 34, 33))
(189, 'CUBA', 'BIRCH', datetime.datetime(2006, 2, 15, 4, 34, 33))
(190, 'AUDREY', 'BAILEY', datetime.datetime(2006, 2, 15, 4, 34, 33))
(191, 'GREGORY', 'GOODING', datetime.datetime(2006, 2, 15, 4, 34, 33))
(192, 'JOHN', 'SUVARI', datetime.datetime(2006, 2, 15, 4, 34, 33))
(193, 'BURT', 'TEMPLE', datetime.datetime(2006, 2, 15, 4, 34, 33))
(194, 'MERYL', 'ALLEN', datetime.datetime(2006, 2, 15, 4, 34, 33))
(195, 'JAYNE', 'SILVERSTONE', datetime.datetime(2006, 2, 15, 4, 34, 33))
(196, 'BELA', 'WALKEN', datetime.datetime(2006, 2, 15, 4, 34, 33))
(197, 'REESE', 'WEST', datetime.datetime(2006, 2, 15, 4, 34, 33))
(198, 'MARY', 'KEITEL', datetime.datetime(2006, 2, 15, 4, 34, 33))
(199, 'JULIA', 'FAWCETT', datetime.datetime(2006, 2, 15, 4, 34, 33))
(200, 'THORA', 'TEMPLE', datetime.datetime(2006, 2, 15, 4, 34, 33))
```

</div></details>

参考文献
- https://qiita.com/tayasu/items/c5ddfc481d6b7cd8866d

テストテーブル作成

```sql
set session cte_max_recursion_depth = 1000000;

drop table test_tbl;
create table test_tbl as
with recursive rec(id,item) as (
	select 1,SUBSTRING(MD5(RAND()), 1, 10)
    union all
    select id+1,SUBSTRING(MD5(RAND()), 1, 10) from rec
    where id+1<=1000000
)select * from rec;

select * from test_tbl limit 10;
```


```python
from sqlalchemy import create_engine

engine = create_engine('mysql://root:Mysql3306@localhost/testdb')

result = engine.execute("select * from test_tbl")

for row in result:
    print(row)
```

計測

limit 5で計測ができるか確認

出力は捨てられている

```
n-scratch> Measure-Command{  python .\01-sqlalchemy-setting.py }
```

```
Measure-Command{  python .\01-sqlalchemy-setting.py }


Days              : 0
Hours             : 0
Minutes           : 0
Seconds           : 0
Milliseconds      : 277
Ticks             : 2775149
TotalDays         : 3.21197800925926E-06
TotalHours        : 7.70874722222222E-05
TotalMinutes      : 0.00462524833333333
TotalSeconds      : 0.2775149
TotalMilliseconds : 277.5149
```

limit 10000

```
Measure-Command{  python .\01-sqlalchemy-setting.py }


Days              : 0
Hours             : 0
Minutes           : 0
Seconds           : 0
Milliseconds      : 385
Ticks             : 3855089
TotalDays         : 4.46190856481481E-06
TotalHours        : 0.000107085805555556
TotalMinutes      : 0.00642514833333333
TotalSeconds      : 0.3855089
TotalMilliseconds : 385.5089
```

limit 100000

```
Measure-Command{  python .\01-sqlalchemy-setting.py }


Days              : 0
Hours             : 0
Minutes           : 0
Seconds           : 1
Milliseconds      : 358
Ticks             : 13587574
TotalDays         : 1.57263587962963E-05
TotalHours        : 0.000377432611111111
TotalMinutes      : 0.0226459566666667
TotalSeconds      : 1.3587574
TotalMilliseconds : 1358.7574
```

limit 1000000

```
Measure-Command{  python .\01-sqlalchemy-setting.py }


Days              : 0
Hours             : 0
Minutes           : 0
Seconds           : 11
Milliseconds      : 528
Ticks             : 115288667
TotalDays         : 0.000133435957175926
TotalHours        : 0.00320246297222222
TotalMinutes      : 0.192147778333333
TotalSeconds      : 11.5288667
TotalMilliseconds : 11528.8667
```

検索条件を指定して実行

```sql
select * from test_tbl where item = 'f51d8be129';
```

インデックス作成前

```
Measure-Command{  python .\01-sqlalchemy-setting.py }


Days              : 0
Hours             : 0
Minutes           : 0
Seconds           : 0
Milliseconds      : 754
Ticks             : 7548474
TotalDays         : 8.73665972222222E-06
TotalHours        : 0.000209679833333333
TotalMinutes      : 0.01258079
TotalSeconds      : 0.7548474
TotalMilliseconds : 754.8474
```

インデックス作成後

```
Measure-Command{  python .\01-sqlalchemy-setting.py }


Days              : 0
Hours             : 0
Minutes           : 0
Seconds           : 0
Milliseconds      : 269
Ticks             : 2693101
TotalDays         : 3.1170150462963E-06
TotalHours        : 7.48083611111111E-05
TotalMinutes      : 0.00448850166666667
TotalSeconds      : 0.2693101
TotalMilliseconds : 269.3101
```

ランダムな日付
```
with recursive rec(rn,dtm) as(
	select 1,sysdate()
    union all
    select rn+1,date_add(sysdate(),interval rn day) from rec
    where rn+1<=10
)select * from rec;
```

sqlalchemy

```python
from sqlalchemy import create_engine

engine = create_engine('mysql://root:Mysql3306@localhost/testdb')


sql_script_file = open("02-sample.sql", "r")
sql_contents = sql_script_file.read()
# print(sql_contents)

# ということで、ファイルから取得したsqlファイルを実行するように修正
result = engine.execute(sql_contents)


# PEP 8: line too long (149 > 120 characters)
# 直接固定文言で指定する文字列長すぎとか言われる
# result = engine.execute("with sub as(select id,item,ceil(id/10) as grp from test_tbl)select grp,group_concat(item,',') as liz from sub group by grp")

# pycharmの指示に従い、以下のように折り返すこともできる
# result = engine.execute("with sub as(select id,item,ceil(id/10) as grp from test_tbl)select grp,group_concat(item,',"
#                         "') as liz from sub group by grp")
# result = engine.execute('select * from test_tbl limit 5')
#
for row in result:
    print(row)
```

