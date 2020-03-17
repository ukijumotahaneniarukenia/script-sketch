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
$osqueryi 'select s2.shell,s2.uid,row_number()over(partition by shell order by s2.uid) as grpseq,group_concat(s2.username,",")over(partition by shell order by s2.uid) as liz from users s2'
```

- OUT

```
+-------------------+-------+--------+---------------------------------------------------------------------------------------------+
| shell             | uid   | grpseq | liz                                                                                         |
+-------------------+-------+--------+---------------------------------------------------------------------------------------------+
| /bin/bash         | 0     | 1      | root                                                                                        |
| /bin/bash         | 9999  | 2      | root,kuraine                                                                                |
| /bin/sync         | 4     | 1      | sync                                                                                        |
| /usr/sbin/nologin | 1     | 1      | daemon                                                                                      |
| /usr/sbin/nologin | 2     | 2      | daemon,bin                                                                                  |
| /usr/sbin/nologin | 3     | 3      | daemon,bin,sys                                                                              |
| /usr/sbin/nologin | 5     | 4      | daemon,bin,sys,games                                                                        |
| /usr/sbin/nologin | 6     | 5      | daemon,bin,sys,games,man                                                                    |
| /usr/sbin/nologin | 7     | 6      | daemon,bin,sys,games,man,lp                                                                 |
| /usr/sbin/nologin | 8     | 7      | daemon,bin,sys,games,man,lp,mail                                                            |
| /usr/sbin/nologin | 9     | 8      | daemon,bin,sys,games,man,lp,mail,news                                                       |
| /usr/sbin/nologin | 10    | 9      | daemon,bin,sys,games,man,lp,mail,news,uucp                                                  |
| /usr/sbin/nologin | 13    | 10     | daemon,bin,sys,games,man,lp,mail,news,uucp,proxy                                            |
| /usr/sbin/nologin | 33    | 11     | daemon,bin,sys,games,man,lp,mail,news,uucp,proxy,www-data                                   |
| /usr/sbin/nologin | 34    | 12     | daemon,bin,sys,games,man,lp,mail,news,uucp,proxy,www-data,backup                            |
| /usr/sbin/nologin | 38    | 13     | daemon,bin,sys,games,man,lp,mail,news,uucp,proxy,www-data,backup,list                       |
| /usr/sbin/nologin | 39    | 14     | daemon,bin,sys,games,man,lp,mail,news,uucp,proxy,www-data,backup,list,irc                   |
| /usr/sbin/nologin | 41    | 15     | daemon,bin,sys,games,man,lp,mail,news,uucp,proxy,www-data,backup,list,irc,gnats             |
| /usr/sbin/nologin | 100   | 16     | daemon,bin,sys,games,man,lp,mail,news,uucp,proxy,www-data,backup,list,irc,gnats,_apt        |
| /usr/sbin/nologin | 65534 | 17     | daemon,bin,sys,games,man,lp,mail,news,uucp,proxy,www-data,backup,list,irc,gnats,_apt,nobody |
+-------------------+-------+--------+---------------------------------------------------------------------------------------------+
```
