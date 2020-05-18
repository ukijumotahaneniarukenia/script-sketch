with sub as(
select
タイトル
,case when trim(URL1) = '' then URL else URL1 end as URL
,エントリID
from feedly_tbl ft
)select * from sub where trim(url) != ''
;
