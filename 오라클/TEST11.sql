DECLARE
VSQL VARCHAR2(1000);
BEGIN
VSQL := 'CREATE TABLE TEST (A VARCHAR2(10), B NUMBER(5, 1))';
EXECUTE IMMEDIATE VSQL;
END;
/
-------------------------------------------------------------------------

DECLARE
VSQL VARCHAR2(1000);
VCNT NUMBER;
BEGIN
VSQL := 'SELECT COUNT(*) FROM ALL_TABLES WHERE TABLE_NAME = ''TEST''';
IF VCNT <= 0 THEN
DBMS_OUTPUT.PUT_LINE('TEST테이블을 생성합니다.');
VSQL := 'CREATE TABLE TEST (A NUMBER(10), B VARCHAR2(10))';
EXECUTE IMMEDIATE VSQL;
END IF;
VSQL := 'SELECT COUNT(*) FROM ALL_TABLES WHERE TABLE_NAME = ''MYINFO''';
EXECUTE IMMEDIATE VSQL INTO VCNT;
IF VCNT > 0 THEN
VSQL := 'DROP TABLE MYINFO PURGE';
EXECUTE IMMEDIATE VSQL;
END IF;
END;
/
-------------------------------------------------------------------------

--함수생성
CREATE OR REPLACE FUNCTION TEST_FUNC(P_N1 EMP.ENAME%TYPE)
RETURN DEPT.DNAME%TYPE
IS
V_DNAME DEPT.DNAME%TYPE;
V_DEPTNO EMP.DEPTNO%TYPE;
BEGIN
SELECT DEPTNO INTO V_DEPTNO FROM EMP WHERE ENAME = P_N1;
SELECT DNAME INTO V_DNAME FROM DEPT WHERE DEPTNO = V_DEPTNO;
RETURN V_DNAME;
END;
/
-------------------------------------------------------------------------

--함수호출
SELECT TEST_FUNC('SMITH') FROM DUAL;
-------------------------------------------------------------------------

--함수호출
DECLARE
V_DNAME DEPT.DNAME%TYPE;
BEGIN
SELECT TEST_FUNC('SMITH') INTO V_DNAME FROM DUAL;
DBMS_OUTPUT.PUT_LINE(V_DNAME);
END;
/
-------------------------------------------------------------------------

--함수호출
BEGIN
DBMS_OUTPUT.PUT_LINE(TEST_FUNC('SMITH'));
END;
/
-------------------------------------------------------------------------

--함수생성
CREATE OR REPLACE FUNCTION TOPNAME_FUNC
RETURN EMP.ENAME%TYPE
IS
V_ENAME EMP.ENAME%TYPE;
BEGIN
SELECT ENAME INTO V_ENAME FROM EMP WHERE SAL = (SELECT MAX(SAL) FROM EMP);
RETURN V_ENAME;
END;
/
-------------------------------------------------------------------------

--함수호출
SELECT TOPNAME_FUNC FROM DUAL;
--SELECT TOPNAME_FUNC() FROM DUAL;
-------------------------------------------------------------------------

--함수호출
DECLARE
V_ENAME EMP.ENAME%TYPE;
BEGIN
SELECT TOPNAME_FUNC() INTO V_ENAME FROM DUAL;
--SELECT TOPNAME_FUNC INTO V_ENAME FROM DUAL;
DBMS_OUTPUT.PUT_LINE(V_ENAME);
END;
/
-------------------------------------------------------------------------

--함수호출
BEGIN
DBMS_OUTPUT.PUT_LINE(TOPNAME_FUNC());
--DBMS_OUTPUT.PUT_LINE(TOPNAME_FUNC);
END;
/
-------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION MY_ADD(N1 NUMBER, N2 NUMBER)
RETURN NUMBER
IS
V_RETURN NUMBER;
BEGIN
V_RETURN := N1 + N2;
RETURN V_RETURN;
END;
/
-------------------------------------------------------------------------

SELECT MY_ADD(5, 2) FROM DUAL;
-------------------------------------------------------------------------

DECLARE
V_RETURN NUMBER;
BEGIN
SELECT MY_ADD(5, 2) INTO V_RETURN FROM DUAL;
DBMS_OUTPUT.PUT_LINE(V_RETURN);
END;
/
-------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION FUNC_ABC(N1 NUMBER, N2 NUMBER, S1 VARCHAR2)
RETURN NUMBER
IS
V_RETURN NUMBER;
BEGIN
IF S1 = '+' THEN
V_RETURN := N1 + N2;
RETURN V_RETURN;

