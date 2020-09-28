IN

```
$ curl -fsSL https://www.php.net/releases/?json -o test.json

$ cat test.json | awk 4
{"7":{"announcement":true,"tags":[],"date":"03 Sep 2020","source":[{"filename":"php-7.4.10.tar.bz2","name":"PHP 7.4.10 (tar.bz2)","sha256":"e90bfc9ed98d24e53b51ffd4eb636cf5cd9d71ed7c6f8e4b6e9981e9882174e7","date":"03 Sep 2020"},{"filename":"php-7.4.10.tar.gz","name":"PHP 7.4.10 (tar.gz)","sha256":"e720f1286f895ca37f1c75a2ca338ad2f2456664d7097298167181b25b212feb","date":"03 Sep 2020"},{"filename":"php-7.4.10.tar.xz","name":"PHP 7.4.10 (tar.xz)","sha256":"c2d90b00b14284588a787b100dee54c2400e7db995b457864d66f00ad64fb010","date":"03 Sep 2020"}],"version":"7.4.10"},"5":{"announcement":{"English":"\/releases\/5_6_40.php"},"source":[{"filename":"php-5.6.40.tar.bz2","name":"PHP 5.6.40 (tar.bz2)","sha256":"ffd025d34623553ab2f7fd8fb21d0c9e6f9fa30dc565ca03a1d7b763023fba00","date":"10 Jan 2019"},{"filename":"php-5.6.40.tar.gz","name":"PHP 5.6.40 (tar.gz)","sha256":"56fb9878d12fdd921f6a0897e919f4e980d930160e154cbde2cc6d9206a27cac","date":"10 Jan 2019"},{"filename":"php-5.6.40.tar.xz","name":"PHP 5.6.40 (tar.xz)","sha256":"1369a51eee3995d7fbd1c5342e5cc917760e276d561595b6052b21ace2656d1c","date":"10 Jan 2019"}],"date":"10 Jan 2019","museum":false,"version":"5.6.40"},"4":{"announcement":{"English":"\/releases\/4_4_9.php"},"source":[{"filename":"php-4.4.9.tar.bz2","name":"PHP 4.4.9 (tar.bz2)","md5":"2e3b2a0e27f10cb84fd00e5ecd7a1880","date":"07 August 2008"},{"filename":"php-4.4.9.tar.gz","name":"PHP 4.4.9 (tar.gz)","md5":"9bcc1aba50be0dfeeea551d018375548","date":"07 August 2008"}],"windows":[{"filename":"php-4.4.9-Win32.zip","name":"PHP 4.4.9 zip package","md5":"7395068d5489a9f8abf50c6e4b48622f","date":"07 August 2008"}],"date":"07 August 2008","museum":true,"version":"4.4.9"},"3":{"date":"20 Oct 2000","source":[{"filename":"php-3.0.18.tar.gz","name":"PHP 3.0.18 Source Code","md5":"b4b8f7f1151ce66d5f3910a066651133"}],"windows":[{"filename":"php-3.0.17-win32.zip","name":"PHP 3.0.17 Windows binary","md5":"29029ac1c3c2075dce38bbd804c42f72"}],"museum":true,"version":"3.0.x (latest)"}}
```



CMD

```
$ cat test.json|jq -r 'to_entries|map(.value|.date as $dtm|.source|map(. + {"date":$dtm} ))|reduce .[] as $item([];. + $item)|.[]|[.filename,.name,.md5,.date]|@tsv'|sed -r '1ifilename\tname\tmd5\tdate'
```


OUT


```
filename	name	md5	date
php-7.4.10.tar.bz2	PHP 7.4.10 (tar.bz2)		03 Sep 2020
php-7.4.10.tar.gz	PHP 7.4.10 (tar.gz)		03 Sep 2020
php-7.4.10.tar.xz	PHP 7.4.10 (tar.xz)		03 Sep 2020
php-5.6.40.tar.bz2	PHP 5.6.40 (tar.bz2)		10 Jan 2019
php-5.6.40.tar.gz	PHP 5.6.40 (tar.gz)		10 Jan 2019
php-5.6.40.tar.xz	PHP 5.6.40 (tar.xz)		10 Jan 2019
php-4.4.9.tar.bz2	PHP 4.4.9 (tar.bz2)	2e3b2a0e27f10cb84fd00e5ecd7a1880	07 August 2008
php-4.4.9.tar.gz	PHP 4.4.9 (tar.gz)	9bcc1aba50be0dfeeea551d018375548	07 August 2008
php-3.0.18.tar.gz	PHP 3.0.18 Source Code	b4b8f7f1151ce66d5f3910a066651133	20 Oct 2000
```
