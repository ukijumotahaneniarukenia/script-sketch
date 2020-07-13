- REF
```
node --help | grep -P '\--p'
                              Does not affect --prof.
  --pending-deprecation       emit pending deprecation warnings
  --policy-integrity=...      ensure the security policy contents
  --preserve-symlinks         preserve symbolic links when resolving
  --preserve-symlinks-main    preserve symbolic links when resolving
  -p, --print [...]           evaluate script and print result
  --prof-process              process V8 profiler output generated
                              using --prof
```

- CMD

```
node -p "[...'caffelatte'].map(s=>s)"
```

- OUT

```
[
  'c', 'a', 'f', 'f',
  'e', 'l', 'a', 't',
  't', 'e'
]
```

- CMD

```
node -p "['caffelatte'].map(s=>s)"
```

- OUT
```
[ 'caffelatte' ]
```
