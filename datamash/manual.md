# インストール

cat hash_array_data | jq -r '.[]|foreach . as $item({};.+$item)' | sed -E 's;\{|\};;g;s;:;\t;g;/^$/d;s;^\s{1,};;;s;,;;' > data

```bash
curl -LO http://ftp.gnu.org/gnu/datamash/datamash-1.5.tar.gz
tar xvf datamash-1.5.tar.gz
cd datamash-1.5
./configure --prefix=/usr/local | tee log
make -j12 | tee logg
sudo make install -j12 | tee logg
```

# インストール確認

```
[root🧡ceacf3fb0808 (木 10月 24 00:18:08) /home/sqlite/script_scratch/datamash/datamash-1.5]$datamash --version
datamash (GNU datamash) 1.5
Copyright (C) 2019 Assaf Gordon
License GPLv3+: GNU GPL version 3 or later <https://gnu.org/licenses/gpl.html>.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Written by Assaf Gordon.
```

# 参考文献

http://www.gnu.org/software/datamash/
http://www.gnu.org/software/datamash/examples/#example_files
