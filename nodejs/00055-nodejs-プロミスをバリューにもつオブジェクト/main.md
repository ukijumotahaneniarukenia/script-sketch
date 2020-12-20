プロミスにくるんでおいてallやanyやallSettledなどで実行フローを制御するときは便利そう。

ジョブ管理など。

then catch finally

CMD

```
$ node -e 'let a={pA:Promise.resolve(1)};console.log(a)'
```

OUT

```
{ pA: Promise { 1 } }
```

CMD

```
$ node -e 'let a={pA:Promise.resolve(1)};console.log(a.pA)'
```

OUT

```
Promise { 1 }
```

CMD

```
$ node -e 'let a={pA:Promise.resolve(1)};a.pA.then(v=>{console.log(v)})'
```

OUT

```
1
```

