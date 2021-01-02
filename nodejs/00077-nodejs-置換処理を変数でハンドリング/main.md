IN

```
$ echo /about/:topicId /about/components
/about/:topicId /about/components
```


CMD

```
$ node -e 'i=process.argv.splice(1);[a,b]=[...i];c=a.split(/(?=\/)/).splice(0,a.split(/(?=\/)/).length-1).join("");i.map(e=>{console.log(e.replace(new RegExp(c+"/"),""))})' /about/:topicId /about/components|xargs
```


OUT


```
:topicId components
```
