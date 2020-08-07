- IN

```
$ cat test.tsv
210-7478	酒井 航	合資会社石井農林	Associate	Commission	Associates
094-3764	三浦 蒼	松井鉱業合名会社	Liaison	Part-time	Bachelor
463-3460	新井 太一	合名会社福田水産	Orchestrator	Internship	Bachelor
202-4708	斎藤 七海	合資会社小川鉱業	Orchestrator	Contract	Master
```

- CMD

```
$ jq -s -R 'split("\n")|map(.|select(.!=""))|map(split("\t")) as $a|($a|length) as $row|($a[0]|length) as $col|[range(0;$row)]|map(. as $rn|[range(0;$col)]|map({("col"+tostring):$a[$rn][.]})|reduce .[] as $item({};.+$item))' test.tsv
```

- OUT

```
[
  {
    "col0": "210-7478",
    "col1": "酒井 航",
    "col2": "合資会社石井農林",
    "col3": "Associate",
    "col4": "Commission",
    "col5": "Associates"
  },
  {
    "col0": "094-3764",
    "col1": "三浦 蒼",
    "col2": "松井鉱業合名会社",
    "col3": "Liaison",
    "col4": "Part-time",
    "col5": "Bachelor"
  },
  {
    "col0": "463-3460",
    "col1": "新井 太一",
    "col2": "合名会社福田水産",
    "col3": "Orchestrator",
    "col4": "Internship",
    "col5": "Bachelor"
  },
  {
    "col0": "202-4708",
    "col1": "斎藤 七海",
    "col2": "合資会社小川鉱業",
    "col3": "Orchestrator",
    "col4": "Contract",
    "col5": "Master"
  }
]
```