ELSIF S1 = '-' THEN
V_RETURN := N1 - N2;
RETURN V_RETURN;

ELSIF S1 = '*' THEN
V_RETURN := N1 * N2;
RETURN V_RETURN;

ELSIF S1 = '/' THEN
V_RETURN := N1 / N2;
RETURN V_RETURN;

ELSIF S1 = '%' THEN
V_RETURN := MOD(N1, N2);
RETURN V_RETURN;

ELSE 
DBMS_OUTPUT.PUT_LINE('연산자가 잘못됐습니다.');
V_RETURN := NULL;
RETURN V_RETURN;

END IF;
END;
/
-------------------------------------------------------------------------

SELECT FUNC_ABC(5, 2, '+') FROM DUAL;
SELECT FUNC_ABC(5, 2, '-') FROM DUAL;
SELECT FUNC_ABC(5, 2, '*') FROM DUAL;
SELECT FUNC_ABC(5, 2, '/') FROM DUAL;
SELECT FUNC_ABC(5, 2, '%') FROM DUAL;
SELECT FUNC_ABC(5, 2, '') FROM DUAL;

SELECT FUNC_ABC(5, 2, '+') 덧셈, 
FUNC_ABC(5, 2, '-') 뺄셈, 
FUNC_ABC(5, 2, '*') 곱셈, 
FUNC_ABC(5, 2, '/') 몫, 
FUNC_ABC(5, 2, '%') 나머지, 
FUNC_ABC(5, 2, '') 오류
FROM DUAL;

BEGIN
DBMS_OUTPUT.PUT_LINE(FUNC_ABC(5, 2, ''));
END;
/
-------------------------------------------------------------------------

DECLARE 
V_RETURN NUMBER;
BEGIN
SELECT FUNC_ABC(5, 2, '') INTO V_RETURN FROM DUAL;
DBMS_OUTPUT.PUT_LINE(V_RETURN);
END;
/
-------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION FN_GET_COUNTRY_NM(P_COUNTRY_ID NUMBER)
RETURN VARCHAR2
IS
VS_COUNTRY_NM COUNTRIES.COUNTRY_NAME%TYPE; --VARCHAR2(40)
VN_CNT NUMBER := 0;
BEGIN
SELECT COUNT(*) INTO VN_CNT FROM COUNTRIES
WHERE COUNTRY_ID = P_COUNTRY_ID;
IF VN_CNT <= 0 THEN
VS_COUNTRY_NM := '해당국가 없음';
ELSE
SELECT COUNTRY_NAME INTO VS_COUNTRY_NM FROM COUNTRIES
WHERE COUNTRY_ID = P_COUNTRY_ID;
END IF;
RETURN VS_COUNTRY_NM;
END;
/
-------------------------------------------------------------------------

SELECT FN_GET_COUNTRY_NM(52777) CN1, FN_GET_COUNTRY_NM(10000) CN2 FROM DUAL;
-------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION TOPNAME_FNC
RETURN EMP.ENAME%TYPE
IS
V_ENAME EMP.ENAME%TYPE;
BEGIN
SELECT ENAME INTO V_ENAME FROM EMP
WHERE SAL = (SELECT MAX(SAL) FROM EMP);
RETURN V_ENAME;
END;
/
-------------------------------------------------------------------------

SELECT TOPNAME_FNC FROM DUAL;

DECLARE
VR_ENAME EMP.ENAME%TYPE;
BEGIN
VR_ENAME := TOPNAME_FNC;
DBMS_OUTPUT.PUT_LINE(VR_ENAME);
END;
/
-------------------------------------------------------------------------

BEGIN
DBMS_OUTPUT.PUT_LINE(TOPNAME_FNC);
END;
/
-------------------------------------------------------------------------


CREATE OR REPLACE FUNCTION TOPNAME_FNC
RETURN DEPT%ROWTYPE
IS
V_DEPT DEPT%ROWTYPE;
BEGIN
SELECT * INTO V_DEPT FROM DEPT WHERE DEPTNO = 10;
RETURN V_DEPT;
END;
/
-------------------------------------------------------------------------

