CREATE TABLE TEST1 (
ID NUMBER (2) CONSTRAINT TEST1_ID_PK PRIMARY KEY,
NAME VARCHAR2(10),
AGE NUMBER(2)
);

CREATE TABLE TEST2 (
ID NUMBER (2) CONSTRAINT TEST2_ID_PK REFERENCES TEST1(ID),
JOB VARCHAR2(20)
);
-------------------------------------------------------------------------

INSERT INTO TEST1 VALUES(1, '장희빈', 10);
INSERT INTO TEST1 VALUES(2, '이효리', 25);
INSERT INTO TEST1 VALUES(3, '이나영', 40);
INSERT INTO TEST1 VALUES(5, '이혜리', 35);
INSERT INTO TEST1 VALUES(6, '주진모', 15);
COMMIT;

INSERT INTO TEST2 VALUES(1, '백수');
INSERT INTO TEST2 VALUES(3, '백조');
INSERT INTO TEST2 VALUES(5, '날라리');
INSERT INTO TEST2 VALUES(3, '강사');
INSERT INTO TEST2 VALUES(2, '건달'); 
COMMIT;
-------------------------------------------------------------------------

SELECT * 
FROM TEST1 T1
JOIN TEST2 T2
ON T1.ID = T2.ID;

--SELECT * FROM TEST1 T1, TEST2 T2 WHERE T1.ID = T2.ID; 
-------------------------------------------------------------------------

SELECT ID, NAME, AGE, JOB 
FROM TEST1 T1
INNER JOIN TEST2 T2
USING (ID);
-------------------------------------------------------------------------
