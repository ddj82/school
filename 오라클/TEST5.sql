CREATE TABLE DEPT01 AS SELECT * FROM DEPT WHERE 1=0;

INSERT ALL INTO DEPT01 VALUES (DEPTNO, DNAME, LOC) SELECT * FROM DEPT;
COMMIT;

DELETE FROM DEPT01;
COMMIT;
SELECT * FROM DEPT01;
ROLLBACK;
SELECT * FROM DEPT01;



DELETE FROM DEPT01 WHERE DEPTNO = 40;
COMMIT;

--ROLLBACK; 으로 되돌아옴
SELECT * FROM DEPT01; --30 20 10
--1
DELETE FROM DEPT01 WHERE DEPTNO = 30;
--2
SAVEPOINT C1; --책갈피C1
SELECT * FROM DEPT01; --20 10

DELETE FROM DEPT01 WHERE DEPTNO = 20;
--3
SAVEPOINT C2; --책갈피C2
SELECT * FROM DEPT01; --10

DELETE FROM DEPT01 WHERE DEPTNO = 10; -- 없음
--4
ROLLBACK TO C2; --C2로
SELECT * FROM DEPT01; --10

ROLLBACK TO C1; --C1으로, C2는 삭제됨
SELECT * FROM DEPT01; --20 10

ROLLBACK; --전체롤백, C1 삭제
SELECT * FROM DEPT01; --30 20 10

DROP TABLE DEPT01 PURGE;
-------------------------------------------------------


CREATE TABLE DEPT01 AS SELECT * FROM DEPT;
SELECT * FROM DEPT01;

SAVEPOINT C4; --40 30 20 10
DELETE FROM DEPT01 WHERE DEPTNO = 40;
SELECT * FROM DEPT01;

SAVEPOINT C3; --30 20 10
DELETE FROM DEPT01 WHERE DEPTNO = 30;
SELECT * FROM DEPT01;

SAVEPOINT C2; --20 10
DELETE FROM DEPT01 WHERE DEPTNO = 20;
SELECT * FROM DEPT01;

SAVEPOINT C1; --10
DELETE FROM DEPT01 WHERE DEPTNO = 10;
SELECT * FROM DEPT01; --없음

ROLLBACK TO C4; --40 30 20 10, C3,C2,C1 삭제
SELECT * FROM DEPT01;

ROLLBACK TO C1;
SELECT * FROM DEPT01;

ROLLBACK;
SELECT * FROM DEPT01;
COMMIT;
-------------------------------------------------------

CREATE TABLE DEPT02 AS SELECT * FROM DEPT;
SELECT * FROM DEPT02;

DELETE FROM DEPT02 WHERE DEPTNO = 40; --임시반영
SELECT * FROM DEPT02; --30 20 10

ROLLBACK; --40 30 20 10
SELECT * FROM DEPT02;

DELETE FROM DEPT02 WHERE DEPTNO = 30; --임시반영
SELECT * FROM DEPT02; --40 20 10

CREATE TABLE DEPT03 AS SELECT * FROM DEPT; --자동 COMMIT이 숨어있음

ROLLBACK;
SELECT * FROM DEPT02; --40 20 10
-------------------------------------------------------

CREATE TABLE EMP02 AS SELECT * FROM EMP;
SELECT * FROM EMP02 ORDER BY DEPTNO;

DELETE FROM EMP02 WHERE DEPTNO = 30;
SELECT * FROM EMP02 ORDER BY DEPTNO;

TRUNCATE TABLE EMP02;

ROLLBACK;
SELECT * FROM EMP02;
-------------------------------------------------------

--사원 이름이 'JONES'인 사원의 부서명 출력
SELECT DEPTNO, DNAME FROM DEPT 
WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'JONES');
-- => WHERE DEPTNO = 20;
SELECT DEPTNO FROM EMP WHERE ENAME = 'JONES'; --20
-------------------------------------------------------

--SMITH와 같은 부서에서 근무하는 사원의 사번, 이름, 업무, 입사일자, 상위관리자 정보를 출력

--메인쿼리 : 조건 SMITH와 같은 부서인
SELECT EMPNO, ENAME, DEPTNO, JOB, HIREDATE, MGR FROM EMP
WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'SMITH') 
AND ENAME != 'SMITH'; --기준인 'SMITH'는 제외

--서브쿼리 : SMITH의 부서 찾기
SELECT DEPTNO FROM EMP WHERE ENAME = 'SMITH';
-------------------------------------------------------

--평균 연봉보다 더 많은 연봉를 받는 사원 검색