DECLARE
D_DEPT DEPT%ROWTYPE;
BEGIN
--ROWTYPE은 SELECT문으로 출력 불가능, 해당 타입의 변수로 직접 값을 대입 받아야한다.
D_DEPT := TOPNAME_FNC;
DBMS_OUTPUT.PUT_LINE(D_DEPT.DEPTNO || ', ' || D_DEPT.DNAME || ', ' || D_DEPT.LOC);
END;
/
-------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION GET_DEPT_FN(P_DEPT_NO NUMBER)
RETURN DEPT_TABLE
IS
V_RSLT DEPT_TABLE;
BEGIN
--BULK COLLECT INTO SELECT 절에 있는 컬럼을 
--COLLECT(ROWTYPE의 배열형태 테이블유형의 자료형) 유형으로 담아주는 기능을 한다.
SELECT DEPT_TYPE(DEPTNO, DNAME, LOC) BULK COLLECT INTO V_RSLT
FROM DEPT WHERE DEPTNO >= P_DEPT_NO;
RETURN V_RSLT;
END GET_DEPT_FN;
/
-------------------------------------------------------------------------

DECLARE
VDEPT DEPT_TYPE;
CURSOR C2 IS SELECT * FROM TABLE(GET_DEPT_FN(20));
BEGIN
FOR VDEPT IN C2 LOOP
--EXIT WHEN C2%NOTFOUND;
DBMS_OUTPUT.PUT_LINE(VDEPT.DEPTNO || ', ' || VDEPT.DNAME || ', ' || VDEPT.LOC);
END LOOP;
END;
/
-------------------------------------------------------------------------

CREATE OR REPLACE TYPE DEPT_TYPE AS OBJECT (
DEPTNO NUMBER(2),
DNAME VARCHAR2(14),
LOC VARCHAR2(13)
);
/
-------------------------------------------------------------------------

CREATE OR REPLACE TYPE DEPT_TABLE AS TABLE OF DEPT_TYPE;
-------------------------------------------------------------------------

CREATE OR REPLACE TYPE ED_TYPE AS OBJECT (
DEPTNO NUMBER(2),
DNAME VARCHAR2(14),
LOC VARCHAR2(13),
EMPNO NUMBER(4),
ENAME VARCHAR2(10)
);
/
-------------------------------------------------------------------------

CREATE OR REPLACE TYPE ED_TABLE AS TABLE OF ED_TYPE;
-------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION GET_ED_FN (P_DEPT_NO NUMBER)
RETURN ED_TABLE
IS
V_RSLT ED_TABLE;
BEGIN
--BULK COLLECT INTO SELECT 절에 있는 컬럼을 
--COLLECT(ROWTYPE의 배열 형태 태이블유형의 자료형)유형으로 담아주는 기능
SELECT ED_TYPE (A.DEPTNO, A.DNAME, A.LOC, B.EMPNO, B.ENAME)
BULK COLLECT INTO V_RSLT
FROM DEPT A, EMP B
WHERE A.DEPTNO = B.DEPTNO AND A.DEPTNO = P_DEPT_NO;
RETURN V_RSLT;
END GET_ED_FN;
/
-------------------------------------------------------------------------

SELECT * FROM TABLE(GET_ED_FN(10));

DECLARE
CURSOR C_ED IS SELECT * FROM TABLE(GET_ED_FN(10));
BEGIN
FOR C_RCD IN C_ED LOOP
DBMS_OUTPUT.PUT_LINE(C_RCD.DEPTNO || ', ' || C_RCD.DNAME || ', ' || C_RCD.LOC || ', ' || C_RCD.EMPNO || ', ' || C_RCD.ENAME);
END LOOP;
END;
/
-------------------------------------------------------------------------

--프로시저 생성
CREATE OR REPLACE PROCEDURE TEST IS
BEGIN
DBMS_OUTPUT.PUT_LINE('Hello Function');
END;
/
-------------------------------------------------------------------------

--프로시저 호출
EXEC TEST;
-------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE RES(SNAME IN VARCHAR2) IS
BEGIN
DBMS_OUTPUT.PUT_LINE(SNAME || '님 합격!!');
END;
/
-------------------------------------------------------------------------

EXEC RES('김동준');
-------------------------------------------------------------------------

