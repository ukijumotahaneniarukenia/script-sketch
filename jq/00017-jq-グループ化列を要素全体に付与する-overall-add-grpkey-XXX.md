- IN

```
$cat e.json
[
  {
    "grp": 0,
    "item": [
      {
        "id": "3",
        "value": "AGTCGGTCTT"
      },
      {
        "id": "5",
        "value": "AGTCT"
      },
      {
        "id": "8",
        "value": "ACCGGTGTT"
      }
    ]
  },
  {
    "grp": 1,
    "item": [
      {
        "id": "1",
        "value": "CAAGAGAGT"
      }
    ]
  },
  {
    "grp": 2,
    "item": [
      {
        "id": "4",
        "value": "GTCTGGC"
      },
      {
        "id": "6",
        "value": "GCAGACTGAT"
      },
      {
        "id": "7",
        "value": "GGTAGGCG"
      },
      {
        "id": "9",
        "value": "GTTCTAGCA"
      },
      {
        "id": "10",
        "value": "GTAGCAGGT"
      }
    ]
  },
  {
    "grp": 3,
    "item": [
      {
        "id": "2",
        "value": "TCGCGTCTAG"
      }
    ]
  }
]
```

- CMD
  - map-mapべんりやな
```
cat e.json | jq 'map([.])|map(.[].grp as $grp|.[].item|map({grp:$grp}+.))'
```

- OUT

```
[
  [
    {
      "grp": 0,
      "id": "3",
      "value": "AGTCGGTCTT"
    },
    {
      "grp": 0,
      "id": "5",
      "value": "AGTCT"
    },
    {
      "grp": 0,
      "id": "8",
      "value": "ACCGGTGTT"
    }
  ],
  [
    {
      "grp": 1,
      "id": "1",
      "value": "CAAGAGAGT"
    }
  ],
  [
    {
      "grp": 2,
      "id": "4",
      "value": "GTCTGGC"
    },
    {
      "grp": 2,
      "id": "6",
      "value": "GCAGACTGAT"
    },
    {
      "grp": 2,
      "id": "7",
      "value": "GGTAGGCG"
    },
    {
      "grp": 2,
      "id": "9",
      "value": "GTTCTAGCA"
    },
    {
      "grp": 2,
      "id": "10",
      "value": "GTAGCAGGT"
    }
  ],
  [
    {
      "grp": 3,
      "id": "2",
      "value": "TCGCGTCTAG"
    }
  ]
]
```