--메인쿼리 : 더 많은 연봉를 받는 사원
SELECT * FROM EMP WHERE SAL > (SELECT AVG(NVL(SAL, 0)) FROM EMP)
ORDER BY SAL DESC;

--서브쿼리 : 평균 연봉 찾기
SELECT AVG(NVL(SAL, 0)) FROM EMP;
-------------------------------------------------------

--부서번호가 10번인 사원 중에서 최대급여를 받는 사원의 사원번호와 사원명

--메인쿼리 : 최대급여를 받는 사원의 사원번호와 사원명
SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP
WHERE SAL = (SELECT MAX(SAL) FROM EMP WHERE DEPTNO = '10');

--서브쿼리 : 부서번호가 10번인 사원 중에서 최대급여
SELECT MAX(SAL) FROM EMP WHERE DEPTNO = '10';
-------------------------------------------------------

--IN 연산자 사용
/*
BLAKE의 직책과 같은 사람들의 부서번호를 가져와서 
그 부서에서 근무하는 사람들의 이름과 고용일을 출력
*/

--메인쿼리 : 부서번호를 가져와서 그 부서에서 근무하는 사람들의 이름과 고용일을 출력
SELECT ENAME, HIREDATE FROM EMP 
WHERE DEPTNO IN (SELECT DEPTNO FROM EMP 
WHERE JOB = (SELECT JOB FROM EMP WHERE ENAME = 'BLAKE'));
--SELECT ENAME, HIREDATE FROM EMP WHERE DEPTNO IN (10, 20, 30)

--서브쿼리 : BLAKE의 직책과 같은 사람들의 부서번호
SELECT DEPTNO FROM EMP 
WHERE JOB = (SELECT JOB FROM EMP WHERE ENAME = 'BLAKE'); --(10, 20, 30)
--SELECT DEPTNO FROM EMP WHERE JOB = 'MANAGER';

--서브쿼리의 서브쿼리 : BLAKE의 직책과 같은 사람들의 부서번호
SELECT JOB FROM EMP WHERE ENAME = 'BLAKE'; --'MANAGER'
-------------------------------------------------------

/*
BLAKE와 같은 부서에 있는 사람들의 이름과 고용일을 출력하는데, BLAKE는 제외
*/

--메인쿼리 : BLAKE와 같은 부서 사람들의 이름과 고용일을 출력
SELECT ENAME, HIREDATE, DEPTNO FROM EMP 
WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'BLAKE') --30
AND ENAME <> 'BLAKE'; --BLAKE는 제외
--SELECT ENAME, HIREDATE, DEPTNO FROM EMP 
--WHERE DEPTNO = 30 AND ENAME <> 'BLAKE';

--서브쿼리 : BLAKE 부서
SELECT DEPTNO FROM EMP WHERE ENAME = 'BLAKE'; --30
-------------------------------------------------------

/*
급여를 3000이상 받는 사원과 동일한 부서에서 일하는 사원들의 이름, 급여, 부서번호
*/

--메인쿼리 : 사원들의 이름, 급여, 부서번호
SELECT ENAME, SAL, DEPTNO FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE SAL >= 3000);
--SELECT ENAME, SAL, DEPTNO FROM EMP WHERE DEPTNO IN (10, 20);

--서브쿼리 : 급여를 3000이상 받는 사원과 동일한 부서
SELECT DEPTNO FROM EMP WHERE SAL >= 3000; --(10, 20)
-------------------------------------------------------

--ALL 연산자
SELECT * FROM EMP WHERE NVL(SAL, 0) < ALL(1000, 2000, 3000) ORDER BY SAL;
SELECT * FROM EMP WHERE NVL(SAL, 0) > ALL(1000, 2000, 3000) ORDER BY SAL;
-------------------------------------------------------

/*
부서번호가 30인 사원들의 연봉 중 가장 큰 값(2850)보다 많은 연봉을 받는 사람의 이름, 연봉
즉, ' > ALL'(대대)케이스는 최대값보다 크면 참이 됨
*/
SELECT ENAME, SAL FROM EMP 
WHERE SAL > ALL(SELECT SAL FROM EMP WHERE DEPTNO = 30);
--SAL > ALL(950, 1250, 1250, 1500, 1600, 2850); 
-- ㄴ SAL이 (950, 1250, 1250, 1500, 1600, 2850) 중 가장 큰 값보다 크다

SELECT SAL FROM EMP WHERE DEPTNO = 30 ORDER BY SAL;
--(950, 1250, 1250, 1500, 1600, 2850)
-------------------------------------------------------

