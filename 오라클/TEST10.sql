SET SERVEROUTPUT ON

DECLARE
VEMP EMP%ROWTYPE;
ANNSAL NUMBER(7, 2);
BEGIN
--여러 줄 받는 쿼리 시 에러
SELECT * INTO VEMP FROM EMP
WHERE ENAME = 'SMITH';

IF (VEMP.COMM IS NULL) THEN
ANNSAL := VEMP.SAL * 12;
ELSE
ANNSAL := VEMP.SAL * 12 + VEMP.COMM;
END IF;

DBMS_OUTPUT.PUT_LINE('사번 / 이름 / 연봉');
DBMS_OUTPUT.PUT_LINE('-------------------');
DBMS_OUTPUT.PUT_LINE(VEMP.EMPNO || ' / ' || VEMP.ENAME || ' / ' || ANNSAL);
END;
/
-------------------------------------------------------------------------

DECLARE
V_EMPNO NUMBER(4) := 8888;
V_DEPTNO NUMBER(2);
V_ENAME VARCHAR2(10) := 'XMAN';
V_JOB VARCHAR2(9);
V_SAL NUMBER(7, 2);
BEGIN
V_DEPTNO := 20;

IF V_JOB IS NULL THEN
V_JOB := '신입';
END IF;

IF V_JOB = '신입' THEN
V_SAL := 2000;
ELSIF V_JOB IN ('MANAGER', 'ANALYST') THEN
V_SAL := 3500;
ELSE 
V_SAL := 2500;
END IF;

INSERT INTO EMP(DEPTNO, EMPNO, ENAME, SAL, JOB)
VALUES (V_DEPTNO, V_EMPNO, V_ENAME, V_SAL, V_JOB);
--COMMIT; --자동COMMIT이 아니므로 ROLLBACK시 되돌리기 가능
END;
/
-------------------------------------------------------------------------

DECLARE
N NUMBER := 1;
BEGIN
LOOP
DBMS_OUTPUT.PUT_LINE(N);
N := N + 1;
IF N > 5 THEN
EXIT; --BREAK의 기능을 함. END LOOP로 감.
/*
EXIT -> IF문과 같이 사용가능. 또는 EXIT WHEN 조건; 으로 직접 탈출문 기술 가능
*/
END IF;
END LOOP;
END;
/
-------------------------------------------------------------------------

DECLARE
K INT := 1;
BEGIN
LOOP
DBMS_OUTPUT.PUT_LINE(K);
K := K + 1;
EXIT WHEN K > 10;
END LOOP;
END;
/
-------------------------------------------------------------------------

DECLARE
CNT NUMBER := 1;
STAR VARCHAR2(10) := NULL;
BEGIN
LOOP
STAR := STAR || '*';
CNT := CNT + 1;
DBMS_OUTPUT.PUT_LINE(STAR);
IF CNT > 5 THEN
EXIT;
END IF;
END LOOP;
END;
/
-------------------------------------------------------------------------

DECLARE
N NUMBER := 1;
TOT NUMBER := 0;
BEGIN
LOOP
TOT := TOT + N;
N := N + 1;
IF N > 10 THEN
EXIT;
END IF;
END LOOP;
DBMS_OUTPUT.PUT_LINE(TOT); --55
DBMS_OUTPUT.PUT_LINE(N); --11
END;
/
-------------------------------------------------------------------------

BEGIN
FOR N IN 1..5 LOOP
--N := N + 1; --에러
DBMS_OUTPUT.PUT_LINE(N);
END LOOP;
END;
/
-------------------------------------------------------------------------

BEGIN
FOR N IN REVERSE 1..5 LOOP
DBMS_OUTPUT.PUT_LINE(N);
END LOOP;
END;
/
-------------------------------------------------------------------------

DECLARE
VNUM NUMBER := 3;
BEGIN
FOR I IN 1..9 LOOP
CONTINUE WHEN MOD(I, 2) = 0; --CONTINUE : LOOP 머리로 돌아가라
DBMS_OUTPUT.PUT_LINE(I); --홀수만 출력
END LOOP;
END;
/
-------------------------------------------------------------------------

