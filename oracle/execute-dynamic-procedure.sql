create or replace procedure proc___01___(p_num in number,r_val out number,r_proc_name out varchar2)
as
begin
	r_val:=p_num * 10;
	r_proc_name:='proc___01___';
	return;	
end;
/
create or replace procedure proc___02___(p_num in number,r_val out number,r_proc_name out varchar2)
as
begin
	r_val:=p_num * 100;
	r_proc_name:='proc___02___';
	return;	
end;
/

set serveroutput on;
declare
rt number;
proc_name varchar2(100);
begin
	proc___01___(10,rt,proc_name);
	dbms_output.put_line(proc_name || ' is called');
	dbms_output.put_line(rt);
end;
/

declare
rt number;
proc_name varchar2(100);
begin
	proc___02___(10,rt,proc_name);
	dbms_output.put_line(proc_name || ' is called');
	dbms_output.put_line(rt);
end;
/

create or replace package const___reserved_words___
as
	begin___ constant varchar2(100):='begin ';
	end___ constant varchar2(100):=' end';
	space___ constant varchar2(100):=' ';
	semi_coron___ constant varchar2(100):=';';
	prefix_procedure___ constant varchar2(100):='proc';
	under_score___ constant varchar2(100):='___';
	left_parentheses___ constant varchar2(100):='(';
	right_parentheses___ constant varchar2(100):=')';
	comma___ constant varchar2(100):=',';
	return_val___ constant varchar2(100):='rt';
	procedure_name___ constant varchar2(100):='proc_name';
	varchar2___ constant varchar2(100):='varchar2';
	varchar2___4000_bytes___ constant varchar2(100):='4000';
	coron___ constant varchar2(100):=':';
	single_quote___ constant varchar2(100):='''';
	equal___ constant varchar2(100):='=';
	declare___ constant varchar2(100):='declare';

    function of___begin___(p_begin___ varchar2:=begin___) return varchar2;
    function of___end___(p_end___ varchar2:=end___) return varchar2;
    function of___space___(p_space___ varchar2:=space___) return varchar2;
    function of___semi_coron___(p_semi_coron___ varchar2:=semi_coron___) return varchar2;
    function of___prefix_procedure___(p_prefix_procedure___ varchar2:=prefix_procedure___) return varchar2;
    function of___under_score___(p_under_score___ varchar2:=under_score___) return varchar2;
    function of___left_parentheses___(p_left_parentheses___ varchar2:=left_parentheses___) return varchar2;
    function of___right_parentheses___(p_right_parentheses___ varchar2:=right_parentheses___) return varchar2;
    function of___comma___(p_comma___ varchar2:=comma___) return varchar2;
    function of___return_val___(p_return_val___ varchar2:=return_val___) return varchar2;
    function of___procedure_name___(p_procedure_name___ varchar2:=procedure_name___) return varchar2;
    function of___varchar2___(p_varchar2___ varchar2:=varchar2___) return varchar2;
    function of___varchar2___4000_bytes___(p_varchar2___4000_bytes___ varchar2:=varchar2___4000_bytes___) return varchar2;
    function of___coron___(p_coron___ varchar2:=coron___) return varchar2;
    function of___single_quote___(p_single_quote___ varchar2:=single_quote___) return varchar2;
    function of___equal___(p_equal___ varchar2:=equal___) return varchar2;
    function of___declare___(p_declare___ varchar2:=declare___) return varchar2;
end;
/

create or replace package body const___reserved_words___
as
    function of___begin___(p_begin___ varchar2) return varchar2 is rt varchar2(100):=p_begin___; begin return rt; end; 
    function of___end___(p_end___ varchar2) return varchar2 is rt varchar2(100):=p_end___; begin return rt; end; 
    function of___space___(p_space___ varchar2) return varchar2 is rt varchar2(100):=p_space___; begin return rt; end;
    function of___semi_coron___(p_semi_coron___ varchar2) return varchar2 is rt varchar2(100):=p_semi_coron___; begin return rt; end; 
    function of___prefix_procedure___(p_prefix_procedure___ varchar2) return varchar2 is rt varchar2(100):=p_prefix_procedure___; begin return rt; end; 
    function of___under_score___(p_under_score___ varchar2) return varchar2 is rt varchar2(100):=p_under_score___; begin return rt; end; 
    function of___left_parentheses___(p_left_parentheses___ varchar2) return varchar2 is rt varchar2(100):=p_left_parentheses___; begin return rt; end; 
    function of___right_parentheses___(p_right_parentheses___ varchar2) return varchar2 is rt varchar2(100):=p_right_parentheses___; begin return rt; end; 
    function of___comma___(p_comma___ varchar2) return varchar2 is rt varchar2(100):=p_comma___; begin return rt; end; 
    function of___return_val___(p_return_val___ varchar2) return varchar2 is rt varchar2(100):=p_return_val___; begin return rt; end; 
    function of___procedure_name___(p_procedure_name___ varchar2) return varchar2 is rt varchar2(100):=p_procedure_name___; begin return rt; end; 
    function of___varchar2___(p_varchar2___ varchar2) return varchar2 is rt varchar2(100):=p_varchar2___; begin return rt; end; 
    function of___varchar2___4000_bytes___(p_varchar2___4000_bytes___ varchar2) return varchar2 is rt varchar2(100):=p_varchar2___4000_bytes___; begin return rt; end; 
    function of___coron___(p_coron___ varchar2) return varchar2 is rt varchar2(100):=p_coron___; begin return rt; end; 
    function of___single_quote___(p_single_quote___ varchar2) return varchar2 is rt varchar2(100):=p_single_quote___; begin return rt; end; 
    function of___equal___(p_equal___ varchar2) return varchar2 is rt varchar2(100):=p_equal___; begin return rt; end; 
    function of___declare___(p_declare___ varchar2) return varchar2 is rt varchar2(100):=p_declare___; begin return rt; end; 
end;
/

create or replace procedure proc___invocker___(p_proc_type in number,p_num in number)
is
	build_proc varchar2(4000):='';
	rt varchar2(4000):='';
	proc_name varchar2(4000):='';
begin
	build_proc:=
	const___reserved_words___.of___declare___
	|| const___reserved_words___.of___space___
	|| const___reserved_words___.of___return_val___
	|| const___reserved_words___.of___space___
	|| const___reserved_words___.of___varchar2___ 
	|| const___reserved_words___.of___left_parentheses___
	|| const___reserved_words___.of___varchar2___4000_bytes___ 
	|| const___reserved_words___.of___right_parentheses___
	|| const___reserved_words___.of___coron___ 
	|| const___reserved_words___.of___equal___
	|| const___reserved_words___.of___single_quote___
	|| const___reserved_words___.of___single_quote___
	|| const___reserved_words___.of___semi_coron___
	|| const___reserved_words___.of___space___
	|| const___reserved_words___.of___procedure_name___
	|| const___reserved_words___.of___space___
	|| const___reserved_words___.of___varchar2___ 
	|| const___reserved_words___.of___left_parentheses___
	|| const___reserved_words___.of___varchar2___4000_bytes___ 
	|| const___reserved_words___.of___right_parentheses___
	|| const___reserved_words___.of___coron___ 
	|| const___reserved_words___.of___equal___
	|| const___reserved_words___.of___single_quote___
	|| const___reserved_words___.of___single_quote___
	|| const___reserved_words___.of___semi_coron___
	|| const___reserved_words___.of___space___
	|| const___reserved_words___.of___begin___
	|| const___reserved_words___.of___prefix_procedure___
	|| const___reserved_words___.of___under_score___
	|| lpad(p_proc_type,2,0)
	|| const___reserved_words___.of___under_score___
	|| const___reserved_words___.of___left_parentheses___
	|| p_num
	|| const___reserved_words___.of___comma___
	|| const___reserved_words___.of___coron___ 
	|| const___reserved_words___.of___return_val___
	|| const___reserved_words___.of___comma___
	|| const___reserved_words___.of___coron___ 
	|| const___reserved_words___.of___procedure_name___
	|| const___reserved_words___.of___right_parentheses___
	|| const___reserved_words___.of___semi_coron___
	|| const___reserved_words___.of___end___
	|| const___reserved_words___.of___semi_coron___;
	dbms_output.put_line(build_proc);
	execute immediate build_proc using out rt,out proc_name;
	dbms_output.put_line(proc_name || ' is called');
	dbms_output.put_line(rt);
	return;	
end;
/

set serveroutput on;
exec proc___invocker___(1,10);
/
exec proc___invocker___(2,10);
/



declare
	mx number;
begin
	select count(*) into mx from dba_objects where object_type = 'PROCEDURE' and object_name like 'PROC' || '%' and object_name not like '%' || 'INVOCKER'  || '%';
	for i in 1..mx loop
		execute immediate 'begin proc___invocker___('|| i || ',10); end;';	
	end loop;
end;
/
