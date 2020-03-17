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

```
$osqueryi 'select * from groups;'
+-------+------------+-----------+
| gid   | gid_signed | groupname |
+-------+------------+-----------+
| 0     | 0          | root      |
| 1     | 1          | daemon    |
| 2     | 2          | bin       |
| 3     | 3          | sys       |
| 4     | 4          | adm       |
| 5     | 5          | tty       |
| 6     | 6          | disk      |
| 7     | 7          | lp        |
| 8     | 8          | mail      |
| 9     | 9          | news      |
| 10    | 10         | uucp      |
| 12    | 12         | man       |
| 13    | 13         | proxy     |
| 15    | 15         | kmem      |
| 20    | 20         | dialout   |
| 21    | 21         | fax       |
| 22    | 22         | voice     |
| 24    | 24         | cdrom     |
| 25    | 25         | floppy    |
| 26    | 26         | tape      |
| 27    | 27         | sudo      |
| 29    | 29         | audio     |
| 30    | 30         | dip       |
| 33    | 33         | www-data  |
| 34    | 34         | backup    |
| 37    | 37         | operator  |
| 38    | 38         | list      |
| 39    | 39         | irc       |
| 40    | 40         | src       |
| 41    | 41         | gnats     |
| 42    | 42         | shadow    |
| 43    | 43         | utmp      |
| 44    | 44         | video     |
| 45    | 45         | sasl      |
| 46    | 46         | plugdev   |
| 50    | 50         | staff     |
| 60    | 60         | games     |
| 100   | 100        | users     |
| 65534 | 65534      | nogroup   |
| 101   | 101        | ssh       |
| 9999  | 9999       | kuraine   |
+-------+------------+-----------+
```

- CMD
  - mysqlっぽい
```
$osqueryi 'select s1.gid,s1.groupname,case when exists(select 1 from users s2 where s1.gid=s2.gid) then 1 else 0 end as flg from groups s1;'
```

- OUT

```
+-------+-----------+-----+
| gid   | groupname | flg |
+-------+-----------+-----+
| 0     | root      | 1   |
| 1     | daemon    | 1   |
| 2     | bin       | 1   |
| 3     | sys       | 1   |
| 4     | adm       | 0   |
| 5     | tty       | 0   |
| 6     | disk      | 0   |
| 7     | lp        | 1   |
| 8     | mail      | 1   |
| 9     | news      | 1   |
| 10    | uucp      | 1   |
| 12    | man       | 1   |
| 13    | proxy     | 1   |
| 15    | kmem      | 0   |
| 20    | dialout   | 0   |
| 21    | fax       | 0   |
| 22    | voice     | 0   |
| 24    | cdrom     | 0   |
| 25    | floppy    | 0   |
| 26    | tape      | 0   |
| 27    | sudo      | 0   |
| 29    | audio     | 0   |
| 30    | dip       | 0   |
| 33    | www-data  | 1   |
| 34    | backup    | 1   |
| 37    | operator  | 0   |
| 38    | list      | 1   |
| 39    | irc       | 1   |
| 40    | src       | 0   |
| 41    | gnats     | 1   |
| 42    | shadow    | 0   |
| 43    | utmp      | 0   |
| 44    | video     | 0   |
| 45    | sasl      | 0   |
| 46    | plugdev   | 0   |
| 50    | staff     | 0   |
| 60    | games     | 1   |
| 100   | users     | 0   |
| 65534 | nogroup   | 1   |
| 101   | ssh       | 0   |
| 9999  | kuraine   | 1   |
+-------+-----------+-----+
```
