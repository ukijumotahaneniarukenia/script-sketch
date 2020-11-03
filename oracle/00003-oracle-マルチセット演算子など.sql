-- http://www.dba-oracle.com/t_adv_plsql_multiset_operator.htm

CREATE OR REPLACE TYPE item_tbl AS TABLE OF VARCHAR(100);

WITH sub AS (
SELECT
    a
    ,b
    ,a MULTISET UNION b AS a_union_b
    ,b MULTISET UNION a AS b_union_a
    ,a MULTISET UNION ALL b AS a_union_all_b
    ,b MULTISET UNION ALL a AS b_union_all_a
    ,a MULTISET UNION DISTINCT b AS a_union_distinct_b
    ,b MULTISET UNION DISTINCT a AS b_union_distinct_a
    ,a MULTISET INTERSECT b AS a_intersect_b
    ,b MULTISET INTERSECT a AS b_intersect_a
    ,a MULTISET INTERSECT DISTINCT b AS a_intersect_distinct_b
    ,b MULTISET INTERSECT DISTINCT a AS b_intersect_distinct_a
    ,a MULTISET EXCEPT b AS a_except_b
    ,b MULTISET EXCEPT a AS b_except_a
    ,a MULTISET EXCEPT DISTINCT b AS a_except_distinct_b
    ,b MULTISET EXCEPT DISTINCT a AS b_except_distinct_a
FROM
(SELECT item_tbl('A0001','A0002','A0002','A0004','A0004') AS a FROM dual) 
    CROSS JOIN (SELECT item_tbl('A0001','A0003','A0003','A0004','A0004','A0007') AS b FROM dual)
)
SELECT
    *
FROM
    sub
    UNPIVOT(cols FOR sts IN (a, b, a_union_b, b_union_a, a_union_all_b, b_union_all_a, a_union_distinct_b, b_union_distinct_a, a_intersect_b, b_intersect_a, a_intersect_distinct_b, b_intersect_distinct_a, a_except_b, b_except_a, a_except_distinct_b, b_except_distinct_a))
;

CREATE OR REPLACE TYPE item_tbl AS TABLE OF VARCHAR(100);
/

CREATE OR REPLACE TYPE multi_ope AS OBJECT(
    ope VARCHAR(40)
    ,liz item_tbl
);
/

CREATE TABLE multi_ope_nt OF multi_ope NESTED TABLE liz STORE AS multi_ope_ret;

INSERT INTO multi_ope_nt
WITH sub AS (
SELECT
    a
    ,b
    ,a MULTISET UNION b AS a_union_b
    ,b MULTISET UNION a AS b_union_a
    ,a MULTISET UNION ALL b AS a_union_all_b
    ,b MULTISET UNION ALL a AS b_union_all_a
    ,a MULTISET UNION DISTINCT b AS a_union_distinct_b
    ,b MULTISET UNION DISTINCT a AS b_union_distinct_a
    ,a MULTISET INTERSECT b AS a_intersect_b
    ,b MULTISET INTERSECT a AS b_intersect_a
    ,a MULTISET INTERSECT DISTINCT b AS a_intersect_distinct_b
    ,b MULTISET INTERSECT DISTINCT a AS b_intersect_distinct_a
    ,a MULTISET EXCEPT b AS a_except_b
    ,b MULTISET EXCEPT a AS b_except_a
    ,a MULTISET EXCEPT DISTINCT b AS a_except_distinct_b
    ,b MULTISET EXCEPT DISTINCT a AS b_except_distinct_a
FROM
(SELECT item_tbl('A0001','A0002','A0002','A0004','A0004') AS a FROM dual) 
    CROSS JOIN (SELECT item_tbl('A0001','A0003','A0003','A0004','A0004','A0007') AS b FROM dual)
)
SELECT
    *
FROM
    sub
    UNPIVOT(cols FOR sts IN (a, b, a_union_b, b_union_a, a_union_all_b, b_union_all_a, a_union_distinct_b, b_union_distinct_a, a_intersect_b, b_intersect_a, a_intersect_distinct_b, b_intersect_distinct_a, a_except_b, b_except_a, a_except_distinct_b, b_except_distinct_a))
;

COMMIT;

SELECT * FROM multi_ope_nt;


WITH a AS (
SELECT item_tbl('A0001','A0002','A0002','A0004','A0004') AS a FROM dual
)
,b AS (
SELECT item_tbl('A0001','A0003','A0003','A0004','A0004','A0007') AS b FROM dual
)
SELECT 'sql',COLUMN_VALUE FROM (SELECT * FROM a),TABLE(a)
UNION ALL
SELECT 'sql',COLUMN_VALUE FROM (SELECT * FROM b),TABLE(b)
;

WITH sub AS (
SELECT * FROM multi_ope_nt WHERE ope = 'A_UNION_B'
)
SELECT 'plsql',COLUMN_VALUE FROM (SELECT liz FROM sub) tmp,TABLE(tmp.liz)
;

