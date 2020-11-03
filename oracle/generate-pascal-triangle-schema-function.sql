COL ln FOR a10
COL triangle FOR a50

WITH sub AS(
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
;
