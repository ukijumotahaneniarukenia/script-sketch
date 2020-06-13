

```

$ sqlite3 --version
-- Loading resources from /home/kuraine/.sqliterc
3.30.0 2019-10-04 15:03:17 c20a35336432025445f9f7e289d0cc3e4003fb17f45a4ce74c6269c407c6e09f


curl -sSLO https://bitbucket.org/xerial/sqlite-jdbc/downloads/sqlite-jdbc-3.30.1.jar


```


- IN


```
{
  "cast": {
    "person": [
      {
        "role": "Jim Lovell",
        "name": "Tom Hanks"
      },
      {
        "role": "Fred Haise",
        "name": "Bill Paxton"
      },
      {
        "role": "Jack Swigert",
        "name": "Kevin Bacon"
      },
      {
        "role": "Ken Mattingly",
        "name": "Gary Sinise"
      },
      {
        "role": "Gene Kranz",
        "name": "Ed Harris"
      }
    ]
  }
}
```


- CMD


```

ls *.json | xargs -n1 | xargs | java -jar ./build/libs/nnn-1.0-SNAPSHOT-all.jar

```


- OUT


```
key	value	type	atom	id	parent	fullkey	path	
null	{"cast":{"person":[{"role":"Jim Lovell","name":"Tom Hanks"},{"role":"Fred Haise","name":"Bill Paxton"},{"role":"Jack Swigert","name":"Kevin Bacon"},{"role":"Ken Mattingly","name":"Gary Sinise"},{"role":"Gene Kranz","name":"Ed Harris"}]}}	object	null	0	null	$	$	
cast	{"person":[{"role":"Jim Lovell","name":"Tom Hanks"},{"role":"Fred Haise","name":"Bill Paxton"},{"role":"Jack Swigert","name":"Kevin Bacon"},{"role":"Ken Mattingly","name":"Gary Sinise"},{"role":"Gene Kranz","name":"Ed Harris"}]}	object	null	2	0	$.cast	$	
person	[{"role":"Jim Lovell","name":"Tom Hanks"},{"role":"Fred Haise","name":"Bill Paxton"},{"role":"Jack Swigert","name":"Kevin Bacon"},{"role":"Ken Mattingly","name":"Gary Sinise"},{"role":"Gene Kranz","name":"Ed Harris"}]	array	null	4	2	$.cast.person	$.cast	
0	{"role":"Jim Lovell","name":"Tom Hanks"}	object	null	5	4	$.cast.person[0]	$.cast.person	
role	Jim Lovell	text	Jim Lovell	7	5	$.cast.person[0].role	$.cast.person[0]	
name	Tom Hanks	text	Tom Hanks	9	5	$.cast.person[0].name	$.cast.person[0]	
1	{"role":"Fred Haise","name":"Bill Paxton"}	object	null	10	4	$.cast.person[1]	$.cast.person	
role	Fred Haise	text	Fred Haise	12	10	$.cast.person[1].role	$.cast.person[1]	
name	Bill Paxton	text	Bill Paxton	14	10	$.cast.person[1].name	$.cast.person[1]	
2	{"role":"Jack Swigert","name":"Kevin Bacon"}	object	null	15	4	$.cast.person[2]	$.cast.person	
role	Jack Swigert	text	Jack Swigert	17	15	$.cast.person[2].role	$.cast.person[2]	
name	Kevin Bacon	text	Kevin Bacon	19	15	$.cast.person[2].name	$.cast.person[2]	
3	{"role":"Ken Mattingly","name":"Gary Sinise"}	object	null	20	4	$.cast.person[3]	$.cast.person	
role	Ken Mattingly	text	Ken Mattingly	22	20	$.cast.person[3].role	$.cast.person[3]	
name	Gary Sinise	text	Gary Sinise	24	20	$.cast.person[3].name	$.cast.person[3]	
4	{"role":"Gene Kranz","name":"Ed Harris"}	object	null	25	4	$.cast.person[4]	$.cast.person	
role	Gene Kranz	text	Gene Kranz	27	25	$.cast.person[4].role	$.cast.person[4]	
name	Ed Harris	text	Ed Harris	29	25	$.cast.person[4].name	$.cast.person[4]	
```
