SELECT
    T.TABLE_NAME    AS テーブル物理名
    ,REGEXP_REPLACE (TC.COMMENTS, ':.*', '') AS テーブル論理名
    ,C.COLUMN_ID    AS カラムID
    ,CASE
        WHEN PK.COLUMN_POSITION IS NOT NULL THEN PK.COLUMN_POSITION
        ELSE NULL
    END AS PK
    ,CASE
        WHEN IND.IND_01_NM IS NOT NULL THEN IND.IND_01_NM
        ELSE NULL
    END AS IND_01_NM
    ,CASE
        WHEN IND.IND_01_POS IS NOT NULL THEN IND.IND_01_POS
        ELSE NULL
    END AS IND_01_POS
    ,CASE
        WHEN IND.IND_01_UNI IS NOT NULL THEN
            CASE
                WHEN IND.IND_01_UNI = 'UNIQUE' THEN 'Y'
                ELSE 'N'
            END
        ELSE NULL
    END AS IND_01_UNI
    ,CASE
        WHEN IND.IND_01_SORT IS NOT NULL THEN IND.IND_01_SORT
        ELSE NULL
    END AS IND_01_SORT
    ,CASE
        WHEN IND.IND_02_NM IS NOT NULL THEN IND.IND_02_NM
        ELSE NULL
    END AS IND_02_NM
    ,CASE
        WHEN IND.IND_02_POS IS NOT NULL THEN IND.IND_02_POS
        ELSE NULL
    END AS IND_02_POS
    ,CASE
        WHEN IND.IND_02_UNI IS NOT NULL THEN
            CASE
                WHEN IND.IND_02_UNI = 'UNIQUE' THEN 'Y'
                ELSE 'N'
            END
        ELSE NULL
    END AS IND_02_UNI
    ,CASE
        WHEN IND.IND_02_SORT IS NOT NULL THEN IND.IND_02_SORT
        ELSE NULL
    END AS IND_02_SORT
    ,CASE
        WHEN IND.IND_03_NM IS NOT NULL THEN IND.IND_03_NM
        ELSE NULL
    END AS IND_03_NM
    ,CASE
        WHEN IND.IND_03_POS IS NOT NULL THEN IND.IND_03_POS
        ELSE NULL
    END AS IND_03_POS
    ,CASE
        WHEN IND.IND_03_UNI IS NOT NULL THEN
            CASE
                WHEN IND.IND_03_UNI = 'UNIQUE' THEN 'Y'
                ELSE 'N'
            END
        ELSE NULL
    END AS IND_03_UNI
    ,CASE
        WHEN IND.IND_03_SORT IS NOT NULL THEN IND.IND_03_SORT
        ELSE NULL
    END AS IND_03_SORT
    ,CASE
        WHEN IND.IND_04_NM IS NOT NULL THEN IND.IND_04_NM
        ELSE NULL
    END AS IND_04_NM
    ,CASE
        WHEN IND.IND_04_POS IS NOT NULL THEN IND.IND_04_POS
        ELSE NULL
    END AS IND_04_POS
    ,CASE
        WHEN IND.IND_04_UNI IS NOT NULL THEN
            CASE
                WHEN IND.IND_04_UNI = 'UNIQUE' THEN 'Y'
                ELSE 'N'
            END
        ELSE NULL
    END AS IND_04_UNI
    ,CASE
        WHEN IND.IND_04_SORT IS NOT NULL THEN IND.IND_04_SORT
        ELSE NULL
    END AS IND_04_SORT
    ,CASE
        WHEN IND.IND_05_NM IS NOT NULL THEN IND.IND_05_NM
        ELSE NULL
    END AS IND_05_NM
    ,CASE
        WHEN IND.IND_05_POS IS NOT NULL THEN IND.IND_05_POS
        ELSE NULL
    END AS IND_05_POS
    ,CASE
        WHEN IND.IND_05_UNI IS NOT NULL THEN
            CASE
                WHEN IND.IND_05_UNI = 'UNIQUE' THEN 'Y'
                ELSE 'N'
            END
        ELSE NULL
    END AS IND_05_UNI
    ,CASE
        WHEN IND.IND_05_SORT IS NOT NULL THEN IND.IND_05_SORT
        ELSE NULL
    END AS IND_05_SORT
    ,CASE
        WHEN IND.IND_06_NM IS NOT NULL THEN IND.IND_06_NM
        ELSE NULL
    END AS IND_06_NM
    ,CASE
        WHEN IND.IND_06_POS IS NOT NULL THEN IND.IND_06_POS
        ELSE NULL
    END AS IND_06_POS
    ,CASE
        WHEN IND.IND_06_UNI IS NOT NULL THEN
            CASE
                WHEN IND.IND_06_UNI = 'UNIQUE' THEN 'Y'
                ELSE 'N'
            END
        ELSE NULL
    END AS IND_06_UNI
    ,CASE
        WHEN IND.IND_06_SORT IS NOT NULL THEN IND.IND_06_SORT
        ELSE NULL
    END AS IND_06_SORT
    ,CASE
        WHEN IND.IND_07_NM IS NOT NULL THEN IND.IND_07_NM
        ELSE NULL
    END AS IND_07_NM
    ,CASE
        WHEN IND.IND_07_POS IS NOT NULL THEN IND.IND_07_POS
        ELSE NULL
    END AS IND_07_POS
    ,CASE
        WHEN IND.IND_07_UNI IS NOT NULL THEN
            CASE
                WHEN IND.IND_07_UNI = 'UNIQUE' THEN 'Y'
                ELSE 'N'
            END
        ELSE NULL
    END AS IND_07_UNI
    ,CASE
        WHEN IND.IND_07_SORT IS NOT NULL THEN IND.IND_07_SORT
        ELSE NULL
    END AS IND_07_SORT
    ,CASE
        WHEN IND.IND_08_NM IS NOT NULL THEN IND.IND_08_NM
        ELSE NULL
    END AS IND_08_NM
    ,CASE
        WHEN IND.IND_08_POS IS NOT NULL THEN IND.IND_08_POS
        ELSE NULL
    END AS IND_08_POS
    ,CASE
        WHEN IND.IND_08_UNI IS NOT NULL THEN
            CASE
                WHEN IND.IND_08_UNI = 'UNIQUE' THEN 'Y'
                ELSE 'N'
            END
        ELSE NULL
    END AS IND_08_UNI
    ,CASE
        WHEN IND.IND_08_SORT IS NOT NULL THEN IND.IND_08_SORT
        ELSE NULL
    END AS IND_08_SORT
    ,CASE
        WHEN IND.IND_09_NM IS NOT NULL THEN IND.IND_09_NM
        ELSE NULL
    END AS IND_09_NM
    ,CASE
        WHEN IND.IND_09_POS IS NOT NULL THEN IND.IND_09_POS
        ELSE NULL
    END AS IND_09_POS
    ,CASE
        WHEN IND.IND_09_UNI IS NOT NULL THEN
            CASE
                WHEN IND.IND_09_UNI = 'UNIQUE' THEN 'Y'
                ELSE 'N'
            END
        ELSE NULL
    END AS IND_09_UNI
    ,CASE
        WHEN IND.IND_09_SORT IS NOT NULL THEN IND.IND_09_SORT
        ELSE NULL
    END AS IND_09_SORT
    ,CASE
        WHEN IND.IND_10_NM IS NOT NULL THEN IND.IND_10_NM
        ELSE NULL
    END AS IND_10_NM
    ,CASE
        WHEN IND.IND_10_POS IS NOT NULL THEN IND.IND_10_POS
        ELSE NULL
    END AS IND_10_POS
    ,CASE
        WHEN IND.IND_10_UNI IS NOT NULL THEN
            CASE
                WHEN IND.IND_10_UNI = 'UNIQUE' THEN 'Y'
                ELSE 'N'
            END
        ELSE NULL
    END AS IND_10_UNI
    ,CASE
        WHEN IND.IND_10_SORT IS NOT NULL THEN IND.IND_10_SORT
        ELSE NULL
    END AS IND_10_SORT
    ,CC.COMMENTS    AS カラム論理名
    ,C.COLUMN_NAME  AS カラム物理名
    ,C.DATA_TYPE AS データタイプ
    ,CASE
        WHEN C.DATA_PRECISION IS NOT NULL THEN TO_CHAR(C.DATA_PRECISION)
        ELSE TO_CHAR(C.DATA_LENGTH)
    END AS 桁数
    ,CASE
        WHEN C.DATA_SCALE IS NOT NULL THEN TO_CHAR(C.DATA_SCALE)
        ELSE NULL
    END AS 精度
    ,C.NULLABLE AS NULLABLE
    ,C.DATA_DEFAULT AS デフォルト値
    ,REGEXP_REPLACE (TC.COMMENTS, '.*:', '') AS コメント