DECLARE
TOT NUMBER := 0;
BEGIN
FOR N IN 1..10 LOOP
TOT := TOT + N;
END LOOP;
DBMS_OUTPUT.PUT_LINE(TOT);
END;
/
-------------------------------------------------------------------------

DECLARE
VDEPT DEPT%ROWTYPE;
BEGIN
DBMS_OUTPUT.PUT_LINE('부서번호 / 부서명 / 지역명');
DBMS_OUTPUT.PUT_LINE('----------------------------');
FOR CNT IN 1..4 LOOP
--값이 한 줄 리턴인 경우만 가능.
SELECT DISTINCT * INTO VDEPT FROM DEPT
WHERE DEPTNO = 10 * CNT;
DBMS_OUTPUT.PUT_LINE(VDEPT.DEPTNO || ' / ' || VDEPT.DNAME || ' / ' || VDEPT.LOC);
END LOOP;
END;
/
-------------------------------------------------------------------------

DECLARE
N NUMBER := 1;
BEGIN
WHILE N <= 5 LOOP
DBMS_OUTPUT.PUT_LINE(N);
N := N + 1;
END LOOP;
END;
/
-------------------------------------------------------------------------

DECLARE
VNUM NUMBER := 2;
BEGIN
<<GUBUN>> --라벨을 붙일 수 있다.
FOR I IN 1..9 LOOP
DBMS_OUTPUT.PUT_LINE(VNUM || ' * ' || I || ' = ' || VNUM * I);
IF VNUM < 9 AND I = 9 THEN
VNUM := VNUM + 1;
DBMS_OUTPUT.PUT_LINE('');
GOTO GUBUN; --라벨로 돌아가기, 대소문자 구분 안함.
ELSIF VNUM = 9 AND I = 9 THEN
EXIT;
END IF;
END LOOP;
END;
/
-------------------------------------------------------------------------

DECLARE
VNUM NUMBER := 2;
BEGIN

<<EVEN>>
LOOP
IF MOD(VNUM, 2) = 0 THEN
DBMS_OUTPUT.PUT_LINE(VNUM || '는 짝');
VNUM := VNUM + 1;
ELSE 
GOTO ODD;
END IF;
IF VNUM = 10 THEN
EXIT;
END IF;
END LOOP;

<<ODD>>
LOOP
IF MOD(VNUM, 2) = 1 THEN
DBMS_OUTPUT.PUT_LINE(VNUM || '는 홀');
VNUM := VNUM + 1;
ELSE
GOTO EVEN;
END IF;
IF VNUM = 10 THEN
EXIT;
END IF;
END LOOP;

END;
/
-------------------------------------------------------------------------

DECLARE
V_DEPTNO EMP.DEPTNO%TYPE := 30; --NUMBER(2)
V_EMP EMP%ROWTYPE; --EMP 테이블의 구조로 동일한 한 줄 자료형으로 데이터를 받아오는 참조자료형
BEGIN
--묵시적 커서 : 여러 행의 데이터가 자동으로(묵시적으로) 처리됨.
UPDATE EMP01
SET SAL = SAL + SAL * 0.01
WHERE DEPTNO = V_DEPTNO;
DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT);
--SQL%ROWCOUNT : 커서명이 없을 경우 바로 전에 실행된 SQL문의 ROW수 반환하는 커서의 속성임.
--커서명이 있는 경우 SQL부분을 커서명으로 넣을 수 있다.
SELECT * INTO V_EMP FROM EMP01 WHERE ROWNUM = 1;
DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT);
END;
/
-------------------------------------------------------------------------

DECLARE
VDEPT DEPT%ROWTYPE;
CURSOR C2 IS SELECT * FROM DEPT;
BEGIN
DBMS_OUTPUT.PUT_LINE('부서번호 / 부서명 / 지역명');
DBMS_OUTPUT.PUT_LINE('--------------------------');
OPEN C2;
LOOP
FETCH C2 INTO VDEPT.DEPTNO, VDEPT.DNAME, VDEPT.LOC;
EXIT WHEN C2%NOTFOUND; --더 이상 읽어들일 FETCH가 없으면 TRUE
DBMS_OUTPUT.PUT_LINE(VDEPT.DEPTNO || ' ' || VDEPT.DNAME || ' ' || VDEPT.LOC);
END LOOP;
DBMS_OUTPUT.PUT_LINE('행수 => ' || C2%ROWCOUNT);
CLOSE C2;
END;
/
-------------------------------------------------------------------------

