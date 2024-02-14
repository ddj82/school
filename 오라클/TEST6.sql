-- 부서번호를 기준으로 같은 값을 가진 사원 테이블과 부서 테이블 결합

SELECT ENAME, DNAME, DEPT.DEPTNO
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO;
/*
해석순서
FROM절 -> WHERE절 -> GROUP BY절 -> HAVING절 -> SELECT절 -> ORDER BY절
이기 때문에 WHERE절의 별칭은 아직 없는거라 오류남, WHERE절에 별칭으로 사용불가
*/
SELECT E.ENAME, D.DNAME, 
E.DEPTNO AS EDNO,
D.DEPTNO AS DDNO
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO --EDNO = DDNO
ORDER BY DDNO;
-------------------------------------------------------------------------

/*
해석순서
FROM절 -> WHERE절 -> GROUP BY절 -> HAVING절 -> SELECT절 -> ORDER BY절
이기 때문에 GROUP BY절의 별칭은 아직 없는거라 오류남, GROUP BY절에 별칭으로 사용불가
*/
SELECT D.DNAME AS DDNM,
E.DEPTNO AS EDNO, 
D.DEPTNO AS DDNO
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
GROUP BY D.DNAME, E.DEPTNO, D.DEPTNO --DDNM, EDNO, DDNO
HAVING (D.DEPTNO = 10)
ORDER BY DDNO;
-------------------------------------------------------------------------

--DEPT테이블과 EMP테이블을 조인하여 데이터를 가져온뒤
--SMITH인 사람의 정보 중 사번, 이름, 부서번호, 부서명 출력

SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND ENAME = 'SMITH';

SELECT EMPNO, ENAME, DEPTNO, 
(SELECT DNAME FROM DEPT WHERE DEPT.DEPTNO = EMP.DEPTNO) AS DNAME
FROM EMP
WHERE ENAME = 'SMITH';
-------------------------------------------------------------------------

--EMP테이블과 DEPARTMENTS테이블을 조인하여 사번, 이름, 부서번호, 부서명을 출력

SELECT E.EMPNO, E.ENAME, E.DEPTNO, DM.DEPARTMENT_NAME
FROM EMP E, DEPARTMENTS DM
WHERE E.DEPTNO = DM.DEPARTMENT_ID;
-------------------------------------------------------------------------

ALTER TABLE DEPARTMENTS
ADD LOC VARCHAR2(13);
UPDATE DEPARTMENTS
SET LOC = (SELECT LOC FROM DEPT WHERE DEPT.DEPTNO = DEPARTMENTS.DEPARTMENT_ID);
COMMIT;

--EMP테이블과 DEPARTMENTS테이블을 조인하여 
--커미션을 받는 모든 사원의 이름, 부서명, 부서위치

SELECT ENAME, D.DEPARTMENT_NAME, D.LOC
FROM EMP E, DEPARTMENTS D
WHERE E.DEPTNO = D.DEPARTMENT_ID AND NVL(COMM, 0) != 0;
-------------------------------------------------------------------------

--이름에 A가 들어가는 모든 사원의 이름과 부서명 출력

SELECT ENAME, D.DEPARTMENT_NAME
FROM EMP E, DEPARTMENTS D
WHERE E.DEPTNO = D.DEPARTMENT_ID AND ENAME LIKE '%A%';
-------------------------------------------------------------------------

--사원이름 및 사원번호를 해당 관리자이름 및 관리자번호와 함께 표기
--열 머리글을 사원이름, 사원번호, 관리자 이름, 관리자 번호 로 표시
SELECT E.ENAME AS "사원이름", E.EMPNO AS "사원번호", 
E2.ENAME AS "관리자 이름", E2.EMPNO AS "관리자 번호"
FROM EMP E, EMP E2
WHERE E.MGR = E2.EMPNO;

SELECT E.ENAME AS "사원이름", E.EMPNO AS "사원번호", 
E2.ENAME AS "관리자 이름", E.MGR AS "관리자 번호"
FROM EMP E, EMP E2
WHERE E.MGR = E2.EMPNO(+);
-------------------------------------------------------------------------

SELECT ENAME, DNAME
FROM EMP
INNER JOIN DEPT
ON EMP.DEPTNO = DEPT.DEPTNO;
-- 둘이 같음
SELECT ENAME, DNAME
FROM EMP, DEPT 
WHERE EMP.DEPTNO = DEPT.DEPTNO;
-------------------------------------------------------------------------

SELECT ENAME, DNAME
FROM EMP E
INNER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE ENAME = 'SMITH';
-- 둘이 같음
SELECT ENAME, DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND ENAME = 'SMITH';
-------------------------------------------------------------------------