BEGIN
RES('김동준');
END;
/
-------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE MY_NEW_JOB_PROC
(
P_JOB_ID IN JOBS.JOB_ID%TYPE,
P_JOB_TITLE JOBS.JOB_TITLE%TYPE,
P_MIN_SAL IN JOBS.MIN_SALARY%TYPE,
P_MAX_SAL JOBS.MAX_SALARY%TYPE
) IS
BEGIN
INSERT INTO JOBS (JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY, CREATE_DATE, UPDATE_DATE) 
VALUES (P_JOB_ID, P_JOB_TITLE, P_MIN_SAL, P_MAX_SAL, SYSDATE, SYSDATE);
COMMIT;
END;
/
-------------------------------------------------------------------------

EXECUTE MY_NEW_JOB_PROC('', '', , );
-------------------------------------------------------------------------

DECLARE
VJOB_ID JOBS.JOB_ID%TYPE;
VJOB_TITLE JOBS.JOB_TITLE%TYPE;
VMIN_SAL JOBS.MIN_SALARY%TYPE;
VMAX_SAL JOBS.MAX_SALARY%TYPE;
BEGIN
SELECT E.DEPTNO, D.DNAME, 1500, 5000
INTO VJOB_ID, VJOB_TITLE, VMIN_SAL, VMAX_SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND E.ENAME = 'SMITH';
MY_NEW_JOB_PROC(VJOB_ID, VJOB_TITLE, VMIN_SAL, VMAX_SAL);
END;
/
-------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE MY_NEW_JOB_PROC
(
P_JOB_ID JOBS.JOB_ID%TYPE,
P_JOB_TITLE JOBS.JOB_TITLE%TYPE,
P_MIN_SAL JOBS.MIN_SALARY%TYPE,
P_MAX_SAL JOBS.MAX_SALARY%TYPE
) 
IS
VN_CNT NUMBER :=0;

BEGIN
SELECT COUNT(*) INTO VN_CNT FROM JOBS
WHERE JOB_ID = P_JOB_ID;

IF VN_CNT > 0 THEN
UPDATE JOBS SET
JOB_ID = P_JOB_ID, 
JOB_TITLE = P_JOB_TITLE, 
MIN_SALARY = P_MIN_SAL, 
MAX_SALARY = P_MAX_SAL
WHERE JOB_ID = P_JOB_ID;
DBMS_OUTPUT.PUT_LINE('UPDATE문 실행완료');

ELSE
INSERT INTO JOBS
(JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY, CREATE_DATE, UPDATE_DATE) 
VALUES (P_JOB_ID, P_JOB_TITLE, P_MIN_SAL, P_MAX_SAL, SYSDATE, SYSDATE);
DBMS_OUTPUT.PUT_LINE('INSERT문 실행완료');

END IF;
COMMIT;
DBMS_OUTPUT.PUT_LINE('갱신이 완료되었습니다.');
END;
/
-------------------------------------------------------------------------

EXEC MY_NEW_JOB_PROC('SM_JOB1', 'SAMPLE JOB1', 2000, 6000);

--매개변수 개수가 많아서 인자값이 어떤 변수에 바인딩되는지 잘 모르겠을 때,
--프로시저의 매개변수명과 동일하게 해주어야 하며, 순서는 바뀌어도 상관없다.
EXEC MY_NEW_JOB_PROC(P_JOB_TITLE => 'SAMPLE JOB1', P_JOB_ID => 'SM_JOB1', P_MAX_SAL => 9000, P_MIN_SAL => 500);
-------------------------------------------------------------------------

--IN OUT 명시 없으면 디폴트는 IN
--매개변수에 초기값이 대입되어 있을 경우, 호출문에 값이 없으면 초기값으로 대입됨.
--,(콤마)를 쓰지 않아도 되는 값까지
CREATE OR REPLACE PROCEDURE MY_NEW_JOB_PROC
(
P_JOB_ID JOBS.JOB_ID%TYPE,
P_JOB_TITLE JOBS.JOB_TITLE%TYPE,
P_MIN_SAL JOBS.MIN_SALARY%TYPE := 10,
P_MAX_SAL JOBS.MAX_SALARY%TYPE := 100
) 
IS
VN_CNT NUMBER :=0;