WITH a AS (
SELECT item_tbl('A0001','A0002','A0002','A0004','A0004') AS a FROM dual
)
,b AS (
SELECT item_tbl('A0001','A0003','A0003','A0004','A0004','A0007') AS b FROM dual
)
SELECT 'sql',COLUMN_VALUE FROM (SELECT * FROM b),TABLE(b)
UNION ALL
SELECT 'sql',COLUMN_VALUE FROM (SELECT * FROM a),TABLE(a)
;

WITH sub AS (
SELECT * FROM multi_ope_nt WHERE ope = 'B_UNION_A'
)
SELECT 'plsql',COLUMN_VALUE FROM (SELECT liz FROM sub) tmp,TABLE(tmp.liz)
;

WITH a AS (
SELECT item_tbl('A0001','A0002','A0002','A0004','A0004') AS a FROM dual
)
,b AS (
SELECT item_tbl('A0001','A0003','A0003','A0004','A0004','A0007') AS b FROM dual
)
SELECT 'sql',COLUMN_VALUE FROM (SELECT * FROM a),TABLE(a)
UNION ALL
SELECT 'sql',COLUMN_VALUE FROM (SELECT * FROM b),TABLE(b)
;

WITH sub AS (
SELECT * FROM multi_ope_nt WHERE ope = 'A_UNION_ALL_B'
)
SELECT 'plsql',COLUMN_VALUE FROM (SELECT liz FROM sub) tmp,TABLE(tmp.liz)
;

WITH a AS (
SELECT item_tbl('A0001','A0002','A0002','A0004','A0004') AS a FROM dual
)
,b AS (
SELECT item_tbl('A0001','A0003','A0003','A0004','A0004','A0007') AS b FROM dual
)
SELECT 'sql',COLUMN_VALUE FROM (SELECT * FROM b),TABLE(b)
UNION ALL
SELECT 'sql',COLUMN_VALUE FROM (SELECT * FROM a),TABLE(a)
;

WITH sub AS (
SELECT * FROM multi_ope_nt WHERE ope = 'B_UNION_ALL_A'
)
SELECT 'plsql',COLUMN_VALUE FROM (SELECT liz FROM sub) tmp,TABLE(tmp.liz)
;


WITH a AS (
SELECT item_tbl('A0001','A0002','A0002','A0004','A0004') AS a FROM dual
)
,b AS (
SELECT item_tbl('A0001','A0003','A0003','A0004','A0004','A0007') AS b FROM dual
)
SELECT 'sql',COLUMN_VALUE FROM (SELECT * FROM a),TABLE(a)
UNION
SELECT 'sql',COLUMN_VALUE FROM (SELECT * FROM b),TABLE(b)
;

WITH sub AS (
SELECT * FROM multi_ope_nt WHERE ope = 'A_UNION_DISTINCT_B'
)
SELECT 'plsql',COLUMN_VALUE FROM (SELECT liz FROM sub) tmp,TABLE(tmp.liz)
;


WITH a AS (
SELECT item_tbl('A0001','A0002','A0002','A0004','A0004') AS a FROM dual
)
,b AS (
SELECT item_tbl('A0001','A0003','A0003','A0004','A0004','A0007') AS b FROM dual
)
SELECT 'sql',COLUMN_VALUE FROM (SELECT * FROM b),TABLE(b)
UNION
SELECT 'sql',COLUMN_VALUE FROM (SELECT * FROM a),TABLE(a)
;

WITH sub AS (
SELECT * FROM multi_ope_nt WHERE ope = 'B_UNION_DISTINCT_A'
)
SELECT 'plsql',COLUMN_VALUE FROM (SELECT liz FROM sub) tmp,TABLE(tmp.liz)
;

WITH a AS (
SELECT item_tbl('A0001','A0002','A0002','A0004','A0004') AS a FROM dual
)
,b AS (
SELECT item_tbl('A0001','A0003','A0003','A0004','A0004','A0007') AS b FROM dual
)
SELECT 'sql',COLUMN_VALUE FROM (SELECT * FROM a),TABLE(a)
INTERSECT
SELECT 'sql',COLUMN_VALUE FROM (SELECT * FROM b),TABLE(b)
;

WITH sub AS (
SELECT * FROM multi_ope_nt WHERE ope = 'A_INTERSECT_B'
)
SELECT 'plsql',COLUMN_VALUE FROM (SELECT liz FROM sub) tmp,TABLE(tmp.liz)
;

WITH a AS (
SELECT item_tbl('A0001','A0002','A0002','A0004','A0004') AS a FROM dual
)
,b AS (
SELECT item_tbl('A0001','A0003','A0003','A0004','A0004','A0007') AS b FROM dual
)
SELECT 'sql',COLUMN_VALUE FROM (SELECT * FROM b),TABLE(b)
INTERSECT
SELECT 'sql',COLUMN_VALUE FROM (SELECT * FROM a),TABLE(a)
;

WITH sub AS (
SELECT * FROM multi_ope_nt WHERE ope = 'B_INTERSECT_A'
)
SELECT 'plsql',COLUMN_VALUE FROM (SELECT liz FROM sub) tmp,TABLE(tmp.liz)
;

