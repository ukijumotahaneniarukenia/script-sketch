IN

```
$ cat b.json
{
  "cast": {
    "person": [
      {
        "role-name": "Mark Watney",
        "canonical-name": "Matt Damon"
      },
      {
        "role-name": "Melissa Lewis",
        "canonical-name": "Jessica Chastain"
      },
      {
        "role-name": "Annie Montrose",
        "canonical-name": "Kristen Wiig"
      }
    ]
  },
  "director": "Ridley Scott",
  "release-date": "2015-10-02",
  "mpaa-rating": "PG-13",
  "running-time": 144
}
```


CMD

```
jq '
  def snake2(e;sep):e/sep|.[0]+(.[1:]|map(./""|.[0]|=ascii_upcase|add)|add);
  def mergeConcat(e;r):[(e|add)]+r;
  walk(if type == "object" then to_entries else . end)
  |walk(if type=="object" and has("key") then .key |= snake2(.;"-") else . end)
  |walk(if (type == "object") then [.]|from_entries elif (type=="array") then mergeConcat(.;[])|flatten else . end)
  |.[]
' b.json
```

OUT

```
{
  "cast": [
    {
      "person": [
        {
          "roleName": "Mark Watney",
          "canonicalName": "Matt Damon"
        },
        {
          "roleName": "Melissa Lewis",
          "canonicalName": "Jessica Chastain"
        },
        {
          "roleName": "Annie Montrose",
          "canonicalName": "Kristen Wiig"
        }
      ]
    }
  ],
  "director": "Ridley Scott",
  "releaseDate": "2015-10-02",
  "mpaaRating": "PG-13",
  "runningTime": 144
}
```
