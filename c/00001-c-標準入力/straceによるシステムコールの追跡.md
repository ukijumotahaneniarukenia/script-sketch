- 若干ちがうんだよな

- CMD
  - コマンドライン引数の場合
```
$strace ./main test.txt
```


- OUT

```
execve("./main", ["./main", "test.txt"], 0x7fff6987e318 /* 27 vars */) = 0
brk(NULL)                               = 0x55d13cc44000
arch_prctl(0x3001 /* ARCH_??? */, 0x7ffc4b4f9380) = -1 EINVAL (Invalid argument)
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/usr/local/lib/tls/haswell/x86_64/libc.so.6", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
stat("/usr/local/lib/tls/haswell/x86_64", 0x7ffc4b4f85d0) = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/usr/local/lib/tls/haswell/libc.so.6", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
stat("/usr/local/lib/tls/haswell", 0x7ffc4b4f85d0) = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/usr/local/lib/tls/x86_64/libc.so.6", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
stat("/usr/local/lib/tls/x86_64", 0x7ffc4b4f85d0) = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/usr/local/lib/tls/libc.so.6", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
stat("/usr/local/lib/tls", 0x7ffc4b4f85d0) = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/usr/local/lib/haswell/x86_64/libc.so.6", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
stat("/usr/local/lib/haswell/x86_64", 0x7ffc4b4f85d0) = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/usr/local/lib/haswell/libc.so.6", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
stat("/usr/local/lib/haswell", 0x7ffc4b4f85d0) = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/usr/local/lib/x86_64/libc.so.6", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
stat("/usr/local/lib/x86_64", 0x7ffc4b4f85d0) = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/usr/local/lib/libc.so.6", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
stat("/usr/local/lib", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=63532, ...}) = 0
mmap(NULL, 63532, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f7db300e000
close(3)                                = 0
openat(AT_FDCWD, "/lib/x86_64-linux-gnu/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\360r\2\0\0\0\0\0"..., 832) = 832
lseek(3, 64, SEEK_SET)                  = 64
read(3, "\6\0\0\0\4\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0"..., 784) = 784
lseek(3, 848, SEEK_SET)                 = 848
read(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32) = 32
lseek(3, 880, SEEK_SET)                 = 880
read(3, "\4\0\0\0\24\0\0\0\3\0\0\0GNU\0q7?\324>\326\250>\n\253\230<:\227\0362"..., 68) = 68
fstat(3, {st_mode=S_IFREG|0755, st_size=2025032, ...}) = 0
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f7db300c000
lseek(3, 64, SEEK_SET)                  = 64
read(3, "\6\0\0\0\4\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0"..., 784) = 784
lseek(3, 848, SEEK_SET)                 = 848
read(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32) = 32
lseek(3, 880, SEEK_SET)                 = 880
read(3, "\4\0\0\0\24\0\0\0\3\0\0\0GNU\0q7?\324>\326\250>\n\253\230<:\227\0362"..., 68) = 68
mmap(NULL, 2032984, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f7db2e1b000
mmap(0x7f7db2e40000, 1540096, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x25000) = 0x7f7db2e40000
mmap(0x7f7db2fb8000, 303104, PROT_READ, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x19d000) = 0x7f7db2fb8000
mmap(0x7f7db3002000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1e6000) = 0x7f7db3002000
mmap(0x7f7db3008000, 13656, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f7db3008000
close(3)                                = 0
arch_prctl(ARCH_SET_FS, 0x7f7db300d540) = 0
mprotect(0x7f7db3002000, 12288, PROT_READ) = 0
mprotect(0x55d13b93e000, 4096, PROT_READ) = 0
mprotect(0x7f7db304a000, 4096, PROT_READ) = 0
munmap(0x7f7db300e000, 63532)           = 0
brk(NULL)                               = 0x55d13cc44000
brk(0x55d13cc65000)                     = 0x55d13cc65000
openat(AT_FDCWD, "test.txt", O_RDONLY)  = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=52, ...}) = 0
read(3, "a b c\nd e f\ng h i\nj k l\nm n o\np "..., 4096) = 52
fstat(1, {st_mode=S_IFCHR|0620, st_rdev=makedev(0x88, 0x1), ...}) = 0
write(1, "a b c\n", 6a b c
)                  = 6
write(1, "d e f\n", 6d e f
)                  = 6
write(1, "g h i\n", 6g h i
)                  = 6
write(1, "j k l\n", 6j k l
)                  = 6
write(1, "m n o\n", 6m n o
)                  = 6
write(1, "p q r\n", 6p q r
)                  = 6
write(1, "s t u\n", 6s t u
)                  = 6
write(1, "v w x\n", 6v w x
)                  = 6
write(1, "y z\n", 4y z
)                    = 4
read(3, "", 4096)                       = 0
close(3)                                = 0
exit_group(0)                           = ?
```

