- https://github.com/shakyShane/json-ts

```
$ cd ~/wrksp

$ npm init -y

$ npm install --save json-ts

$ node_modules/json-ts/dist/bin.js
Oops! You provided no inputs

You can pipe JSON to this program with the --stdin flag:

    curl http://example.com/some-json | json-ts --stdin

Or, provide path names:

    json-ts path/to/my-file.json

$ cat a.json
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


$ node_modules/json-ts/dist/bin.js a.json
interface IRootObject {
    cast: ICast;
    director: string;
    'release-date': string;
    'mpaa-rating': string;
    'running-time': number;
}
interface ICast {
    person: IPersonItem[];
}
interface IPersonItem {
    'role-name': string;
    'canonical-name': string;
}

```

あとはキー名を再帰的に指定した形にするだけ