WITH a AS (
SELECT item_tbl('A0001','A0002','A0002','A0004','A0004') AS a FROM dual
)
,b AS (
SELECT item_tbl('A0001','A0003','A0003','A0004','A0004','A0007') AS b FROM dual
)
SELECT 'sql',COLUMN_VALUE FROM (SELECT * FROM a),TABLE(a)
INTERSECT
SELECT 'sql',COLUMN_VALUE FROM (SELECT * FROM b),TABLE(b)
;

WITH sub AS (
SELECT * FROM multi_ope_nt WHERE ope = 'A_INTERSECT_DISTINCT_B'
)
SELECT 'plsql',COLUMN_VALUE FROM (SELECT liz FROM sub) tmp,TABLE(tmp.liz)
;

WITH a AS (
SELECT item_tbl('A0001','A0002','A0002','A0004','A0004') AS a FROM dual
)
,b AS (
SELECT item_tbl('A0001','A0003','A0003','A0004','A0004','A0007') AS b FROM dual
)
SELECT 'sql',COLUMN_VALUE FROM (SELECT * FROM b),TABLE(b)
INTERSECT
SELECT 'sql',COLUMN_VALUE FROM (SELECT * FROM a),TABLE(a)
;

WITH sub AS (
SELECT * FROM multi_ope_nt WHERE ope = 'B_INTERSECT_DISTINCT_A'
)
SELECT 'plsql',COLUMN_VALUE FROM (SELECT liz FROM sub) tmp,TABLE(tmp.liz)
;

WITH a AS (
SELECT item_tbl('A0001','A0002','A0002','A0004','A0004') AS a FROM dual
)
,b AS (
SELECT item_tbl('A0001','A0003','A0003','A0004','A0004','A0007') AS b FROM dual
)
SELECT 'sql',s1.COLUMN_VALUE FROM (SELECT * FROM a),TABLE(a) s1
where not exists (
                    select
                        1
                    from
                        (SELECT 'sql',COLUMN_VALUE FROM (SELECT * FROM b),TABLE(b))s2
                    where
                        s1.COLUMN_VALUE = s2.COLUMN_VALUE
                    )
;

WITH sub AS (
SELECT * FROM multi_ope_nt WHERE ope = 'A_EXCEPT_B'
)
SELECT 'plsql',COLUMN_VALUE FROM (SELECT liz FROM sub) tmp,TABLE(tmp.liz)
;


WITH a AS (
SELECT item_tbl('A0001','A0002','A0002','A0004','A0004') AS a FROM dual
)
,b AS (
SELECT item_tbl('A0001','A0003','A0003','A0004','A0004','A0007') AS b FROM dual
)
SELECT 'sql',s1.COLUMN_VALUE FROM (SELECT * FROM b),TABLE(b) s1
where not exists (
                    select
                        1
                    from
                        (SELECT 'sql',COLUMN_VALUE FROM (SELECT * FROM a),TABLE(a))s2
                    where
                        s1.COLUMN_VALUE = s2.COLUMN_VALUE
                    )
;

WITH sub AS (
SELECT * FROM multi_ope_nt WHERE ope = 'B_EXCEPT_A'
)
SELECT 'plsql',COLUMN_VALUE FROM (SELECT liz FROM sub) tmp,TABLE(tmp.liz)
;

WITH a AS (
SELECT item_tbl('A0001','A0002','A0002','A0004','A0004') AS a FROM dual
)
,b AS (
SELECT item_tbl('A0001','A0003','A0003','A0004','A0004','A0007') AS b FROM dual
)
SELECT DISTINCT 'sql',s1.COLUMN_VALUE FROM (SELECT * FROM a),TABLE(a) s1
where not exists (
                    select
                        1
                    from
                        (SELECT 'sql',COLUMN_VALUE FROM (SELECT * FROM b),TABLE(b))s2
                    where
                        s1.COLUMN_VALUE = s2.COLUMN_VALUE
                    )
;

WITH sub AS (
SELECT * FROM multi_ope_nt WHERE ope = 'A_EXCEPT_DISTINCT_B'
)
SELECT 'plsql',COLUMN_VALUE FROM (SELECT liz FROM sub) tmp,TABLE(tmp.liz)
;


WITH a AS (
SELECT item_tbl('A0001','A0002','A0002','A0004','A0004') AS a FROM dual
)
,b AS (
SELECT item_tbl('A0001','A0003','A0003','A0004','A0004','A0007') AS b FROM dual
)
SELECT DISTINCT 'sql',s1.COLUMN_VALUE FROM (SELECT * FROM b),TABLE(b) s1
where not exists (
                    select
                        1
                    from
                        (SELECT 'sql',COLUMN_VALUE FROM (SELECT * FROM a),TABLE(a))s2
                    where
                        s1.COLUMN_VALUE = s2.COLUMN_VALUE
                    )
;

WITH sub AS (
SELECT * FROM multi_ope_nt WHERE ope = 'B_EXCEPT_DISTINCT_A'
)
SELECT 'plsql',COLUMN_VALUE FROM (SELECT liz FROM sub) tmp,TABLE(tmp.liz)
;



