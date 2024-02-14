CREATE TABLE GOODS_KOR (
SEQ NUMBER PRIMARY KEY,
COUNTRY VARCHAR2(10),
GOODS VARCHAR2(80) NOT NULL
);

CREATE SEQUENCE KOR_SEQ NOCACHE;

INSERT INTO GOODS_KOR (SEQ, COUNTRY, GOODS) VALUES (KOR_SEQ.NEXTVAL, '한국', '원유제외 석유류');
INSERT INTO GOODS_KOR VALUES (KOR_SEQ.NEXTVAL, '한국', '자동차');
INSERT INTO GOODS_KOR VALUES (KOR_SEQ.NEXTVAL, '한국', '전자집적회로');
INSERT INTO GOODS_KOR VALUES (KOR_SEQ.NEXTVAL, '한국', '선박');
INSERT INTO GOODS_KOR VALUES (KOR_SEQ.NEXTVAL, '한국', 'LCD');
INSERT INTO GOODS_KOR VALUES (KOR_SEQ.NEXTVAL, '한국', '자동차부품');
INSERT INTO GOODS_KOR VALUES (KOR_SEQ.NEXTVAL, '한국', '휴대전화');
COMMIT;

SELECT * FROM GOODS_KOR;
-------------------------------------------------------------------------

CREATE TABLE GOODS_JAP (
SEQ NUMBER PRIMARY KEY,
COUNTRY VARCHAR2(10),
GOODS VARCHAR2(80) NOT NULL
);

CREATE SEQUENCE JAP_SEQ NOCACHE;

INSERT INTO GOODS_JAP VALUES (JAP_SEQ.NEXTVAL, '일본', '자동차');
INSERT INTO GOODS_JAP VALUES (JAP_SEQ.NEXTVAL, '일본', '자동차부품');
INSERT INTO GOODS_JAP VALUES (JAP_SEQ.NEXTVAL, '일본', '화물차');
INSERT INTO GOODS_JAP VALUES (JAP_SEQ.NEXTVAL, '일본', '건설기계');
INSERT INTO GOODS_JAP VALUES (JAP_SEQ.NEXTVAL, '일본', '다이오드');
INSERT INTO GOODS_JAP VALUES (JAP_SEQ.NEXTVAL, '일본', '트랜지스터');
INSERT INTO GOODS_JAP VALUES (JAP_SEQ.NEXTVAL, '일본', '반도체웨이퍼');
COMMIT;

SELECT * FROM GOODS_JAP;
-------------------------------------------------------------------------

SELECT GOODS FROM GOODS_KOR
UNION 
SELECT GOODS FROM GOODS_JAP;

SELECT COUNTRY, GOODS FROM GOODS_KOR
UNION 
SELECT COUNTRY,GOODS FROM GOODS_JAP;
-------------------------------------------------------------------------

UPDATE GOODS_JAP SET COUNTRY = '한국';

SELECT COUNTRY, GOODS FROM GOODS_KOR
UNION ALL
SELECT COUNTRY,GOODS FROM GOODS_JAP ORDER BY COUNTRY, GOODS;
-------------------------------------------------------------------------

SELECT EMPLOYEE_ID, JOB_ID FROM EMPLOYEES
UNION
SELECT EMPLOYEE_ID, JOB_ID FROM JOB_HISTORY ORDER BY EMPLOYEE_ID, JOB_ID;
-------------------------------------------------------------------------
ROLLBACK;
-------------------------------------------------------------------------

UPDATE GOODS_KOR SET GOODS = '자동차' WHERE SEQ = 3;
UPDATE GOODS_KOR SET GOODS = '자동차부품' WHERE SEQ = 4;

SELECT GOODS FROM GOODS_KOR
INTERSECT 
SELECT GOODS FROM GOODS_JAP;
-------------------------------------------------------------------------

UPDATE GOODS_JAP SET COUNTRY = '한국' WHERE SEQ = 1 OR SEQ = 2;

SELECT COUNTRY, GOODS FROM GOODS_KOR
INTERSECT 
SELECT COUNTRY, GOODS FROM GOODS_JAP;
-------------------------------------------------------------------------

