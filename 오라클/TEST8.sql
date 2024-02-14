select * from dba_profiles where profile = 'DEFAULT';
select * from dba_profiles where resource_name = 'PASSWORD_LIFE_TIME';
alter profile default limit password_life_time unlimited;
-------------------------------------------------------------------------

SELECT ROWNUM, ROWID, C.* FROM CUSTOMERS C WHERE CUST_GENDER = 'F';

SELECT * FROM CUSTOMERS WHERE ROWNUM < 1000 AND CUST_GENDER = 'M';

SELECT ROWNUM RN, C.* 
FROM (SELECT * FROM CUSTOMERS WHERE CUST_GENDER = 'M') C
WHERE ROWNUM <= 500;
-------------------------------------------------------------------------

SELECT ROWNUM RN, C.* 
FROM (SELECT * FROM CUSTOMERS WHERE CUST_GENDER = 'M') C
WHERE ROWNUM <= 500
ORDER BY CUST_ID;

--잘못된 페이징 쿼리
SELECT ROWNUM RN, C.* 
FROM (SELECT * FROM CUSTOMERS WHERE CUST_GENDER = 'M' ORDER BY CUST_ID) C
WHERE ROWNUM >= 11 AND ROWNUM <= 50;
-------------------------------------------------------------------------

--가장 안쪽 서브쿼리
SELECT * FROM CUSTOMERS WHERE CUST_GENDER = 'M' ORDER BY CUST_ID;

--다음 서브쿼리
SELECT ROWNUM RN, C.* 
FROM (SELECT * FROM CUSTOMERS WHERE CUST_GENDER = 'M' ORDER BY CUST_ID) C;

--정상적인 페이징 쿼리 (두번의 서브쿼리로 ROWNUM을 컬럼으로 만들어 사용)
SELECT * FROM 
(SELECT ROWNUM RN, C.* 
FROM (SELECT * FROM CUSTOMERS WHERE CUST_GENDER = 'M' ORDER BY CUST_ID) C
)
WHERE RN >= 11 AND RN <= 50;

--정상적인 페이징 쿼리
SELECT * FROM 
(SELECT ROWNUM RN, C2.* FROM CUSTOMERS C2 WHERE CUST_GENDER = 'M')
WHERE RN BETWEEN 10 AND 20;
-------------------------------------------------------------------------

ALTER TABLE EMP ADD DNAME VARCHAR2(20);
DESC EMP;

MERGE INTO EMP
USING DEPT
ON (EMP.DEPTNO = DEPT.DEPTNO)
WHEN MATCHED THEN
UPDATE SET EMP.DNAME = DEPT.DNAME --UPDATE문 필수
DELETE WHERE EMP.MGR IS NULL --DELETE문은 UPDATE문이 있어야만 가능
--WHEN NOT MATCHED THEN
--INSERT (EMPNO, ENAME) VALUES (9999, 'TEST') --NOT MATCHED문에는 INSERT문만 가능
;

ROLLBACK;
-------------------------------------------------------------------------

MERGE INTO EMP
USING DEPT
ON (EMP.DEPTNO = DEPT.DEPTNO)
WHEN MATCHED THEN
UPDATE SET EMP.DNAME = DEPT.DNAME 
--MERGE절에도 WHERE절 사용가능, 서브쿼리를 이용하는 것보다 속도가 느리다.
WHERE EMP.DEPTNO = 10;

ROLLBACK;
-------------------------------------------------------------------------

MERGE INTO (SELECT * FROM EMP WHERE DEPTNO = 20) E
USING DEPT D
ON (E.DEPTNO = D.DEPTNO)
WHEN MATCHED THEN
UPDATE SET E.DNAME = D.DNAME;

ROLLBACK;
-------------------------------------------------------------------------

MERGE INTO (SELECT * FROM EMP WHERE DEPTNO = 30) E
USING 
(SELECT DEPARTMENT_NAME, DEPTNO 
FROM DEPT DD, DEPARTMENTS S WHERE DD.DEPTNO = S.DEPARTMENT_ID) D
ON (E.DEPTNO = D.DEPTNO)
WHEN MATCHED THEN
UPDATE SET E.DNAME = D.DEPARTMENT_NAME;

--서브쿼리절 따로 확인
--SELECT DEPARTMENT_NAME, DEPTNO 
--FROM DEPT DD, DEPARTMENTS S WHERE DD.DEPTNO = S.DEPARTMENT_ID;

ROLLBACK;
-------------------------------------------------------------------------

CREATE TABLE EMP01 AS SELECT * FROM EMP WHERE DEPTNO = 10;

SELECT * FROM EMP01;

MERGE INTO EMP01 A
USING (SELECT EMPNO, SAL, JOB FROM EMP WHERE DEPTNO = 10) B
ON (A.EMPNO = B.EMPNO)
WHEN MATCHED THEN
UPDATE SET A.SAL = SAL + SAL * 0.01
WHEN NOT MATCHED THEN
INSERT (A.EMPNO, SAL, JOB) VALUES (B.EMPNO, B.SAL, B.JOB);

ROLLBACK;
-------------------------------------------------------------------------

MERGE INTO EMP01 A
USING (SELECT EMPNO, SAL, JOB FROM EMP WHERE DEPTNO = 20) B
ON (A.EMPNO = B.EMPNO)
WHEN MATCHED THEN
UPDATE SET A.SAL = SAL+SAL*0.01
WHEN NOT MATCHED THEN
INSERT (A.EMPNO, SAL, JOB) VALUES (B.EMPNO, B.SAL, B.JOB);

ROLLBACK;
-------------------------------------------------------------------------

MERGE INTO EMP01 A
USING (SELECT EMPNO, SAL, JOB FROM EMP WHERE ENAME = 'KING' AND DEPTNO = 10) B
ON (A.EMPNO = B.EMPNO)
WHEN MATCHED THEN
UPDATE SET A.SAL = 8000
WHEN NOT MATCHED THEN
INSERT (A.EMPNO, SAL, JOB) VALUES (B.EMPNO, B.SAL, B.JOB);

ROLLBACK;
-------------------------------------------------------------------------

MERGE INTO EMP01 A
USING (SELECT EMPNO, SAL, JOB FROM EMP WHERE ENAME = 'KING' AND DEPTNO = 10) B
ON (A.EMPNO = B.EMPNO)
WHEN MATCHED THEN
UPDATE SET A.SAL = 8000
DELETE WHERE A.DEPTNO = 10 --기준이 되는 USING절 중에만 적용됨
WHEN NOT MATCHED THEN
INSERT (A.EMPNO, SAL, JOB) VALUES (B.EMPNO, B.SAL, B.JOB);

ROLLBACK;
-------------------------------------------------------------------------

DROP TABLE EMP01 PURGE;
-------------------------------------------------------------------------