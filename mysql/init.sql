alter user 'root'@'localhost' identified by 'Mysql3306';

create user 'user01'@'localhost' identified by 'Mysql3306';

grant all privileges on mysql.* to 'user01'@'localhost' with grant option;

create database testdb;

grant all privileges on testdb.* to user01@localhost;
