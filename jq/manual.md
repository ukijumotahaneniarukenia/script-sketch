https://stedolan.github.io/jq/manual/

集合演算
https://pod.hatenablog.com/entry/2017/08/29/215253




jsonパス式つかう

https://mattn.kaoriya.net/software/20140731185903.htm


gronインストールしたほうがはやい

```
[sqlite💞a06d1a5911c2 (月 10月 21 23:17:27) ~/script_scratch/jq]curl -LO https://github.com/tomnomnom/gron/releases/download/v0.6.0/gron-linux-amd64-0.6.0.tgz
[sqlite💞a06d1a5911c2 (月 10月 21 23:17:27) ~/script_scratch/jq]sudo tar xvf gron-linux-amd64-0.6.0.tgz -C /usr/local/bin
[sqlite💞a06d1a5911c2 (月 10月 21 23:17:22) ~/script_scratch/jq]$gron --version
gron version 0.6.0
```

```bash
[sqlite❤ceacf3fb0808 (火 10月 22 23:52:12) ~/script_scratch/jq]$echo '[' {1..3}, | sed 's;,$;;;s;$;];'
[ 1, 2, 3]
[sqlite❤ceacf3fb0808 (火 10月 22 23:48:36) ~/script_scratch/jq]$echo '[' {1..3}, | sed 's;,$;;;s;$;];' | ./stair_rev.sh
[3]
[3,2]
[3,2,1]
[sqlite❤ceacf3fb0808 (火 10月 22 23:48:36) ~/script_scratch/jq]$echo '[' {1..3}, | sed 's;,$;;;s;$;];' | ./stair_rev.sh
[3]
[3,2]
[3,2,1]
[sqlite❤ceacf3fb0808 (火 10月 22 23:48:52) ~/script_scratch/jq]$echo '[' {1..3}, | sed 's;,$;;;s;$;];' | ./stair.sh
[1]
[1,2]
[1,2,3]
[sqlite❤ceacf3fb0808 (火 10月 22 23:48:59) ~/script_scratch/jq]$echo '[' {1..3}, | sed 's;,$;;;s;$;];' | ./stair.sh | ./stair_rev.sh 
[1]
[2]
[2,1]
[3]
[3,2]
[3,2,1]
[sqlite❤ceacf3fb0808 (火 10月 22 23:49:22) ~/script_scratch/jq]$echo '[' {1..4}, | sed 's;,$;;;s;$;];' | ./stair.sh | ./stair_rev.sh 
[1]
[2]
[2,1]
[3]
[3,2]
[3,2,1]
[4]
[4,3]
[4,3,2]
[4,3,2,1]
```

```bash
[sqlite❤ceacf3fb0808 (水 10月 23 00:00:48) ~/script_scratch/jq]$./ざべすさん.sh 3 | rev | xargs -I@ printf "[%s]\n" @ | sed 's; ;,;g'
[1]
[2,1]
[3,2,1]
[3,2,1]
[2,1]
[1]
```