- CMD
  - コマンドライン引数の場合
```
$strace cat test.txt | ./main
```


- OUT

```
execve("/usr/bin/cat", ["cat", "test.txt"], 0x7ffc587d2318 /* 27 vars */) = 0
brk(NULL)                               = 0x56502b87f000
arch_prctl(0x3001 /* ARCH_??? */, 0x7ffe76d73150) = -1 EINVAL (Invalid argument)
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/usr/local/lib/tls/haswell/x86_64/libc.so.6", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
stat("/usr/local/lib/tls/haswell/x86_64", 0x7ffe76d723a0) = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/usr/local/lib/tls/haswell/libc.so.6", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
stat("/usr/local/lib/tls/haswell", 0x7ffe76d723a0) = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/usr/local/lib/tls/x86_64/libc.so.6", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
stat("/usr/local/lib/tls/x86_64", 0x7ffe76d723a0) = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/usr/local/lib/tls/libc.so.6", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
stat("/usr/local/lib/tls", 0x7ffe76d723a0) = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/usr/local/lib/haswell/x86_64/libc.so.6", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
stat("/usr/local/lib/haswell/x86_64", 0x7ffe76d723a0) = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/usr/local/lib/haswell/libc.so.6", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
stat("/usr/local/lib/haswell", 0x7ffe76d723a0) = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/usr/local/lib/x86_64/libc.so.6", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
stat("/usr/local/lib/x86_64", 0x7ffe76d723a0) = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/usr/local/lib/libc.so.6", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
stat("/usr/local/lib", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=63532, ...}) = 0
mmap(NULL, 63532, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f365640d000
close(3)                                = 0
openat(AT_FDCWD, "/lib/x86_64-linux-gnu/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\360r\2\0\0\0\0\0"..., 832) = 832
lseek(3, 64, SEEK_SET)                  = 64
read(3, "\6\0\0\0\4\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0"..., 784) = 784
lseek(3, 848, SEEK_SET)                 = 848
read(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32) = 32
lseek(3, 880, SEEK_SET)                 = 880
read(3, "\4\0\0\0\24\0\0\0\3\0\0\0GNU\0q7?\324>\326\250>\n\253\230<:\227\0362"..., 68) = 68
fstat(3, {st_mode=S_IFREG|0755, st_size=2025032, ...}) = 0
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f365640b000
lseek(3, 64, SEEK_SET)                  = 64
read(3, "\6\0\0\0\4\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0"..., 784) = 784
lseek(3, 848, SEEK_SET)                 = 848
read(3, "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32) = 32
lseek(3, 880, SEEK_SET)                 = 880
read(3, "\4\0\0\0\24\0\0\0\3\0\0\0GNU\0q7?\324>\326\250>\n\253\230<:\227\0362"..., 68) = 68
mmap(NULL, 2032984, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f365621a000
mmap(0x7f365623f000, 1540096, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x25000) = 0x7f365623f000
mmap(0x7f36563b7000, 303104, PROT_READ, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x19d000) = 0x7f36563b7000
mmap(0x7f3656401000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1e6000) = 0x7f3656401000
mmap(0x7f3656407000, 13656, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f3656407000
close(3)                                = 0
arch_prctl(ARCH_SET_FS, 0x7f365640c580) = 0
mprotect(0x7f3656401000, 12288, PROT_READ) = 0
mprotect(0x565029a2e000, 4096, PROT_READ) = 0
mprotect(0x7f3656449000, 4096, PROT_READ) = 0
munmap(0x7f365640d000, 63532)           = 0
brk(NULL)                               = 0x56502b87f000
brk(0x56502b8a0000)                     = 0x56502b8a0000
openat(AT_FDCWD, "/usr/lib/locale/locale-archive", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=1162448, ...}) = 0
mmap(NULL, 1162448, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f36560fe000
close(3)                                = 0
fstat(1, {st_mode=S_IFIFO|0600, st_size=0, ...}) = 0
openat(AT_FDCWD, "test.txt", O_RDONLY)  = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=52, ...}) = 0
fadvise64(3, 0, 0, POSIX_FADV_SEQUENTIAL) = 0
mmap(NULL, 139264, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f36560dc000
read(3, "a b c\nd e f\ng h i\nj k l\nm n o\np "..., 131072) = 52
write(1, "a b c\nd e f\ng h i\nj k l\nm n o\np "..., 52a b c
) = 52
d e f
g h i
j k l
read(3, m n o
p q r
s t u
v w x
"", 131072)                     = 0
munmap(0x7f36560dc000, 139264y z
)          = 0
close(3)                                = 0
close(1)                                = 0
close(2)                                = 0
exit_group(0)                           = ?
+++ exited with 0 +++
```