SELECT GOODS FROM GOODS_JAP
MINUS  
SELECT GOODS FROM GOODS_KOR;
-------------------------------------------------------------------------

SET SERVEROUTPUT ON
SET SERVEROUTPUT OFF
-------------------------------------------------------------------------

BEGIN
DBMS_OUTPUT.PUT_LINE('HELLO ORACLE');
END;
/
-------------------------------------------------------------------------

DECLARE
VEMPNO NUMBER(4);
VENAME VARCHAR2(10);
BEGIN 
VEMPNO := 7788;
VENAME := 'SCOTT';
DBMS_OUTPUT.PUT_LINE('사번 / 이름');
DBMS_OUTPUT.PUT_LINE('---------');
DBMS_OUTPUT.PUT_LINE(VEMPNO || '/' || VENAME);
END;
/
-------------------------------------------------------------------------

DECLARE
var VARCHAR2(15);
BEGIN 
DBMS_OUTPUT.PUT_LINE('Hello Oracle~');
VAR := '안녕 PL/SQL';
DBMS_OUTPUT.PUT(var || ' ');
DBMS_OUTPUT.PUT_LINE('hello');
DBMS_OUTPUT.PUT_LINE('PL/SQL');
END;
/
-------------------------------------------------------------------------

--BEGIN
DECLARE
--변수선언
VAR VARCHAR2(15);
--코드작성
BEGIN
VAR := '안녕 PL/SQL';
--출력함수
DBMS_OUTPUT.PUT(VAR);
DBMS_OUTPUT.PUT_LINE('hello PL/SQL');
END;
/
-------------------------------------------------------------------------

BEGIN
DECLARE
--변수선언
VAR VARCHAR2(15);
BEGIN
--코드작성
VAR := '안녕 PL/SQL';
--출력함수
DBMS_OUTPUT.PUT(VAR);
DBMS_OUTPUT.PUT_LINE('hello PL/SQL');
END;
DBMS_OUTPUT.PUT_LINE('바깥 BEGIN문 종료');
END;
/
-------------------------------------------------------------------------

DECLARE
--한 줄 주석 : 변수 선언
va INTEGER := 2**2 * 3**2;
vb POSITIVE := 5;		-- 0미포함 양수, 1이상의 양수
vc SIGNTYPE;		-- -1, 0, 1, NULL만 가능
vd NATURALN := 0;	-- 0포함 양수, NULL불가
ce constant VARCHAR2(20) := '상수 테스트';
BEGIN
/*
여러줄 주석 : 실행부
DBMS_OUTPUT을 이용한 변수 값 출력
*/
--에러
--ce := '상수값 변경';
DBMS_OUTPUT.PUT_LINE('va = ' || va || ', vb = ' || vb || ', vc = ' || vc || ', vd = ' || vd);
DBMS_OUTPUT.PUT_LINE('va = ' || TO_CHAR(va));
DBMS_OUTPUT.PUT_LINE('상수 ce = ' || ce);
END;
/
-------------------------------------------------------------------------

DECLARE
--테이블의 컬럼의 데이터타입과 일치시켜 주는 것이 좋다. 에러 예방
--스칼라 변수 선언
VEMPNO NUMBER(4);
VENAME VARCHAR2(10);
VDEPTNO NUMBER(2);
VDNAME VARCHAR2(14);
BEGIN
--테이블 안의 데이터를 받아오는 경우 select절 안에 into를 이용한다.
--select절 컬럼의 데이터타입, 개수, 순서와
--INTO절의 변수의 데이터타입, 개수, 순서가 일치해야 한다.
--select절의 데이터는 INTO절을 통해 해당 변수를 초기화 해줘야 하기 때문에 
--반드시 한 줄의 데이터만 가져오는 쿼리문이여야 한다.

SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME
INTO VEMPNO, VENAME, VDEPTNO, VDNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND E.ENAME = 'SMITH';

DBMS_OUTPUT.PUT_LINE('사번 / 이름 / 부서번호 / 부서명');
DBMS_OUTPUT.PUT_LINE('---------------------------------');
DBMS_OUTPUT.PUT_LINE(VEMPNO || ' / ' || VENAME || ' / ' || VDEPTNO || ' / ' || VDNAME);
END;
/
-------------------------------------------------------------------------

