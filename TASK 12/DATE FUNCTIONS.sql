CREATE TABLE DATEA(NAMES VARCHAR2(30),DATE1 DATE,DATE2 DATE,DATE3 DATE);
CREATE TABLE DATEB(NAMES VARCHAR2(30),DATE1 DATE,DATE2 DATE,DATE3 DATE);
COMMIT;

INSERT INTO DATEA VALUES('PRITHIVI','12-08-2000','21-12-2021','09-12-2012');
INSERT INTO DATEA VALUES('KAVIN','16-08-1999','20-12-2021','09-11-2012');
INSERT INTO DATEA VALUES('ROOPA','19-08-2000','19-12-2021','09-10-2012');
INSERT INTO DATEA VALUES('PETCHIMUTHU','20-08-2000','20-12-2021','09-09-2012');


select * from DATEA;

INSERT INTO DATEB VALUES('PRITHIVI','12-08-2000','21-12-2021','09-12-2012');
INSERT INTO DATEB VALUES('KAVIN','16-08-1999','20-12-2021','09-11-2012');
INSERT INTO DATEB VALUES('SYBIL','19-08-2000','19-12-2021','09-10-2012');
INSERT INTO DATEB VALUES('KLAUS','20-08-2000','20-12-2021','09-09-2012');

select * from DATEB;

-->ADD MONTHS()
SELECT TO_CHAR(ADD_MONTHS(date1, 12), 'DD-MON-YYYY') "Next month"
  FROM datea 
  WHERE names = 'KAVIN';
  
--JUST ADDS NUMBER-OF-MONTHS TO THE SELECTED DATE AND DISPLAYS THE OUTPUT DATE

-->CURRENT_DATE()
SELECT SESSIONTIMEZONE, CURRENT_DATE FROM DUAL;
ALTER SESSION SET TIME_ZONE = '-8:0';

--CURRENT_DATE returns the current date in the session time zone, in a value in the Gregorian calendar of data type DATE.

-->