/*
부서번호가 30인 사원들의 연봉 중 가장 작은 값(950)보다 적은 연봉을 받는 사람의 이름, 연봉
즉, ' < ALL'(소소)케이스는 최소값보다 작으면 참이 됨
*/
SELECT ENAME, SAL FROM EMP 
WHERE SAL < ALL(SELECT SAL FROM EMP WHERE DEPTNO = 30);
--SAL > ALL(950, 1250, 1250, 1500, 1600, 2850); 
-- ㄴ SAL이 (950, 1250, 1250, 1500, 1600, 2850) 중 가장 작은 값보다 작다

SELECT SAL FROM EMP WHERE DEPTNO = 30 ORDER BY SAL;
--(950, 1250, 1250, 1500, 1600, 2850)
-------------------------------------------------------

--부서별의 평균 연봉은 2916.66 이므로 연봉이 2916.66을 넘는 사원의 정보

--메인쿼리 : 최고 연봉을 넘는 사원의 정보
SELECT * FROM EMP 
WHERE SAL > ALL(SELECT AVG(SAL) FROM EMP GROUP BY DEPTNO);

--서브쿼리 : 부서별의 평균 연봉
SELECT AVG(SAL) FROM EMP GROUP BY DEPTNO;
-------------------------------------------------------

--ANY 연산자
SELECT * FROM EMP WHERE SAL < ANY(1000, 2000, 3000) ORDER BY SAL;
SELECT * FROM EMP WHERE SAL > ANY(1000, 2000, 3000) ORDER BY SAL;
-------------------------------------------------------

/*
부서번호가 30인 사원들의 연봉 중 가장 작은 값(950)보다 많은 연봉을 받는 사람의 이름, 연봉
즉, ' > ANY'(대소)케이스는 최소값보다 크면 참이 됨
*/
SELECT ENAME, SAL FROM EMP 
WHERE SAL > ANY(SELECT SAL FROM EMP WHERE DEPTNO = 30);
--SAL > ALL(950, 1250, 1250, 1500, 1600, 2850); 
-- ㄴ SAL이 (950, 1250, 1250, 1500, 1600, 2850) 중 가장 작은 값보다 크다

SELECT SAL FROM EMP WHERE DEPTNO = 30 ORDER BY SAL;
--(950, 1250, 1250, 1500, 1600, 2850)
-------------------------------------------------------

/*
부서번호가 30인 사원들의 연봉 중 가장 큰 값(2850)보다 적은 연봉을 받는 사람의 이름, 연봉
즉, ' < ANY'(소대)케이스는 최대값보다 작으면 참이 됨
*/
SELECT ENAME, SAL FROM EMP 
WHERE SAL < ANY(SELECT SAL FROM EMP WHERE DEPTNO = 30);
--SAL > ALL(950, 1250, 1250, 1500, 1600, 2850); 
-- ㄴ SAL이 (950, 1250, 1250, 1500, 1600, 2850) 중 가장 큰 값보다 작다

SELECT SAL FROM EMP WHERE DEPTNO = 30 ORDER BY SAL;
--(950, 1250, 1250, 1500, 1600, 2850)
-------------------------------------------------------

--사무원(CLERK)이 받는 최고 연봉 중 최고 연봉인 1300보다 적게 받으면서
--사무원(CLERK)이 아닌 사원의 정보

--메인쿼리 : 사무원(CLERK)이 받는 최고 연봉보다 적게 받으면서 사무원이 아닌 사원의 정보
SELECT * FROM EMP 
WHERE SAL < ANY(SELECT SAL FROM EMP WHERE JOB = 'CLERK') 
AND JOB != 'CLERK';

--서브쿼리 : 사무원(CLERK)이 받는 최고 연봉
SELECT SAL FROM EMP WHERE JOB = 'CLERK';
-------------------------------------------------------

UPDATE DEPT01
SET LOC = (SELECT LOC FROM DEPT WHERE DEPTNO = 40) WHERE DEPTNO = 10;
--SELECT LOC FROM DEPT01 WHERE DEPTNO = 40; --'BOSTON'
--SET LOC = 'BOSTON' WHERE DEPTNO = 10;
-------------------------------------------------------

--**서브쿼리를 이용한 두 개 이상의 컬럼에 대한 값 변경(단일행 다중컬럼)
UPDATE DEPT01
SET (DNAME, LOC) = (SELECT DNAME, LOC FROM DEPT WHERE DEPTNO = 30) 
WHERE DEPTNO = 10;
--SELECT DNAME, LOC FROM DEPT WHERE DEPTNO = 30; --('SALES', 'CHICAGO')
-------------------------------------------------------

--**서브쿼리를 이용한 두 개 이상의 컬럼에 대한 두 개 이상의 값 변경(다중행 다중컬럼)
UPDATE DEPT01
SET DNAME = (SELECT DNAME FROM DEPT WHERE DEPT.DEPTNO = EMP01.DEPTNO);
-------------------------------------------------------