DECLARE
V_EMPNO EMP.EMPNO%TYPE;
V_ENAME EMP.ENAME%TYPE;
CURSOR CUR_EMP(P_DEPTNO EMP.DEPTNO%TYPE)
IS SELECT EMPNO, ENAME FROM EMP WHERE DEPTNO = P_DEPTNO;
BEGIN
OPEN CUR_EMP(30);
LOOP
--커서에 선언된 컬럼의 개수, 순서, 자료형과
--FETCH ~ INTO절 안에 선언된 변수의 개수, 순서, 자료형이 일치해야 한다.
FETCH CUR_EMP INTO V_EMPNO, V_ENAME;
EXIT WHEN CUR_EMP%NOTFOUND;
DBMS_OUTPUT.PUT_LINE(V_EMPNO || ' ' || V_ENAME);
END LOOP;
CLOSE CUR_EMP;
END;
/
-------------------------------------------------------------------------

DECLARE
CURSOR C2 IS SELECT * FROM DEPT;
BEGIN
DBMS_OUTPUT.PUT_LINE('부서번호 / 부서명 / 지역명');
DBMS_OUTPUT.PUT_LINE('----------------------------');
FOR VDEPT IN C2 LOOP
DBMS_OUTPUT.PUT_LINE(VDEPT.DEPTNO || ' ' || VDEPT.DNAME || ' ' || VDEPT.LOC);
END LOOP;
END;
/
-------------------------------------------------------------------------

DECLARE
CURSOR CUR_EMP(P_DEPTNO EMP.DEPTNO%TYPE)
IS SELECT * FROM EMP WHERE DEPTNO = P_DEPTNO;
BEGIN
FOR EMP_ROW IN CUR_EMP(30)
LOOP
DBMS_OUTPUT.PUT_LINE(EMP_ROW.EMPNO || ' ' || EMP_ROW.ENAME);
END LOOP;
END;
/
-------------------------------------------------------------------------

BEGIN
FOR EMP_ROW IN (SELECT * FROM EMP WHERE DEPTNO = 30)
LOOP
DBMS_OUTPUT.PUT_LINE(EMP_ROW.EMPNO || ' ' || EMP_ROW.ENAME);
END LOOP;
END;
/
-------------------------------------------------------------------------

DECLARE
VEMPNO EMP.EMPNO%TYPE;
VENAME EMP.ENAME%TYPE;
VJOB EMP.JOB%TYPE;
V_SQL VARCHAR2(1000);
BEGIN
--SQL쿼리문을 변수에 담는다
--V_SQL변수가 VARCHAR2이므로 안의 SMITH가 문자열이라는 것을 인식하도록 하기 위해서는
--''값''(작은따옴표 2개)을 사용해야 한다. 큰따옴표가 아님.
V_SQL := 'SELECT EMPNO, ENAME, JOB FROM EMP WHERE ENAME = ''SMITH'' ';
EXECUTE IMMEDIATE V_SQL INTO VEMPNO, VENAME, VJOB;
DBMS_OUTPUT.PUT_LINE('EMPNO : ' || VEMPNO);
DBMS_OUTPUT.PUT_LINE('ENAME : ' || VENAME);
DBMS_OUTPUT.PUT_LINE('JOB : ' || VJOB);
END;
/
-------------------------------------------------------------------------

--바인드 변수 사용 : 연결해주는 변수를 바인드라고 함.
--SQL쿼리문에 변수를 설정하여 해당 변수에 대응하는 값을 연결해주는 방식
--여러 SQL안의 값이 변경되어도 구문을 변경해줄 필요가 없다.
DECLARE
VEMPNO EMP.EMPNO%TYPE;
VENAME EMP.ENAME%TYPE;
--바인드 변수와 값 설정
VJOB EMP.JOB%TYPE := 'CLERK';
VDEPTNO EMP.DEPTNO%TYPE := 30;

