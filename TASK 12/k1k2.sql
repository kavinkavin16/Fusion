CREATE TABLE K1 (A VARCHAR2(30),B NUMBER,C CHAR,D CHAR);

CREATE TABLE K2 (A VARCHAR2(30),B NUMBER,C CHAR,D CHAR,E CHAR);

INSERT INTO K1 VALUES('KAVIN',16,'A','D');
INSERT INTO K1 VALUES('PRITHIVI',16,'B','F');
INSERT INTO K1 VALUES('ROOPA1',16,'C','J');
INSERT INTO K1 VALUES('PETCHI',16,'B','C');
INSERT INTO K1 VALUES('MUTHU',16,'E','V');

TRUNCATE TABLE K1;

INSERT INTO K2 VALUES('KAVIN',16,'A','D','F');
INSERT INTO K2 VALUES('PRITHIVI',16,'B','F','L');
INSERT INTO K2 VALUES('ROOPA',16,'C','G','K');
INSERT INTO K2 VALUES('PM',16,'B','C','M');

SELECT * FROM K1;
SELECT * FROM K2;


SELECT F.A,S.B,S.C FROM K1 F JOIN K2 S ON F.A=S.A;

SELECT F.A,S.B,S.C FROM K1 F, K2 S WHERE F.A=S.A(+);

--LEFT, RIGHT, FULL OUTER,

