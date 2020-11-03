SET PAGESIZE 50000
SET LINESIZE 1000
SET TAB OFF
SET TRIMSPOOL ON
COL triangle FOR a170

DEFINE stk=15
/
CREATE OR REPLACE TYPE item IS OBJECT(rn NUMBER,ln VARCHAR2(4000));
/
CREATE OR REPLACE TYPE liz IS TABLE OF item;
/
CREATE OR REPLACE FUNCTION calc_rec (
	p_liz liz
	, p_stk NUMBER
) RETURN liz AS
	rt   liz := p_liz;
BEGIN
	SELECT
		CASE
			WHEN p_stk = 0 THEN liz(item(NULL, NULL) )
			ELSE rt MULTISET UNION ALL calc_rec(CAST(collect(item(rn, seg) ) AS liz), p_stk - 1)
		END
	INTO rt
	FROM
		(
			WITH sub AS (
				SELECT
					s1.rn
					, s1.ln
					, ROWNUM AS seq
					, DECODE(ROWNUM, 1, substr(s1.ln, 1, 1), substr(s1.ln, instr(s1.ln, '-', 1, ROWNUM - 1) + 1, nvl(nullif(instr(s1.ln, '-', 1, ROWNUM), 0), 4000) - instr(s1.ln, '-', 1, ROWNUM - 1) - 1) ) AS seg
				FROM
					(
						SELECT
							rn
							, ln || '-0' AS ln
						FROM
							TABLE ( p_liz )
					) s1
				CONNECT BY
					length(s1.ln) - length(replace(s1.ln, '-', '') ) + 1 >= level
			) SELECT
				rn + 1 AS rn
				, LISTAGG(to_number(seg) + to_number(pre_seg), '-') WITHIN GROUP(
					ORDER BY
						seq
				) AS seg
			  FROM
				(
					SELECT
						rn
						, seq
						, seg
						, LAG(seg, 1, 0) OVER(
							ORDER BY
								seq
						) AS pre_seg
					FROM
						sub
				)
			  GROUP BY
				rn + 1
		);

	RETURN rt;
END;
/

SELECT
	lpad(' ',TRUNC((MAX(LENGTH(ln))OVER() - LENGTH(ln))/2,0),' ') || ln AS triangle
FROM
	TABLE(calc_rec(liz(item(1,'1')),&stk))
WHERE
	rn IS NOT NULL
/
