```

$ tree -a -ugpf -J /bin | jq '.[]' | jq -f a.jq | jq -r 'select(. != null)|@tsv' | sed '1itype\tname\tmode\tprot\tuser\tgroup' >output-bin.tsv
$ tree -a -ugpf -J /opt | jq '.[]' | jq -f a.jq | jq -r 'select(. != null)|@tsv' | sed '1itype\tname\tmode\tprot\tuser\tgroup' >output-opt.tsv
$ tree -a -ugpf -J /tmp | jq '.[]' | jq -f a.jq | jq -r 'select(. != null)|@tsv' | sed '1itype\tname\tmode\tprot\tuser\tgroup' >output-tmp.tsv
$ tree -a -ugpf -J /dev | jq '.[]' | jq -f a.jq | jq -r 'select(. != null)|@tsv' | sed '1itype\tname\tmode\tprot\tuser\tgroup' >output-dev.tsv
$ tree -a -ugpf -J /boot | jq '.[]' | jq -f a.jq | jq -r 'select(. != null)|@tsv' | sed '1itype\tname\tmode\tprot\tuser\tgroup' >output-boot.tsv
$ tree -a -ugpf -J /home | jq '.[]' | jq -f a.jq | jq -r 'select(. != null)|@tsv' | sed '1itype\tname\tmode\tprot\tuser\tgroup' >output-home.tsv


```
