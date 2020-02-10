drop table test_src_tbl purge;
/

create table test_src_tbl (
    grp_key         number
    , grpseq_key      number
    , prov_inst_qty   number
);
/

set define off;
insert into test_src_tbl (grp_key,grpseq_key,prov_inst_qty) values (1,1,98);
insert into test_src_tbl (grp_key,grpseq_key,prov_inst_qty) values (1,2,83);
insert into test_src_tbl (grp_key,grpseq_key,prov_inst_qty) values (1,3,62);
insert into test_src_tbl (grp_key,grpseq_key,prov_inst_qty) values (1,4,88);
insert into test_src_tbl (grp_key,grpseq_key,prov_inst_qty) values (1,5,89);
insert into test_src_tbl (grp_key,grpseq_key,prov_inst_qty) values (1,6,38);
insert into test_src_tbl (grp_key,grpseq_key,prov_inst_qty) values (1,7,52);
insert into test_src_tbl (grp_key,grpseq_key,prov_inst_qty) values (1,8,58);
insert into test_src_tbl (grp_key,grpseq_key,prov_inst_qty) values (1,9,34);
insert into test_src_tbl (grp_key,grpseq_key,prov_inst_qty) values (2,1,98);
insert into test_src_tbl (grp_key,grpseq_key,prov_inst_qty) values (2,2,83);
insert into test_src_tbl (grp_key,grpseq_key,prov_inst_qty) values (2,3,62);
insert into test_src_tbl (grp_key,grpseq_key,prov_inst_qty) values (2,4,88);
insert into test_src_tbl (grp_key,grpseq_key,prov_inst_qty) values (2,5,89);
insert into test_src_tbl (grp_key,grpseq_key,prov_inst_qty) values (2,6,38);
insert into test_src_tbl (grp_key,grpseq_key,prov_inst_qty) values (2,7,52);
insert into test_src_tbl (grp_key,grpseq_key,prov_inst_qty) values (2,8,58);
insert into test_src_tbl (grp_key,grpseq_key,prov_inst_qty) values (2,9,34);
commit;
/

drop table test_dst_tbl purge;
/

create table test_dst_tbl (
    grp_key          number
    , grpseq_key       number
    , prov_inst_qty    number
    , remain_cnt       number
    , tgt              varchar2(4000 byte)
);
/

REM INSERTING into EXPORT_TABLE
set define off;
insert into test_dst_tbl (grp_key,grpseq_key,prov_inst_qty,remain_cnt,tgt) values (1,1,98,0,',1:1:98,1:2:83,1:3:62,1:4:88,1:5:89,1:6:38,1:7:52,1:8:58,1:9:34');
insert into test_dst_tbl (grp_key,grpseq_key,prov_inst_qty,remain_cnt,tgt) values (1,2,83,0,',1:1:98,1:2:83,1:3:62,1:4:88,1:5:89,1:6:38,1:7:52,1:8:58,1:9:34');
insert into test_dst_tbl (grp_key,grpseq_key,prov_inst_qty,remain_cnt,tgt) values (1,3,62,0,',1:1:98,1:2:83,1:3:62,1:4:88,1:5:89,1:6:38,1:7:52,1:8:58,1:9:34');
insert into test_dst_tbl (grp_key,grpseq_key,prov_inst_qty,remain_cnt,tgt) values (1,4,88,67,',1:1:98,1:2:83,1:3:62,1:4:88,1:5:89,1:6:38,1:7:52,1:8:58,1:9:34');
insert into test_dst_tbl (grp_key,grpseq_key,prov_inst_qty,remain_cnt,tgt) values (1,5,89,89,',1:1:98,1:2:83,1:3:62,1:4:88,1:5:89,1:6:38,1:7:52,1:8:58,1:9:34');
insert into test_dst_tbl (grp_key,grpseq_key,prov_inst_qty,remain_cnt,tgt) values (1,6,38,38,',1:1:98,1:2:83,1:3:62,1:4:88,1:5:89,1:6:38,1:7:52,1:8:58,1:9:34');
insert into test_dst_tbl (grp_key,grpseq_key,prov_inst_qty,remain_cnt,tgt) values (1,7,52,52,',1:1:98,1:2:83,1:3:62,1:4:88,1:5:89,1:6:38,1:7:52,1:8:58,1:9:34');
insert into test_dst_tbl (grp_key,grpseq_key,prov_inst_qty,remain_cnt,tgt) values (1,8,58,58,',1:1:98,1:2:83,1:3:62,1:4:88,1:5:89,1:6:38,1:7:52,1:8:58,1:9:34');
insert into test_dst_tbl (grp_key,grpseq_key,prov_inst_qty,remain_cnt,tgt) values (1,9,34,34,',1:1:98,1:2:83,1:3:62,1:4:88,1:5:89,1:6:38,1:7:52,1:8:58,1:9:34');
commit;
/

with input_tbl as(
    select
        grp_key, grpseq_key, prov_inst_qty
    from test_src_tbl
),output_tbl as(
    select grp_key, grpseq_key, prov_inst_qty,remain_cnt,tgt from test_dst_tbl
),rec(grp_key, grpseq_key, prov_inst_qty,remain_cnt, tgt) as(
    select grp_key, grpseq_key, prov_inst_qty,remain_cnt, tgt from output_tbl
    union all
    select s1.grp_key, s1.grpseq_key, s1.prov_inst_qty,s1.remain_cnt, s1.tgt
    from rec s0
    ,lateral(
        select
            *
        from(
            select
                s1.grp_key
--                ,row_number()over(order by s0.grpseq_key) as grpseq_key
                ,s0.grpseq_key
                ,s0.remain_cnt as prov_inst_qty,0 as remain_cnt,null as tgt
            from
                input_tbl s1
            where s0.grp_key+1=s1.grp_key
--            and s0.grpseq_key=s1.grpseq_key
            and s0.remain_cnt <> 0
            )
    )s1
    where s0.grp_key+1=s1.grp_key
)select * from rec;

with sub as(
    select level as rn from dual where level>=4 connect by level<=9
)select rn,row_number()over(order by rn) as done from sub;
