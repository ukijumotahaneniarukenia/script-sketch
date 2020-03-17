- IN


```
$osqueryi 'select * from users;'
+-------+-------+------------+------------+----------+------------------------------------+-----------------+-------------------+------+
| uid   | gid   | uid_signed | gid_signed | username | description                        | directory       | shell             | uuid |
+-------+-------+------------+------------+----------+------------------------------------+-----------------+-------------------+------+
| 0     | 0     | 0          | 0          | root     | root                               | /root           | /bin/bash         |      |
| 1     | 1     | 1          | 1          | daemon   | daemon                             | /usr/sbin       | /usr/sbin/nologin |      |
| 2     | 2     | 2          | 2          | bin      | bin                                | /bin            | /usr/sbin/nologin |      |
| 3     | 3     | 3          | 3          | sys      | sys                                | /dev            | /usr/sbin/nologin |      |
| 4     | 65534 | 4          | 65534      | sync     | sync                               | /bin            | /bin/sync         |      |
| 5     | 60    | 5          | 60         | games    | games                              | /usr/games      | /usr/sbin/nologin |      |
| 6     | 12    | 6          | 12         | man      | man                                | /var/cache/man  | /usr/sbin/nologin |      |
| 7     | 7     | 7          | 7          | lp       | lp                                 | /var/spool/lpd  | /usr/sbin/nologin |      |
| 8     | 8     | 8          | 8          | mail     | mail                               | /var/mail       | /usr/sbin/nologin |      |
| 9     | 9     | 9          | 9          | news     | news                               | /var/spool/news | /usr/sbin/nologin |      |
| 10    | 10    | 10         | 10         | uucp     | uucp                               | /var/spool/uucp | /usr/sbin/nologin |      |
| 13    | 13    | 13         | 13         | proxy    | proxy                              | /bin            | /usr/sbin/nologin |      |
| 33    | 33    | 33         | 33         | www-data | www-data                           | /var/www        | /usr/sbin/nologin |      |
| 34    | 34    | 34         | 34         | backup   | backup                             | /var/backups    | /usr/sbin/nologin |      |
| 38    | 38    | 38         | 38         | list     | Mailing List Manager               | /var/list       | /usr/sbin/nologin |      |
| 39    | 39    | 39         | 39         | irc      | ircd                               | /var/run/ircd   | /usr/sbin/nologin |      |
| 41    | 41    | 41         | 41         | gnats    | Gnats Bug-Reporting System (admin) | /var/lib/gnats  | /usr/sbin/nologin |      |
| 65534 | 65534 | 65534      | 65534      | nobody   | nobody                             | /nonexistent    | /usr/sbin/nologin |      |
| 100   | 65534 | 100        | 65534      | _apt     |                                    | /nonexistent    | /usr/sbin/nologin |      |
| 9999  | 9999  | 9999       | 9999       | kuraine  |                                    | /home/kuraine   | /bin/bash         |      |
+-------+-------+------------+------------+----------+------------------------------------+-----------------+-------------------+------+
```


- CMD
  - mysqlっぽい
```
$osqueryi 'select row_number()over(partition by shell order by uid) as rn,uid,shell from users;'
```

- OUT

```
+----+-------+-------------------+
| rn | uid   | shell             |
+----+-------+-------------------+
| 1  | 0     | /bin/bash         |
| 2  | 9999  | /bin/bash         |
| 1  | 4     | /bin/sync         |
| 1  | 1     | /usr/sbin/nologin |
| 2  | 2     | /usr/sbin/nologin |
| 3  | 3     | /usr/sbin/nologin |
| 4  | 5     | /usr/sbin/nologin |
| 5  | 6     | /usr/sbin/nologin |
| 6  | 7     | /usr/sbin/nologin |
| 7  | 8     | /usr/sbin/nologin |
| 8  | 9     | /usr/sbin/nologin |
| 9  | 10    | /usr/sbin/nologin |
| 10 | 13    | /usr/sbin/nologin |
| 11 | 33    | /usr/sbin/nologin |
| 12 | 34    | /usr/sbin/nologin |
| 13 | 38    | /usr/sbin/nologin |
| 14 | 39    | /usr/sbin/nologin |
| 15 | 41    | /usr/sbin/nologin |
| 16 | 100   | /usr/sbin/nologin |
| 17 | 65534 | /usr/sbin/nologin |
+----+-------+-------------------+
```
