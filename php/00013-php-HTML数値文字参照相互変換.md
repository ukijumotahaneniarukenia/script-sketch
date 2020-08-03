- VER

```
$ php --version
PHP 7.4.3 (cli) (built: May 26 2020 12:24:22) ( NTS )
Copyright (c) The PHP Group
Zend Engine v3.4.0, Copyright (c) Zend Technologies
    with Zend OPcache v7.4.3, Copyright (c), by Zend Technologies
```

- CMD

```
$ echo うの | php -R 'echo mb_convert_encoding($argn,"HTML-ENTITIES", "UTF-8");'
PHP Fatal error:  Uncaught Error: Call to undefined function mb_convert_encoding() in Command line run code:1
Stack trace:
#0 {main}
  thrown in Command line run code on line 1
```

- PRE

```
$ sudo apt install php-mbstring

$ sudo apt install php7.4-cli
```

- CMD

```
$ echo うの | php -R 'echo mb_convert_encoding($argn,"HTML-ENTITIES", "UTF-8")."\n";'
```

- OUT

```
&#12358;&#12398;
```

- CMD

```
$ echo '&#12358;&#12398;' | php -R 'echo mb_convert_encoding($argn,"UTF-8","HTML-ENTITIES")."\n";'
```

- OUT

```
うの
```
