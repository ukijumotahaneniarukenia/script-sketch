要注意！

```
$seq 10 | xargs -I@ -P0 fallocate -l 100G dump@
fallocate: fallocate: fallocate failedfallocate failed: No space left on device
: No space left on device
fallocate: fallocate failed: No space left on device
fallocate: fallocate failed: No space left on device
fallocate: fallocate failedfallocate: fallocate failed: No space left on device
: No space left on device
fallocate: fallocate failed: No space left on device
fallocate: fallocate failed: No space left on device
fallocate: fallocate failed: No space left on device
fallocate: fallocate failed: No space left on device
```


でも便利


https://qiita.com/toshihirock/items/6cb99a85d86f524bc153#comments
