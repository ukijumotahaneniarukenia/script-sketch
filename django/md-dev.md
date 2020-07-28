# 参考文献
- https://qiita.com/zaki-lknr/items/b89c35d90df96a000256
- https://qiita.com/homines22/items/2730d26e932554b6fb58

MVC的なやつだな

- https://qiita.com/gragragrao/items/373057783ba8856124f3
- https://qiita.com/kimihiro_n/items/86e0a9e619720e57ecd8

# dockerイメージ作成

```
time docker build -t ubuntu-18-04-python-django-pycharm . | tee log
```

# dockerコンテナ起動

```
docker run --privileged --shm-size=4gb --name ubuntu-18-04-python-django-pycharm -itd -v /etc/localtime:/etc/localtime -v /run/udev:/run/udev -v /run/systemd:/run/systemd -v /tmp/.X11-unix:/tmp/.X11-unix -v /var/lib/dbus:/var/lib/dbus -v /var/run/dbus:/var/run/dbus -v /etc/machine-id:/etc/machine-id -p 8000:8000 ubuntu-18-04-python-django-pycharm
```

# dockerコンテナ潜入

```
docker exec -it ubuntu-18-04-python-django-pycharm /bin/bash
```

# pycharm起動

```
$ pyc
[1] 16
$tail ~/launch_pycharm.log
```

# バージョン確認

```
$pip3 install --upgrade pip
$python3 --version
Python 3.7.4
$pip3 -V
pip 20.0.2 from /usr/local/lib/python3.7/site-packages/pip (python 3.7)
```

# djangoいんすこ

```
$pip3 install django
Collecting django
  Downloading Django-3.0.2-py3-none-any.whl (7.4 MB)
     |████████████████████████████████| 7.4 MB 1.9 MB/s
Collecting pytz
  Downloading pytz-2019.3-py2.py3-none-any.whl (509 kB)
     |████████████████████████████████| 509 kB 2.4 MB/s
Collecting sqlparse>=0.2.2
  Downloading sqlparse-0.3.0-py2.py3-none-any.whl (39 kB)
Collecting asgiref~=3.2
  Downloading asgiref-3.2.3-py2.py3-none-any.whl (18 kB)
Installing collected packages: pytz, sqlparse, asgiref, django
Successfully installed asgiref-3.2.3 django-3.0.2 pytz-2019.3 sqlparse-0.3.0
```

# pycharm設定

![](./1.png)
![](./2.png)
![](./3.png)
![](./4.png)
![](./5.png)
![](./6.png)
![](./7.png)

# django-adminコマンドによるプロジェクト作成

javaでいうmavenコマンドやgradleコマンド的なやつであろう

```
$find / -name "*django*" 2>/dev/null |& grep bin
/usr/local/bin/django-admin.py
/usr/local/bin/__pycache__/django-admin.cpython-37.pyc
/usr/local/bin/django-admin
/usr/local/lib/python3.7/site-packages/django/bin/django-admin.py
/usr/local/lib/python3.7/site-packages/django/bin/__pycache__/django-admin.cpython-37.pyc
```

```
$mkdir -p nyango
$cd nyango
$django-admin startproject django_app .
$cd -
$tree nyango
nyango
├── django_app
│   ├── __init__.py
│   ├── asgi.py
│   ├── settings.py
│   ├── urls.py
│   └── wsgi.py
└── manage.py
```

```
$cd nyango
$python3 manage.py startapp nyanbo
```
```
$cd nyango
$python3 manage.py runserver 0.0.0.0:8000 1>~/nyango/launch-django.log 2>&1 &
[1] 94
```

```
$tree nyango
nyango
├── db.sqlite3
├── django_app
│   ├── __init__.py
│   ├── __pycache__
│   │   ├── __init__.cpython-37.pyc
│   │   ├── settings.cpython-37.pyc
│   │   ├── urls.cpython-37.pyc
│   │   └── wsgi.cpython-37.pyc
│   ├── asgi.py
│   ├── settings.py
│   ├── urls.py
│   └── wsgi.py
├── launch-django.log
├── manage.py
└── nyanbo
    ├── __init__.py
    ├── admin.py
    ├── apps.py
    ├── migrations
    │   └── __init__.py
    ├── models.py
    ├── tests.py
    └── views.py
```

- http://localhost:8000/


- ピクチャをリネームしてカレントディレクトリに持ってくる

```
$cd ~/script_env/ubuntu-18-04-python-django-pycharm
$find /home/aine/Pictures -maxdepth 1 -type f | sort -k3,4 | awk '{print "mv \x27"$0"\x27 "NR".png"}'
```

