CREATE TABLE where_spec_mst (
    where_spec_id       CHAR(2 BYTE) NOT NULL
    , where_spec_col_01   VARCHAR2(180 BYTE)
    , where_spec_col_02   VARCHAR2(180 BYTE)
    , where_spec_col_03   VARCHAR2(180 BYTE)
    , where_spec_col_04   VARCHAR2(180 BYTE)
    , where_spec_col_05   VARCHAR2(180 BYTE)
    , where_spec_col_06   VARCHAR2(180 BYTE)
    , where_spec_col_07   VARCHAR2(180 BYTE)
    , where_spec_col_08   VARCHAR2(180 BYTE)
    , where_spec_col_09   VARCHAR2(180 BYTE)
    , where_spec_val_01   VARCHAR2(180 BYTE)
    , where_spec_val_02   VARCHAR2(180 BYTE)
    , where_spec_val_03   VARCHAR2(180 BYTE)
    , where_spec_val_04   VARCHAR2(180 BYTE)
    , where_spec_val_05   VARCHAR2(180 BYTE)
    , where_spec_val_06   VARCHAR2(180 BYTE)
    , where_spec_val_07   VARCHAR2(180 BYTE)
    , where_spec_val_08   VARCHAR2(180 BYTE)
    , where_spec_val_09   VARCHAR2(180 BYTE)
    , PRIMARY KEY ( where_spec_id )
);

SET DEFINE OFF;
INSERT INTO where_spec_mst (where_spec_id,where_spec_col_01,where_spec_col_02,where_spec_col_03,where_spec_col_04,where_spec_col_05,where_spec_col_06,where_spec_col_07,where_spec_col_08,where_spec_col_09,where_spec_val_01,where_spec_val_02,where_spec_val_03,where_spec_val_04,where_spec_val_05,where_spec_val_06,where_spec_val_07,where_spec_val_08,where_spec_val_09) VALUES ('01','CUST_ID',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,':CUST_ID',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO where_spec_mst (where_spec_id,where_spec_col_01,where_spec_col_02,where_spec_col_03,where_spec_col_04,where_spec_col_05,where_spec_col_06,where_spec_col_07,where_spec_col_08,where_spec_col_09,where_spec_val_01,where_spec_val_02,where_spec_val_03,where_spec_val_04,where_spec_val_05,where_spec_val_06,where_spec_val_07,where_spec_val_08,where_spec_val_09) VALUES ('02','CUST_ID','PURCHASE_DATE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,':CUST_ID',':PURCHASE_DATE',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO where_spec_mst (where_spec_id,where_spec_col_01,where_spec_col_02,where_spec_col_03,where_spec_col_04,where_spec_col_05,where_spec_col_06,where_spec_col_07,where_spec_col_08,where_spec_col_09,where_spec_val_01,where_spec_val_02,where_spec_val_03,where_spec_val_04,where_spec_val_05,where_spec_val_06,where_spec_val_07,where_spec_val_08,where_spec_val_09) VALUES ('03','PURCHASE_DATE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,':PURCHASE_DATE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
COMMIT;

SELECT
    *
FROM
    where_spec_mst
    UNPIVOT((where_spec_col, where_spec_val) FOR vals IN (
             (where_spec_col_01,where_spec_val_01)
            ,(where_spec_col_02,where_spec_val_02)
            ,(where_spec_col_03,where_spec_val_03)
            ,(where_spec_col_04,where_spec_val_04)
            ,(where_spec_col_05,where_spec_val_05)
            ,(where_spec_col_06,where_spec_val_06)
            ,(where_spec_col_07,where_spec_val_07)
            ,(where_spec_col_08,where_spec_val_08)
            ,(where_spec_col_09,where_spec_val_09)
    )
)
;
