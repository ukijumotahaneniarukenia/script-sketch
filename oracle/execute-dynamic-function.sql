create or replace function func___01___(p_num number)
return number
as rt number := p_num;
begin
	return rt * 10;
end;
/

create or replace function func___02___(p_num number)
return number
as rt number := p_num;
begin
	return rt * 100;
end;
/

select FUNC___01___(10) as rt from dual;
select FUNC___02___(10) as rt from dual;


create or replace function func___invocker___(p_func_type number,p_num number)
return number
as rt number;
build_sql clob := to_clob('');
begin
	build_sql := 'select '||'func'||'___' || lpad(p_func_type,2,0) || '___' || '(' ||':p_num'|| ')' || ' from dual';
	execute IMMEDIATE build_sql into rt using p_num;
	return rt;
end;
/

create or replace package func___pkg___ is
	function func___01___(p_num number) return number;
	function func___02___(p_num number) return number;
end;
/
create or replace package body func___pkg___ is
	procedure func___fmt___(mtd varchar2) as
	begin
		DBMS_OUTPUT.PUT_LINE(mtd||'is called');
		return;
	end;
	function func___01___(p_num number)
	return number
	as rt number := p_num;
	begin
		func___fmt___('func___01___');
		return rt * 10;
	end;
	function func___02___(p_num number)
	return number
	as rt number := p_num;
	begin
		func___fmt___('func___02___');
		return rt * 100;
	end;
end;
/
select FUNC___PKG___.FUNC___01___(10) as rt from dual;
select FUNC___PKG___.FUNC___02___(10) as rt from dual;

create or replace function func___invocker___(p_func_type number,p_num number)
return number
as rt number;
build_sql clob := to_clob('');
begin
	build_sql := 'select '|| 'func___pkg___.' ||'func'||'___' || lpad(p_func_type,2,0) || '___' || '(' ||':p_num'|| ')' || ' from dual';
	execute IMMEDIATE build_sql into rt using p_num;
	return rt;
end;
/
select func___invocker___(1,10) as rt from dual;
select func___invocker___(2,10) as rt from dual;