DECLARE
VEMPNO EMP.EMPNO%TYPE;
VENAME EMP.ENAME%TYPE;
VDEPTNO DEPT.DEPTNO%TYPE;
VDNAME DEPT.DNAME%TYPE;
BEGIN
-- 여러 줄을 받는 쿼리문인 경우 에러, ROW값 1개만 받을 수 있다.
SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME
INTO VEMPNO, VENAME, VDEPTNO, VDNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND E.ENAME = 'SMITH';

DBMS_OUTPUT.PUT_LINE('사번 / 이름 / 부서번호 / 부서명');
DBMS_OUTPUT.PUT_LINE('---------------------------------');
DBMS_OUTPUT.PUT_LINE(VEMPNO || ' / ' || VENAME || ' / ' || VDEPTNO || ' / ' || VDNAME);
END;
/
-------------------------------------------------------------------------

DECLARE
VEMP EMP%ROWTYPE;
BEGIN
-- 여러 줄을 받는 쿼리문인 경우 에러, ROW값 1개만 받을 수 있다.
SELECT *
INTO VEMP
FROM EMP
WHERE ENAME = 'SMITH';

DBMS_OUTPUT.PUT_LINE('사번 / 이름 / 부서번호');
DBMS_OUTPUT.PUT_LINE('-----------------------');
DBMS_OUTPUT.PUT_LINE(VEMP.EMPNO || ' / ' || VEMP.ENAME || ' / ' || VEMP.DEPTNO);
END;
/
-------------------------------------------------------------------------

DECLARE
VEMP EMP%ROWTYPE;
VDEPT DEPT%ROWTYPE;
BEGIN
-- 여러 줄을 받는 쿼리문인 경우 에러, ROW값 1개만 받을 수 있다.
SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME
INTO VEMP.EMPNO, VEMP.ENAME, VDEPT.DEPTNO, VDEPT.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND E.ENAME = 'SMITH';

DBMS_OUTPUT.PUT_LINE('사번 / 이름 / 부서번호 / 부서명');
DBMS_OUTPUT.PUT_LINE('---------------------------------');
DBMS_OUTPUT.PUT_LINE(VEMP.EMPNO || ' / ' || VEMP.ENAME || ' / ' || VDEPT.DEPTNO || ' / ' || VDEPT.DNAME);
END;
/
-------------------------------------------------------------------------

DECLARE
VNUM1 NUMBER := 1;
VNUM2 NUMBER := 2;
BEGIN
IF VNUM1 >= VNUM2 THEN
DBMS_OUTPUT.PUT_LINE(VNUM1 || '이(가) ' || VNUM2 || '보다 큰 수 입니다.');
ELSE
DBMS_OUTPUT.PUT_LINE(VNUM2 || '이(가) ' || VNUM1 || '보다 큰 수 입니다.');
END IF;
END;
/
-------------------------------------------------------------------------


DECLARE
V_SAL NUMBER := 0;
V_DEPTNO NUMBER := 0;

BEGIN
V_DEPTNO := ROUND(DBMS_RANDOM.VALUE(10, 30), -1);
SELECT MAX(SAL) AS SAL INTO V_SAL FROM EMP
WHERE DEPTNO = V_DEPTNO;
DBMS_OUTPUT.PUT_LINE('연봉' || V_SAL);

IF V_SAL BETWEEN 1 AND 1000 THEN
DBMS_OUTPUT.PUT_LINE('낮음');
ELSIF V_SAL BETWEEN 1001 AND 2000 THEN
DBMS_OUTPUT.PUT_LINE('중간');
ELSIF V_SAL BETWEEN 2001 AND 3000 THEN
DBMS_OUTPUT.PUT_LINE('높음');
ELSE 
DBMS_OUTPUT.PUT_LINE('최상위');
END IF;

END;
/
-------------------------------------------------------------------------

