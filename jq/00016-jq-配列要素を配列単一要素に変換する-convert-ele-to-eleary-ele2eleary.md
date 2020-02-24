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

```
cat e.json | jq 'map([.])'
```

- OUT

```
[
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
    }
  ],
  [
    {
      "grp": 1,
      "item": [
        {
          "id": "1",
          "value": "CAAGAGAGT"
        }
      ]
    }
  ],
  [
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
    }
  ],
  [
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
]
```
