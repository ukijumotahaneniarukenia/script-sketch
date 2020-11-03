--SET TIMING ON
--ALTER SYSTEM FLUSH SHARED_POOL;
--ALTER SYSTEM FLUSH BUFFER_CACHE;

DROP TABLE csv_items_spring;
DROP TABLE csv_items_summer;
DROP TABLE csv_items_autumn;
DROP TABLE csv_items_winter;

CREATE TABLE csv_items_spring AS
SELECT
    to_char(EXTRACT(YEAR FROM purchase_date) ) AS yyyy
    ,lpad(to_char(EXTRACT(MONTH FROM purchase_date) ), 2, 0) AS mm
    ,'spring' AS seasons
    , purchase_date
    , cust_id
    , items
FROM
    csv_items
WHERE
    to_char(EXTRACT(YEAR FROM purchase_date) ) = '2018'
AND lpad(to_char(EXTRACT(MONTH FROM purchase_date) ), 2, 0) IN ('03','04','05')
;
CREATE TABLE csv_items_summer AS
SELECT
    to_char(EXTRACT(YEAR FROM purchase_date) ) AS yyyy
    ,lpad(to_char(EXTRACT(MONTH FROM purchase_date) ), 2, 0) AS mm
    ,'summer' AS seasons
    , purchase_date
    , cust_id
    , items
FROM
    csv_items
WHERE
    to_char(EXTRACT(YEAR FROM purchase_date) ) = '2018'
AND lpad(to_char(EXTRACT(MONTH FROM purchase_date) ), 2, 0) IN ('06','07','08')
;
CREATE TABLE csv_items_autumn AS
SELECT
    to_char(EXTRACT(YEAR FROM purchase_date) ) AS yyyy
    ,lpad(to_char(EXTRACT(MONTH FROM purchase_date) ), 2, 0) AS mm
    ,'autumn' AS seasons
    , purchase_date
    , cust_id
    , items
FROM
    csv_items
WHERE
    to_char(EXTRACT(YEAR FROM purchase_date) ) = '2018'
AND lpad(to_char(EXTRACT(MONTH FROM purchase_date) ), 2, 0) IN ('09','10','11')
;
CREATE TABLE csv_items_winter AS
SELECT
    to_char(EXTRACT(YEAR FROM purchase_date) ) AS yyyy
    ,lpad(to_char(EXTRACT(MONTH FROM purchase_date) ), 2, 0) AS mm
    ,'winter' AS seasons
    , purchase_date
    , cust_id
    , items
FROM
    csv_items
WHERE
    to_char(EXTRACT(YEAR FROM purchase_date) ) = '2018'
AND lpad(to_char(EXTRACT(MONTH FROM purchase_date) ), 2, 0) IN ('12','01','02')
;


--SET TIMING ON
--ALTER SYSTEM FLUSH SHARED_POOL;
--ALTER SYSTEM FLUSH BUFFER_CACHE;

DROP TABLE csv_items_spring;
DROP TABLE csv_items_summer;
DROP TABLE csv_items_autumn;
DROP TABLE csv_items_winter;

CREATE TABLE csv_items_spring AS SELECT 'yyyy' AS yyyy, 'mm' AS mm,'seasons' AS seasons,src.* FROM csv_items src WHERE 1 = 0;
CREATE TABLE csv_items_summer AS SELECT 'yyyy' AS yyyy, 'mm' AS mm,'seasons' AS seasons,src.* FROM csv_items src WHERE 1 = 0;
CREATE TABLE csv_items_autumn AS SELECT 'yyyy' AS yyyy, 'mm' AS mm,'seasons' AS seasons,src.* FROM csv_items src WHERE 1 = 0;
CREATE TABLE csv_items_winter AS SELECT 'yyyy' AS yyyy, 'mm' AS mm,'seasons' AS seasons,src.* FROM csv_items src WHERE 1 = 0;

INSERT ALL
    WHEN seasons = 'spring' THEN
    INTO csv_items_spring (yyyy,mm,seasons,purchase_date,cust_id,items) VALUES (yyyy,mm,seasons,purchase_date,cust_id,items)
    WHEN seasons = 'summer' THEN
    INTO csv_items_summer (yyyy,mm,seasons,purchase_date,cust_id,items) VALUES (yyyy,mm,seasons,purchase_date,cust_id,items)
    WHEN seasons = 'autumn' THEN
    INTO csv_items_autumn (yyyy,mm,seasons,purchase_date,cust_id,items) VALUES (yyyy,mm,seasons,purchase_date,cust_id,items)
    WHEN seasons = 'winter' THEN
    INTO csv_items_winter (yyyy,mm,seasons,purchase_date,cust_id,items) VALUES (yyyy,mm,seasons,purchase_date,cust_id,items)
SELECT
    to_char(EXTRACT(YEAR FROM purchase_date) ) AS yyyy
    ,lpad(to_char(EXTRACT(MONTH FROM purchase_date) ), 2, 0) AS mm
    , CASE
        WHEN lpad(to_char(EXTRACT(MONTH FROM purchase_date) ), 2, 0) = '03' THEN 'spring'
        WHEN lpad(to_char(EXTRACT(MONTH FROM purchase_date) ), 2, 0) = '04' THEN 'spring'
        WHEN lpad(to_char(EXTRACT(MONTH FROM purchase_date) ), 2, 0) = '05' THEN 'spring'
        WHEN lpad(to_char(EXTRACT(MONTH FROM purchase_date) ), 2, 0) = '06' THEN 'summer'
        WHEN lpad(to_char(EXTRACT(MONTH FROM purchase_date) ), 2, 0) = '07' THEN 'summer'
        WHEN lpad(to_char(EXTRACT(MONTH FROM purchase_date) ), 2, 0) = '08' THEN 'summer'
        WHEN lpad(to_char(EXTRACT(MONTH FROM purchase_date) ), 2, 0) = '09' THEN 'autumn'
        WHEN lpad(to_char(EXTRACT(MONTH FROM purchase_date) ), 2, 0) = '10' THEN 'autumn'
        WHEN lpad(to_char(EXTRACT(MONTH FROM purchase_date) ), 2, 0) = '11' THEN 'autumn'
        WHEN lpad(to_char(EXTRACT(MONTH FROM purchase_date) ), 2, 0) = '12' THEN 'winter'
        WHEN lpad(to_char(EXTRACT(MONTH FROM purchase_date) ), 2, 0) = '01' THEN 'winter'
        WHEN lpad(to_char(EXTRACT(MONTH FROM purchase_date) ), 2, 0) = '02' THEN 'winter'
        ELSE NULL
    END AS seasons
    , purchase_date
    , cust_id
    , items