--ORACLE에서의 BOOLEAN자료형
--값 : TRUE, FALSE, NULL 값을 가질 수 있다. (대소문자 안가림)
--다른 자료형은 DBMS_OUTPUT의 출력문을 통해 출력 가능하지만 
--BOOLEAN자료형 값은 DBMS_OUTPUT의 출력문으로 바로 값을 출력할 수 없다.(오류)

DECLARE
V_PI INTEGER;
V_VC VARCHAR2(10);
V_ORDER BOOLEAN;
BEGIN
DBMS_OUTPUT.PUT_LINE('V_PI = ' || V_PI);
DBMS_OUTPUT.PUT_LINE('V_VC = ' || V_VC);
V_ORDER := TRUE; 
DBMS_OUTPUT.PUT_LINE(
'BAL = ' || 
CASE 
WHEN V_ORDER = TRUE THEN 'Ture'
WHEN V_ORDER = FALSE THEN 'False'
ELSE 'NULL'
END
);
END;
/
-------------------------------------------------------------------------

DECLARE
V_DNAME DEPT.DNAME%TYPE := 0;
V_DEPTNO DEPT.DEPTNO%TYPE := 0;

BEGIN
V_DEPTNO := ROUND(DBMS_RANDOM.VALUE(10, 40), -1);
SELECT DEPTNO, DNAME INTO V_DEPTNO, V_DNAME FROM DEPT
WHERE DEPTNO = V_DEPTNO;

DBMS_OUTPUT.PUT_LINE('부서번호' || V_DEPTNO);

CASE V_DEPTNO WHEN 10 THEN
DBMS_OUTPUT.PUT_LINE(V_DNAME);
WHEN 20 THEN
DBMS_OUTPUT.PUT_LINE(V_DNAME);
WHEN 30 THEN
DBMS_OUTPUT.PUT_LINE(V_DNAME);
ELSE 
DBMS_OUTPUT.PUT_LINE(V_DNAME);
END CASE;

END;
/
-------------------------------------------------------------------------

DECLARE
V_DEPT DEPT%ROWTYPE;

BEGIN
V_DEPT.DEPTNO := ROUND(DBMS_RANDOM.VALUE(10, 40), -1);
SELECT * INTO V_DEPT FROM DEPT
WHERE DEPTNO = V_DEPT.DEPTNO;

DBMS_OUTPUT.PUT_LINE('부서번호' || V_DEPT.DEPTNO);

CASE V_DEPT.DEPTNO WHEN 10 THEN
DBMS_OUTPUT.PUT_LINE(V_DEPT.DNAME);
WHEN 20 THEN
DBMS_OUTPUT.PUT_LINE(V_DEPT.DNAME);
WHEN 30 THEN
DBMS_OUTPUT.PUT_LINE(V_DEPT.DNAME);
ELSE 
DBMS_OUTPUT.PUT_LINE(V_DEPT.DNAME);
END CASE;

END;
/
-------------------------------------------------------------------------

DECLARE
--%ROWTYPE 속성으로 로우를 저장할 수 있는 레퍼런스 변수 선언
VEMP EMP%ROWTYPE;
ANNSAL NUMBER(7, 2);

BEGIN
--여러 줄을 받는 쿼리문인 경우 에러, ROW값 1개만 받을 수 있다.
SELECT * INTO VEMP FROM EMP
WHERE ENAME = 'SMITH';

--변수를 테이블의 %ROWTYPE으로 하였기에
--각 컬럼명으로 접근시에는 변수명.컬럼명으로 접근할 수 있다.
IF VEMP.COMM IS NULL THEN
VEMP.COMM := 0;
END IF;

--소수점 둘째 자리수에서 반올림 됨.
ANNSAL := VEMP.SAL * 12 + 1.156 + VEMP.COMM;

DBMS_OUTPUT.PUT_LINE('사번 / 이름 / 부서번호');
DBMS_OUTPUT.PUT_LINE('-----------------------');
--자바의 객체 개념과 유사
DBMS_OUTPUT.PUT_LINE(VEMP.EMPNO || ' / ' || VEMP.ENAME || ' / ' || ANNSAL);
END;
/
-------------------------------------------------------------------------


