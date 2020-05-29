
```
mv /home/aine/media/Typora-linux-x64.tar.gz /usr/local/src

cd /usr/local/src

chown -R root:root Typora-linux-x64.tar.gz

tar xvf Typora-linux-x64.tar.gz

chown -R root:root bin

echo 'export PATH=/usr/local/src/bin/Typora-linux-x64:$PATH' >>$HOME/.bashrc


Typora --no-sandbox 1>$HOME/launch-Typora.log 2>&1 &

```