--기존 테이블 데이터까지 복제 방법2
CREATE TABLE EMP01 AS SELECT E.* FROM EMP E;
ALTER TABLE EMP01 ADD DNAME VARCHAR2(14);

--기존 테이블 데이터까지 복제할 때 새 테이블에 컬럼 추가하면서 만드는
CREATE TABLE EMP02 AS SELECT E.*, 'ABC' AS DNAME FROM EMP E;
UPDATE EMP02 SET DNAME = NULL;
ALTER TABLE EMP02 MODIFY DNAME VARCHAR2(14);

--기존 테이블 데이터까지 복제할 때 새 테이블에 컬럼 추가하면서 만드는
CREATE TABLE EMP03 
AS SELECT E.*,(SELECT DNAME FROM DEPT WHERE DEPT.DEPTNO = E.DEPTNO) 
AS DNAME FROM EMP E;
-------------------------------------------------------

--서브쿼리를 이용한 데이터 삭제
DELETE FROM EMP01
WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME = 'SALES');
--DELETE FROM EMP01 WHERE DEPTNO = 30;
ROLLBACK;

SELECT DEPTNO FROM DEPT WHERE DNAME = 'SALES'; --30
-------------------------------------------------------

--EMP01테이블에서 데이터를 제거하는데 부서명이 RESEARCH, SALES 인 사원을 제거
DELETE FROM EMP01
WHERE DEPTNO IN (SELECT DEPTNO FROM DEPT WHERE DNAME IN ('RESEARCH', 'SALES'));
ROLLBACK;
-------------------------------------------------------

BLAKE와 같은 직책을 가진 사원 제거 BLAKE포함
DELETE FROM EMP01 WHERE JOB = (SELECT JOB FROM EMP01 WHERE ENAME = 'BLAKE');
SELECT JOB FROM EMP01 WHERE ENAME = 'BLAKE';
ROLLBACK;
-------------------------------------------------------

DROP TABLE dept PURGE;

--------------------------------------------------------
--  파일이 생성됨 - 목요일-1월-18-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table EMP01
--------------------------------------------------------

  CREATE TABLE "TEST"."EMP01" 
   (	"EMPNO" NUMBER(4,0), 
	"ENAME" VARCHAR2(10 BYTE), 
	"JOB" VARCHAR2(9 BYTE), 
	"MGR" NUMBER(4,0), 
	"HIREDATE" DATE, 
	"SAL" NUMBER(7,2), 
	"COMM" NUMBER(7,2), 
	"DEPTNO" NUMBER(2,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into TEST.EMP01
SET DEFINE OFF;
Insert into TEST.EMP01 (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7369,'SMITH','CLERK',7902,to_date('80/12/17','RR/MM/DD'),800,null,20);
Insert into TEST.EMP01 (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7499,'ALLEN','SALESMAN',7698,to_date('81/02/20','RR/MM/DD'),1600,300,30);
Insert into TEST.EMP01 (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7521,'WARD','SALESMAN',7698,to_date('81/02/22','RR/MM/DD'),1250,500,30);
Insert into TEST.EMP01 (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7566,'JONES','MANAGER',7839,to_date('81/04/02','RR/MM/DD'),2975,null,20);
Insert into TEST.EMP01 (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7654,'MARTIN','SALESMAN',7698,to_date('81/09/28','RR/MM/DD'),1250,1400,30);
Insert into TEST.EMP01 (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7698,'BLAKE','MANAGER',7839,to_date('81/05/01','RR/MM/DD'),2850,null,30);
Insert into TEST.EMP01 (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7782,'CLARK','MANAGER',7839,to_date('81/06/09','RR/MM/DD'),2450,null,10);
Insert into TEST.EMP01 (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7839,'KING','PRESIDENT',null,to_date('81/11/17','RR/MM/DD'),5000,null,10);
Insert into TEST.EMP01 (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7844,'TURNER','SALESMAN',7698,to_date('81/09/08','RR/MM/DD'),1500,0,30);
Insert into TEST.EMP01 (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7900,'JAMES','CLERK',7698,to_date('81/12/03','RR/MM/DD'),950,null,30);
Insert into TEST.EMP01 (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7902,'FORD','ANALYST',7566,to_date('81/12/03','RR/MM/DD'),3000,null,20);
Insert into TEST.EMP01 (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7934,'MILLER','CLERK',7782,to_date('82/01/23','RR/MM/DD'),1300,null,10);


create table dept as select * from scott.dept;
create table emp as select * from scott.emp;