BEGIN
SELECT COUNT(*) INTO VN_CNT FROM JOBS
WHERE JOB_ID = P_JOB_ID;

IF VN_CNT > 0 THEN
UPDATE JOBS SET
JOB_ID = P_JOB_ID, 
JOB_TITLE = P_JOB_TITLE, 
MIN_SALARY = P_MIN_SAL, 
MAX_SALARY = P_MAX_SAL
WHERE JOB_ID = P_JOB_ID;
DBMS_OUTPUT.PUT_LINE('UPDATE문 실행완료');

ELSE
INSERT INTO JOBS
(JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY, CREATE_DATE, UPDATE_DATE) 
VALUES (P_JOB_ID, P_JOB_TITLE, P_MIN_SAL, P_MAX_SAL, SYSDATE, SYSDATE);
DBMS_OUTPUT.PUT_LINE('INSERT문 실행완료');

END IF;
COMMIT;
DBMS_OUTPUT.PUT_LINE('갱신이 완료되었습니다.');
END;
/
-------------------------------------------------------------------------

EXEC MY_NEW_JOB_PROC('SM_JOB5', 'SAMPLE JOB1');

--매개변수 개수가 많아서 인자값이 어떤 변수에 바인딩되는지 잘 모르겠을 때,
--프로시저의 매개변수명과 동일하게 해주어야 하며, 순서는 바뀌어도 상관없다.
EXEC MY_NEW_JOB_PROC (P_JOB_TITLE => 'SAMPLE JOB1', P_JOB_ID => 'SM_JOB1', P_MAX_SAL => 9000)
-------------------------------------------------------------------------

--OUT 매개변수
--프로시저 실행 시점에 OUT 매개변수를 변수 형태를 전달하고, 프로시저 실행부에서 이 매개변수에 특정값을 할당한다.
--실행이 끝나면 전달한 변수를 참조해 값을 가져올 수 있다. 
CREATE OR REPLACE PROCEDURE MY_NEW_JOB_PROC
(
P_JOB_ID JOBS.JOB_ID%TYPE,
P_JOB_TITLE JOBS.JOB_TITLE%TYPE,
P_MIN_SAL JOBS.MIN_SALARY%TYPE := 10,
P_MAX_SAL JOBS.MAX_SALARY%TYPE := 100,
P_UPDATE_DATE OUT JOBS.UPDATE_DATE%TYPE
) 
IS
VN_CNT NUMBER :=0;
VN_CUR_DATE JOBS.UPDATE_DATE%TYPE := SYSDATE;

BEGIN
DBMS_OUTPUT.PUT_LINE('P_UPDATE_DATE : ' || P_UPDATE_DATE);
SELECT COUNT(*) INTO VN_CNT FROM JOBS
WHERE JOB_ID = P_JOB_ID;

IF VN_CNT > 0 THEN
UPDATE JOBS SET 
JOB_TITLE = P_JOB_TITLE, 
MIN_SALARY = P_MIN_SAL, 
MAX_SALARY = P_MAX_SAL,
UPDATE_DATE = VN_CUR_DATE
WHERE JOB_ID = P_JOB_ID;
DBMS_OUTPUT.PUT_LINE('UPDATE문 실행완료');

ELSE
INSERT INTO JOBS
(JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY, CREATE_DATE, UPDATE_DATE) 
VALUES (P_JOB_ID, P_JOB_TITLE, P_MIN_SAL, P_MAX_SAL, SYSDATE, SYSDATE);
DBMS_OUTPUT.PUT_LINE('INSERT문 실행완료');

END IF;
P_UPDATE_DATE := VN_CUR_DATE;
COMMIT;
DBMS_OUTPUT.PUT_LINE('갱신이 완료되었습니다. : ' || P_UPDATE_DATE);
END;
/
-------------------------------------------------------------------------

DECLARE
VD_CUR_DATE JOBS.UPDATE_DATE%TYPE;
BEGIN
DBMS_OUTPUT.PUT_LINE('VD_CUR_DATE : ' || VD_CUR_DATE);
MY_NEW_JOB_PROC('SM_JOB5', 'SAMPLE JOB1', 2000, 6000, VD_CUR_DATE);
DBMS_OUTPUT.PUT_LINE('VD_CUR_DATE : ' || VD_CUR_DATE);
END;
/
-------------------------------------------------------------------------