SELECT *
FROM EMP E, DEPARTMENTS D
WHERE E.DEPTNO(+) = D.DEPARTMENT_ID; 
--확장이 필요한건 왼쪽이라 (+)를 왼쪽에
--명칭은 RIGHT OUTER JOIN
--둘이 같음
SELECT *
FROM EMP E
RIGHT OUTER JOIN DEPARTMENTS D
ON E.DEPTNO(+) = D.DEPARTMENT_ID; 
-------------------------------------------------------------------------

INSERT INTO EMP VALUES (9999, 'TEST2', '', '', '', '', '', '');
INSERT INTO EMP VALUES (8888, 'TEST1', '', '', '', '', '', '');
COMMIT;
-------------------------------------------------------------------------

--EMP, DEPT 테이블을 조인하는데, 부서정보가 부여되지 않은 사원의
--사번, 이름, 부서번호, 부서명 출력

SELECT EMPNO, ENAME, D.DEPTNO, DNAME
FROM EMP E
LEFT OUTER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

SELECT EMPNO, ENAME, D.DEPTNO, DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO(+);
-------------------------------------------------------------------------

--조인, 10번 부서에서 근무하는 사원의 이름과 10번 부서의 부서명을 출력

SELECT ENAME, DNAME
FROM EMP E
JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE E.DEPTNO = 10;

SELECT ENAME, DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND E.DEPTNO = 10;

--서브쿼리
SELECT ENAME, 
(SELECT DNAME FROM DEPT WHERE DEPT.DEPTNO = EMP.DEPTNO) DNAME
FROM EMP WHERE DEPTNO = 10;
-------------------------------------------------------------------------

--조인에서 권장사항 : 최대 5개 이상의 테이블 정도만 조인해라

SELECT E.EMPNO, E.ENAME, D.DEPTNO, S.DEPARTMENT_NAME
FROM EMP E, DEPT D, DEPARTMENTS S
WHERE E.DEPTNO(+) = D.DEPTNO 
AND E.DEPTNO = S.DEPARTMENT_ID(+);

SELECT E.EMPNO, E.ENAME, D.DEPTNO, S.DEPARTMENT_NAME 
FROM EMP E
JOIN DEPT D ON E.DEPTNO = D.DEPTNO
JOIN DEPARTMENTS S ON E.DEPTNO = S.DEPARTMENT_ID;
-------------------------------------------------------------------------

ON E.DEPTNO = S.DEPARTMENT_ID;

SELECT E.EMPNO, E.ENAME, D.DEPTNO, S.DEPARTMENT_NAME 
FROM EMP E
FULL OUTER JOIN DEPT D 
ON E.DEPTNO = D.DEPTNO
FULL OUTER JOIN DEPARTMENTS S
ON E.DEPTNO = S.DEPARTMENT_ID;
-------------------------------------------------------------------------

--부서정보를 모두 가져오는데, 사원정보에 존재하는 부서정보만 가져오세요

SELECT * FROM DEPT B
WHERE EXISTS (SELECT * FROM EMP E WHERE E.DEPTNO = B.DEPTNO);
-------------------------------------------------------------------------

--사원정보를 모두 가져오는데, 부서정보에 존재하는 사원정보만 가져오세요

SELECT * FROM EMP E
WHERE EXISTS (SELECT * FROM DEPT B WHERE B.DEPTNO = E.DEPTNO);

--위를 IN연산자로 
SELECT * FROM EMP E
WHERE E.DEPTNO IN (SELECT DEPTNO FROM DEPT);
-------------------------------------------------------------------------

--부서정보를 모두 가져오는데, 사원정보에 존재하지 않는 부서정보만 가져오세요

SELECT * FROM DEPT B
WHERE NOT EXISTS (SELECT * FROM EMP E WHERE E.DEPTNO = B.DEPTNO);
-------------------------------------------------------------------------

--사원정보를 모두 가져오는데, 부서정보에 존재하지 않는 사원정보만 가져오세요

SELECT * FROM EMP E
WHERE NOT EXISTS (SELECT * FROM DEPT B WHERE B.DEPTNO = E.DEPTNO);

--위를 NOT IN연산자로 
SELECT * FROM EMP E
WHERE NVL(E.DEPTNO, 0) NOT IN (SELECT DEPTNO FROM DEPT);
-------------------------------------------------------------------------

SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D;

SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E
CROSS JOIN DEPT D;
-------------------------------------------------------------------------

--사원정보 : EMPLOYEES
--부서정보 : DEPARTMENTS
--인사부를 관리하는 상관부서에 근무하는 사원들의 이름, 부서번호, 부서명을 출력

SELECT E.EMP_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E
JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE D.DEPARTMENT_ID = (SELECT MANAGER_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME = '기획부');


SELECT E.EMP_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID 
AND D.DEPARTMENT_ID = (SELECT MANAGER_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME = '기획부');
-------------------------------------------------------------------------

