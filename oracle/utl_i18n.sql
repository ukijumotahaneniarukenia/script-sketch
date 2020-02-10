SELECT utl_i18n.get_max_character_size('AL32UTF8')FROM dual;


--https://www.morganslibrary.org/reference/pkgs/utl_i18n.html
SELECT utl_i18n.string_to_raw('うんこ','AL32UTF8') FROM dual;

SELECT utl_i18n.raw_to_nchar('E38186E38293E38193','AL32UTF8') from dual;