FROM
    USER_TABLES T
        INNER JOIN USER_TAB_COMMENTS TC
            ON
                T.TABLE_NAME = TC.TABLE_NAME
        INNER JOIN USER_TAB_COLUMNS C
            ON
                T.TABLE_NAME = C.TABLE_NAME
        INNER JOIN USER_COL_COMMENTS CC
            ON
                T.TABLE_NAME = CC.TABLE_NAME
            AND C.COLUMN_NAME = CC.COLUMN_NAME
        LEFT OUTER JOIN (
                            SELECT
                                IND.INDEX_NAME
                                ,CONST.TABLE_NAME
                                ,IND.COLUMN_NAME
                                ,IND.COLUMN_POSITION
                            FROM
                                USER_IND_COLUMNS IND
                                    INNER JOIN USER_CONSTRAINTS CONST
                                        ON
                                            IND.INDEX_NAME = CONST.CONSTRAINT_NAME
                                        AND CONSTRAINT_TYPE = 'P'
                        ) PK
            ON
                T.TABLE_NAME = PK.TABLE_NAME
            AND C.COLUMN_NAME = PK.COLUMN_NAME
        LEFT OUTER JOIN (
                            SELECT
                                SRC.TABLE_NAME
                                ,SRC.COLUMN_NAME
                                ,MAX(
                                     CASE
                                        WHEN SRC.RN = 1 THEN SRC.INDEX_NAME
                                        ELSE NULL
                                     END
                                     )AS IND_01_NM
                                ,MAX(
                                     CASE
                                        WHEN SRC.RN = 1 THEN SRC.COLUMN_POSITION
                                        ELSE NULL
                                     END
                                     )AS IND_01_POS
                                ,MAX(
                                     CASE
                                        WHEN SRC.RN = 1 THEN SRC.UNIQUENESS
                                        ELSE NULL
                                     END
                                     )AS IND_01_UNI
                                ,MAX(
                                     CASE
                                        WHEN SRC.RN = 1 THEN SRC.DESCEND
                                        ELSE NULL
                                     END
                                     )AS IND_01_SORT
                                ,MAX(
                                     CASE
                                        WHEN SRC.RN = 2 THEN SRC.INDEX_NAME
                                        ELSE NULL
                                     END
                                     )AS IND_02_NM
                                ,MAX(
                                     CASE
                                        WHEN SRC.RN = 2 THEN SRC.COLUMN_POSITION
                                        ELSE NULL
                                     END
                                     )AS IND_02_POS
                                ,MAX(
                                     CASE
                                        WHEN SRC.RN = 2 THEN SRC.UNIQUENESS
                                        ELSE NULL
                                     END
                                     )AS IND_02_UNI
                                ,MAX(
                                     CASE
                                        WHEN SRC.RN = 2 THEN SRC.DESCEND
                                        ELSE NULL
                                     END
                                     )AS IND_02_SORT
                                ,MAX(
                                     CASE
                                        WHEN SRC.RN = 3 THEN SRC.INDEX_NAME
                                        ELSE NULL
                                     END
                                     )AS IND_03_NM
                                ,MAX(
                                     CASE
                                        WHEN SRC.RN = 3 THEN SRC.COLUMN_POSITION
                                        ELSE NULL
                                     END
                                     )AS IND_03_POS
                                ,MAX(
                                     CASE
                                        WHEN SRC.RN = 3 THEN SRC.UNIQUENESS
                                        ELSE NULL
                                     END
                                     )AS IND_03_UNI
                                ,MAX(
                                     CASE
                                        WHEN SRC.RN = 3 THEN SRC.DESCEND
                                        ELSE NULL
                                     END
                                     )AS IND_03_SORT
                                ,MAX(
                                     CASE
                                        WHEN SRC.RN = 4 THEN SRC.INDEX_NAME
                                        ELSE NULL
                                     END
                                     )AS IND_04_NM
                                ,MAX(
                                     CASE
                                        WHEN SRC.RN = 4 THEN SRC.COLUMN_POSITION
                                        ELSE NULL
                                     END
                                     )AS IND_04_POS
                                ,MAX(
                                     CASE
                                        WHEN SRC.RN = 4 THEN SRC.UNIQUENESS
                                        ELSE NULL
                                     END
                                     )AS IND_04_UNI
                                ,MAX(
                                     CASE
                                        WHEN SRC.RN = 4 THEN SRC.DESCEND
                                        ELSE NULL
                                     END
                                     )AS IND_04_SORT
                                ,MAX(
                                     CASE
                                        WHEN SRC.RN = 5 THEN SRC.INDEX_NAME
                                        ELSE NULL
                                     END
                                     )AS IND_05_NM
                                ,MAX(
                                     CASE
                                        WHEN SRC.RN = 5 THEN SRC.COLUMN_POSITION
                                        ELSE NULL
                                     END
                                     )AS IND_05_POS
                                ,MAX(
                                     CASE
                                        WHEN SRC.RN = 5 THEN SRC.UNIQUENESS
                                        ELSE NULL
                                     END
                                     )AS IND_05_UNI
                                ,MAX(
                                     CASE
                                        WHEN SRC.RN = 5 THEN SRC.DESCEND
                                        ELSE NULL
                                     END
                                     )AS IND_05_SORT
                                ,MAX(
                                     CASE
                                        WHEN SRC.RN = 6 THEN SRC.INDEX_NAME
                                        ELSE NULL
                                     END
                                     )AS IND_06_NM
                                ,MAX(
                                     CASE
                                        WHEN SRC.RN = 6 THEN SRC.COLUMN_POSITION
                                        ELSE NULL
                                     END
                                     )AS IND_06_POS
                                ,MAX(
                                     CASE
                                        WHEN SRC.RN = 6 THEN SRC.UNIQUENESS
                                        ELSE NULL
                                     END
                                     )AS IND_06_UNI
                                ,MAX(
                                     CASE
                                        WHEN SRC.RN = 6 THEN SRC.DESCEND
                                        ELSE NULL
                                     END
                                     )AS IND_06_SORT
                                ,MAX(
                                     CASE
                                        WHEN SRC.RN = 7 THEN SRC.INDEX_NAME
                                        ELSE NULL
                                     END
                                     )AS IND_07_NM
                                ,MAX(
                                     CASE
                                        WHEN SRC.RN = 7 THEN SRC.COLUMN_POSITION
                                        ELSE NULL
                                     END
                                     )AS IND_07_POS
                                ,MAX(
                                     CASE
                                        WHEN SRC.RN = 7 THEN SRC.UNIQUENESS
                                        ELSE NULL
                                     END
                                     )AS IND_07_UNI
                                ,MAX(
                                     CASE
                                        WHEN SRC.RN = 7 THEN SRC.DESCEND
                                        ELSE NULL
                                     END
                                     )AS IND_07_SORT
                                ,MAX(
                                     CASE
                                        WHEN SRC.RN = 8 THEN SRC.INDEX_NAME
                                        ELSE NULL
                                     END
                                     )AS IND_08_NM
                                ,MAX(
                                     CASE
                                        WHEN SRC.RN = 8 THEN SRC.COLUMN_POSITION
                                        ELSE NULL
                                     END
                                     )AS IND_08_POS
                                ,MAX(
                                     CASE
                                        WHEN SRC.RN = 8 THEN SRC.UNIQUENESS
                                        ELSE NULL
                                     END
                                     )AS IND_08_UNI
                                ,MAX(
                                     CASE
                                        WHEN SRC.RN = 8 THEN SRC.DESCEND
                                        ELSE NULL
                                     END
                                     )AS IND_08_SORT
                                ,MAX(
                                     CASE
                                        WHEN SRC.RN = 9 THEN SRC.INDEX_NAME
                                        ELSE NULL
                                     END
                                     )AS IND_09_NM
                                ,MAX(
                                     CASE
                                        WHEN SRC.RN = 9 THEN SRC.COLUMN_POSITION
                                        ELSE NULL
                                     END
                                     )AS IND_09_POS
                                ,MAX(
                                     CASE
                                        WHEN SRC.RN = 9 THEN SRC.UNIQUENESS
                                        ELSE NULL
                                     END
                                     )AS IND_09_UNI
                                ,MAX(
                                     CASE
                                        WHEN SRC.RN = 9 THEN SRC.DESCEND
                                        ELSE NULL
                                     END
                                     )AS IND_09_SORT
                                ,MAX(
                                     CASE
                                        WHEN SRC.RN = 10 THEN SRC.INDEX_NAME
                                        ELSE NULL
                                     END
                                     )AS IND_10_NM
                                ,MAX(
                                     CASE
                                        WHEN SRC.RN = 10 THEN SRC.COLUMN_POSITION
                                        ELSE NULL
                                     END
                                     )AS IND_10_POS
                                ,MAX(
                                     CASE
                                        WHEN SRC.RN = 10 THEN SRC.UNIQUENESS
                                        ELSE NULL
                                     END
                                     )AS IND_10_UNI
                                ,MAX(
                                     CASE
                                        WHEN SRC.RN = 10 THEN SRC.DESCEND
                                        ELSE NULL
                                     END
                                     )AS IND_10_SORT
                            FROM
                                (
                                    SELECT
                                        dense_rank() over (partition by UI.TABLE_NAME order by UI.TABLE_NAME,UI.INDEX_NAME) as rn
                                        ,UI.TABLE_NAME
                                        ,UI.INDEX_NAME
                                        ,UI.UNIQUENESS
                                        ,UIC.COLUMN_NAME
                                        ,UIC.COLUMN_POSITION
                                        ,UIC.DESCEND
                                    FROM
                                        USER_INDEXES UI
                                            INNER JOIN USER_IND_COLUMNS UIC
                                                ON
                                                    UI.INDEX_NAME = UIC.INDEX_NAME
        --                          WHERE
        --                              NOT EXISTS(--セカンダリインデックスのみ取得
        --                                          SELECT
        --                                              1
        --                                          FROM
        --                                              USER_CONSTRAINTS UC
        --                                          WHERE
        --                                              UIC.INDEX_NAME = UC.CONSTRAINT_NAME
        --                                          AND UC.CONSTRAINT_TYPE = 'P'
        --                                          )
                                ) SRC
                            GROUP BY
                                SRC.TABLE_NAME
                                --,SRC.INDEX_NAME
                                ,SRC.COLUMN_NAME
                        ) IND
            ON
                T.TABLE_NAME = IND.TABLE_NAME
            AND C.COLUMN_NAME = IND.COLUMN_NAME
--WHERE
--  T.TABLE_NAME LIKE '%テーブル名%'
ORDER BY
    T.TABLE_NAME
    ,C.COLUMN_ID
;
