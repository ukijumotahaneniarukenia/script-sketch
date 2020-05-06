drop table test_tbl;

create table test_tbl (
  id text
  ,item text
  ,qty int
  ,dtm date
);

drop table test1_tbl;

create table test1_tbl (
  id text
  ,item text
  ,qty int
  ,dtm date
);

drop table test2_tbl;

create table test2_tbl (
  id text
  ,item text
  ,qty int
  ,dtm date
);

drop table test3_tbl;

create table test3_tbl (
  id text
  ,item text
  ,qty int
  ,dtm date
);

select * from PRAGMA_table_info('test_tbl');
select * from PRAGMA_table_info('test1_tbl');
select * from PRAGMA_table_info('test2_tbl');
select * from PRAGMA_table_info('test3_tbl');
