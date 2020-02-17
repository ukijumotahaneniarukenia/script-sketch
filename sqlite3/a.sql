select col1,group_concat(col2,",") from test_tbl group by col1;
select col1,group_concat(distinct col2) from test_tbl group by col1;
select col1,col2,group_concat(col3) from test_tbl group by col1,col2;
select col1,col2,count(col3),count(distinct col3),group_concat(col3),group_concat(distinct col3) from test_tbl group by col1,col2;
select col1,col2,total(col3) from test_tbl group by col1,col2;