V_SQL VARCHAR2(1000);
BEGIN
--SQL쿼리문을 바인드 변수로 처리
--SQL쿼리문 안의 바인드 변수는 꼭 [:변수명] 형식으로 기술해주어야 한다.
V_SQL := 'SELECT EMPNO, ENAME FROM EMP WHERE JOB = :A AND DEPTNO = :B';
--V_SQL := 'SELECT EMPNO, ENAME FROM EMP WHERE JOB = :A AND DEPTNO = :A'; --가능
EXECUTE IMMEDIATE V_SQL INTO VEMPNO, VENAME
USING VJOB, VDEPTNO;
DBMS_OUTPUT.PUT_LINE('EMPNO : ' || VEMPNO);
DBMS_OUTPUT.PUT_LINE('ENAME : ' || VENAME);
END;
/
-------------------------------------------------------------------------

DECLARE
VIDS MYINFO.IDS%TYPE := 1;
VNM MYINFO.NM%TYPE := 'ALBERT';
VBD MYINFO.BD%TYPE := TO_DATE('2000/01/01', 'YYYY/MM/DD');
--VIDS MYINFO.IDS%TYPE := 2;
--VNM MYINFO.NM%TYPE := 'MAX';
--VBD MYINFO.BD%TYPE := TO_DATE('2005/03/05', 'YYYY/MM/DD');
VSQL VARCHAR2(1000);
BEGIN
VSQL := 'INSERT INTO MYINFO VALUES (:A, :A, :A)';
EXECUTE IMMEDIATE VSQL USING VIDS, VNM, VBD;
COMMIT;
END;
/
-------------------------------------------------------------------------

DECLARE
VIDS MYINFO.IDS%TYPE := 1;
VNM MYINFO.NM%TYPE := 'ALBERT';
VBD MYINFO.BD%TYPE := TO_DATE('2010/01/01', 'YYYY/MM/DD');
VMY MYINFO%ROWTYPE;
CURSOR C_MYINFO IS SELECT * FROM MYINFO;
VSQL VARCHAR2(1000);

BEGIN

VSQL := 'UPDATE MYINFO SET BD = :A WHERE IDS = :A';
EXECUTE IMMEDIATE VSQL USING VBD, VIDS;
COMMIT;

SELECT NM, BD INTO VNM, VBD FROM MYINFO WHERE IDS = VIDS;
DBMS_OUTPUT.PUT_LINE('UPDATE문 실행 후(COMMIT) : ' || VNM || ', ' || VBD);
VIDS := 2; 

VSQL := 'DELETE FROM MYINFO WHERE IDS = :A';
EXECUTE IMMEDIATE VSQL USING VIDS; 

OPEN C_MYINFO;
LOOP
FETCH C_MYINFO INTO VMY;
EXIT WHEN C_MYINFO%NOTFOUND;
DBMS_OUTPUT.PUT_LINE('DELETE문 실행 후 : ' || VMY.IDS || '' || VMY.NM || ' ' || VMY.BD);
END LOOP;
CLOSE C_MYINFO;

DBMS_OUTPUT.PUT_LINE('---------------------------------------------------');

ROLLBACK;

OPEN C_MYINFO;
LOOP
FETCH C_MYINFO INTO VMY;
EXIT WHEN C_MYINFO%NOTFOUND;
DBMS_OUTPUT.PUT_LINE('DELETE문 실행 후 : ' || VMY.IDS || '' || VMY.NM || ' ' || VMY.BD);
END LOOP;
CLOSE C_MYINFO;
END;
/
-------------------------------------------------------------------------


-------------------------------------------------------------------------


-------------------------------------------------------------------------


-------------------------------------------------------------------------


-------------------------------------------------------------------------


-------------------------------------------------------------------------


-------------------------------------------------------------------------


-------------------------------------------------------------------------


-------------------------------------------------------------------------
