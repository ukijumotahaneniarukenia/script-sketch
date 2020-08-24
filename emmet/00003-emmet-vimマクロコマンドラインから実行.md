- CMD

```
$ vim +':norm @a' +':w! out.txt' +'q!'
```


- OUT

```
$ cat out.txt
<abbr title=""></abbr>
```




```
$ echo {a..c} | xargs -n1 |xargs -n1 -I{} echo "vim +':norm @{}' +':w! {}.txt' +'q' "
vim +':norm @a' +':w! a.txt' +'q' 
vim +':norm @b' +':w! b.txt' +'q' 
vim +':norm @c' +':w! c.txt' +'q' 



$ vim +':norm @a' +':w! a.txt' +'q'
$ vim +':norm @b' +':w! b.txt' +'q'
$ vim +':norm @c' +':w! c.txt' +'q'
```



```
$ echo {a..c} | xargs -n1 |xargs -n1 -I{} echo "vim -s +':norm @{}' +':w! {}.txt' +'q' " >vim-macro-execute.txt

$ cat vim-macro-execute.txt
vim -s +':norm @a' +':w! a.txt' +'q' 
vim -s +':norm @b' +':w! b.txt' +'q' 
vim -s +':norm @c' +':w! c.txt' +'q' 


$ cat vim-macro-execute.txt | bash
Vim: 警告: 端末からの入力ではありません

```
