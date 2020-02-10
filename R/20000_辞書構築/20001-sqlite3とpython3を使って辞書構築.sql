select
	page.page_title
, redirect.rd_title
from
	page inner join redirect
		on
			page.page_id=redirect.rd_from
		and page.page_is_redirect=1
;
