CREATE OR REPLACE TYPE item IS OBJECT(rn NUMBER,ln VARCHAR2(4000));
/
CREATE OR REPLACE TYPE liz IS TABLE OF item;
/
WITH
	FUNCTION calc(p_liz liz) RETURN liz IS
	rt liz :=NULL;
BEGIN
	SELECT
		item(rn,seg)
	BULK COLLECT
	INTO rt
	FROM
		(
		WITH sub AS(
		SELECT
			s1.rn
			,s1.ln
			,ROWNUM AS seq
			,decode(ROWNUM,1,substr(s1.ln,1,1),substr(s1.ln,instr(s1.ln,'-',1,ROWNUM - 1) + 1,nvl(nullif(instr(s1.ln,'-',1,ROWNUM),0),4000) - instr(s1.ln,'-',1,ROWNUM - 1) - 1)) AS seg
		FROM
			(SELECT rn,ln || '-0' AS ln FROM TABLE(p_liz)) s1
		CONNECT BY
			LENGTH(s1.ln) - LENGTH(REPLACE(s1.ln,'-','')) + 1 >= LEVEL
		)
		SELECT
			rn + 1 AS rn
			,LISTAGG(to_number(seg) + to_number(pre_seg),'-')WITHIN GROUP (ORDER BY seq)  AS seg
		FROM
			(
			SELECT
				rn
				,seq
				,seg
				,LAG(seg,1,0)OVER(ORDER BY seq) AS pre_seg
			FROM
				sub
			)
		GROUP BY
			rn + 1
		);
	RETURN rt;
END;
sub AS(
SELECT LEVEL AS rn FROM dual CONNECT BY LEVEL <= 5
),rec(rn,ln)AS(
SELECT s1.rn,to_char(s1.rn) FROM sub s1 WHERE s1.rn = 1
UNION ALL
SELECT s2.rn,s2.ln FROM rec s1,TABLE(calc(liz(item(s1.rn,to_char(s1.ln)))))s2
WHERE
	s1.rn < 5
)SELECT
	s1.*
	,MAX(LENGTH(s1.ln))OVER() AS mx
	,LENGTH(s1.ln) AS len
	,MAX(LENGTH(s1.ln))OVER() - LENGTH(s1.ln) AS dif
	,(MAX(LENGTH(s1.ln))OVER() - LENGTH(s1.ln))/2 AS div
	,TRUNC((MAX(LENGTH(s1.ln))OVER() - LENGTH(s1.ln))/2,0) AS tnc
	,lpad(' ',TRUNC((MAX(LENGTH(s1.ln))OVER() - LENGTH(s1.ln))/2,0),' ') || s1.ln AS triangle
FROM
	rec s1
/
