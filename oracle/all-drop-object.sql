CREATE OR REPLACE PROCEDURE all_drop_obj AS CURSOR csr IS WITH sub AS ( SELECT object_type , object_name FROM user_objects s1 WHERE EXISTS ( SELECT 1 FROM user_objects s2 WHERE s1.object_type = s2.object_type ) AND NOT EXISTS ( SELECT 1 FROM user_objects s2 WHERE s2.object_type = 'PROCEDURE' AND s2.object_name = 'ALL_DROP_OBJ' AND s1.object_type = s2.object_type AND s1.object_name = s2.object_name ) ) SELECT CASE WHEN s1.object_type = 'JOB' THEN 'BEGIN DBMS_SCHEDULER.DROP_JOB('|| Q'Q'Q' || s1.object_name || Q'Q'Q' ||'); END;' WHEN s1.object_type = 'CREDENTIAL' THEN 'BEGIN DBMS_SCHEDULER.DROP_CREDENTIAL('|| Q'Q'Q' || s1.object_name || Q'Q'Q' ||'); END;' ELSE 'DROP ' || s1.object_type || ' ' || s1.object_name || CASE WHEN s1.object_type = 'TABLE' THEN ' CASCADE CONSTRAINTS PURGE' WHEN s1.object_type IN ( 'SYNONYM' , 'TYPE' ) THEN ' FORCE' ELSE '' END END AS build_sql FROM sub s1; build_sql CLOB; BEGIN build_sql := to_clob(' '); OPEN csr; LOOP BEGIN FETCH csr INTO build_sql; EXIT WHEN csr%notfound; dbms_output.put_line(build_sql); EXECUTE IMMEDIATE build_sql; EXCEPTION WHEN OTHERS THEN dbms_output.put_line('[ '|| SQLCODE||']'||sqlerrm); END; END LOOP; CLOSE csr; END; / exec ALL_DROP_OBJ; /
