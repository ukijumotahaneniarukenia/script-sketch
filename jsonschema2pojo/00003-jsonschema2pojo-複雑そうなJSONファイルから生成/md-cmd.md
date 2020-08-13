- IN

```
$ cat a.json
{
".playlist.movie[0].mpaa_rating": {
    "type": "string",
    "format": ""
  },
  ".playlist.movie[0].release_date": {
    "type": "string",
    "format": ""
  },
  ".playlist.movie[0].running_time": {
    "type": "string",
    "format": ""
  },
  ".playlist.movie[0].title": {
    "type": "string",
    "format": ""
  }
}
```


- CMD



```
cat a.json  | jq '. as $entry|keys as $keylist|keys|map(if test("(?:date|time)") then {(.):"date-time"} else {(.):""} end) as $formatType|$formatType|.'
```

- OUT

  イメージはこんなかんじ
```
$ cat a.json
{
".playlist.movie[0].mpaa_rating": {
    "type": "string",
    "format": ""
  },
  ".playlist.movie[0].release_date": {
    "type": "string",
    "format": "date-time"
  },
  ".playlist.movie[0].running_time": {
    "type": "string",
    "format": "date-time"
  },
  ".playlist.movie[0].title": {
    "type": "string",
    "format": ""
  }
}
```