FROM
    csv_items
WHERE
    to_char(EXTRACT(YEAR FROM purchase_date) ) = '2018'
;
COMMIT;

--SET TIMING ON
--ALTER SYSTEM FLUSH SHARED_POOL;
--ALTER SYSTEM FLUSH BUFFER_CACHE;

--▼20180925追記
CREATE OR REPLACE TYPE items_tbl AS TABLE OF VARCHAR2(4000);
/
--▲20180925追記

DROP TABLE csv_items_spring_nt;
DROP TABLE csv_items_summer_nt;
DROP TABLE csv_items_autumn_nt;
DROP TABLE csv_items_winter_nt;

CREATE OR REPLACE TYPE items_tbl_liz AS OBJECT(
    yyyy CHAR(4)
    ,mm CHAR(2)
    ,purchase_date DATE
    ,cust_id CHAR(6)
    ,liz items_tbl
);
/

CREATE TABLE csv_items_spring_nt OF items_tbl_liz NESTED TABLE liz STORE AS liz_spring_nt;
CREATE TABLE csv_items_summer_nt OF items_tbl_liz NESTED TABLE liz STORE AS liz_summer_nt;
CREATE TABLE csv_items_autumn_nt OF items_tbl_liz NESTED TABLE liz STORE AS liz_autumn_nt;
CREATE TABLE csv_items_winter_nt OF items_tbl_liz NESTED TABLE liz STORE AS liz_winter_nt;

INSERT /*+ APPEND */ INTO csv_items_spring_nt--ダイレクトパスインサート
SELECT
    yyyy
    ,mm
    , purchase_date
    , cust_id
    , segregate(items)
FROM
    csv_items_spring
;
COMMIT;

INSERT /*+ APPEND */ INTO csv_items_summer_nt--ダイレクトパスインサート
SELECT
    yyyy
    ,mm
    , purchase_date
    , cust_id
    , segregate(items)
FROM
    csv_items_summer
;
COMMIT;

INSERT /*+ APPEND */ INTO csv_items_autumn_nt--ダイレクトパスインサート
SELECT
    yyyy
    ,mm
    , purchase_date
    , cust_id
    , segregate(items)
FROM
    csv_items_autumn
;
COMMIT;

INSERT /*+ APPEND */ INTO csv_items_winter_nt--ダイレクトパスインサート
SELECT
    yyyy
    ,mm
    , purchase_date
    , cust_id
    , segregate(items)
FROM
    csv_items_winter
;
COMMIT;

SELECT 'CSV_ITEMS_SPRING' AS tbl,COUNT(*) FROM csv_items_spring GROUP BY 'CSV_ITEMS_SPRING' UNION ALL
SELECT 'CSV_ITEMS_SUMMER' AS tbl,COUNT(*) FROM csv_items_summer GROUP BY 'CSV_ITEMS_SUMMER' UNION ALL
SELECT 'CSV_ITEMS_AUTUMN' AS tbl,COUNT(*) FROM csv_items_autumn GROUP BY 'CSV_ITEMS_AUTUMN' UNION ALL
SELECT 'CSV_ITEMS_WINTER' AS tbl,COUNT(*) FROM csv_items_winter GROUP BY 'CSV_ITEMS_WINTER';

SELECT 'CSV_ITEMS_SPRING_NT' AS tbl,COUNT(*) FROM csv_items_spring_nt GROUP BY 'CSV_ITEMS_SPRING_NT' UNION ALL
SELECT 'CSV_ITEMS_SUMMER_NT' AS tbl,COUNT(*) FROM csv_items_summer_nt GROUP BY 'CSV_ITEMS_SUMMER_NT' UNION ALL
SELECT 'CSV_ITEMS_AUTUMN_NT' AS tbl,COUNT(*) FROM csv_items_autumn_nt GROUP BY 'CSV_ITEMS_AUTUMN_NT' UNION ALL
SELECT 'CSV_ITEMS_WINTER_NT' AS tbl,COUNT(*) FROM csv_items_winter_nt GROUP BY 'CSV_ITEMS_WINTER_NT';

SELECT * FROM csv_items_spring WHERE ROWNUM <= 10 UNION ALL
SELECT * FROM csv_items_summer WHERE ROWNUM <= 10 UNION ALL
SELECT * FROM csv_items_autumn WHERE ROWNUM <= 10 UNION ALL
SELECT * FROM csv_items_winter WHERE ROWNUM <= 10;

SELECT * FROM csv_items_spring_nt WHERE ROWNUM <= 10 UNION ALL
SELECT * FROM csv_items_summer_nt WHERE ROWNUM <= 10 UNION ALL
SELECT * FROM csv_items_autumn_nt WHERE ROWNUM <= 10 UNION ALL
SELECT * FROM csv_items_winter_nt WHERE ROWNUM <= 10;

