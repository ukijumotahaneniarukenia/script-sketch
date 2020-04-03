.width 100 100

select
	page.page_title as convert_src
, redirect.rd_title as convert_dest
from
	page inner join redirect
		on
			page.page_id=redirect.rd_from
		and page.page_is_redirect=1
;
