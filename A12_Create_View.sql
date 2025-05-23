-------------------------- CREATE VIEW -----------------------------------------
                                                                  -- V CH11.1
CREATE VIEW D80
AS                                         -- COPY TABLE IN D80 
SELECT EMPLOYEE_ID, LAST_NAME, SALARY      -- VIEW:- IS A VIRTUAL TABLE WHICH ARE CONTANE ONLY SELECTED DATA    
FROM EMPLOYEES                             -- AS WELL AS SHOW ONLY THE SELECTED DATA 
WHERE DEPARTMENT_ID = 80;

SELECT * FROM D80;                         -- IS A TEMPRARY SORTCUT WHICH SHOW ONLY THE SELECTED DATA

SELECT * FROM D80                          -- WE CAN ALSO OPERATIONS PERFORMS ON VIEW (VIEW BEHAVE LIKE TABLE)
WHERE SALARY >12000; 

SELECT * 
FROM D80                          
ORDER BY LAST_NAME; 


CREATE VIEW EMP_ABOUT
AS
SELECT EMPLOYEE_ID ID_NUMBER, LAST_NAME  NAME, SALARY*12 ANN_SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50;


CREATE OR REPLACE VIEW EMPVU80 (ID_NUMBER, NAME, SAL, DEPARTMENT_ID)            -- IF EMPVU80 VIEW IS ALRADY PRESENT THEN MODIFY  
AS                                                                              -- OTHERWISE CREATE VIEW
SELECT EMPLOYEE_ID, FIRST_NAME||' '||LAST_NAME, SALARY, DEPARTMENT_ID           -- ID_NUMBER --STOR E_ID, NAME--STOR F-L NAME SO ON
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80;


--COMPLEX VIEW (DATA RETREAVE FROM MULTIPLE TABLE)
CREATE VIEW DEPT_SUM_VU (NAME, MINSAL, MAXSAL, AVGSAL)
AS
SELECT D.DEPARTMENT_NAME, MIN(E.SALARY), MAX(E.SALARY), AVG(E.SALARY)
FROM EMPLOYEES E JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME;

DESC DEPT_SUM_VU;
DROP VIEW DEPT_SUM_VU;

                                                                -- V CH11.2
                                                                -- SIMPLE VIEW WITH DML OPERATIONS
CREATE TABLE INFORMATION (NAME VARCHAR(20), MO_NUMBER NUMBER(10));
SELECT * FROM INFORMATION;
                                                                -- WE ARE ABLE TO PERFORM DML OPERATIONS IN SIMPLE VIEW
CREATE VIEW VI                                                  -- IF YOU WANT TO USER CAN ONLEY RADE SO USE  WITH READ ONLY
AS
SELECT NAME, MO_NUMBER
FROM INFORMATION;

SELECT *FROM VI;

INSERT INTO VI (NAME, MO_NUMBER)
              VALUES ('RAHUL', 9981);   
SELECT *FROM VI;

DELETE FROM VI
WHERE NAME = 'AMIT';
SELECT *FROM VI;


CREATE OR REPLACE VIEW EMPVU10 (E_NUMBER, E_NAME, JOB_TITLE)      -- IF YOU WANT TO USER ONLY READ THE VIEW VIRTUAL TABLE
AS                                                                -- SO YOU CAN USE WITH READ ONLY CLAUSE
SELECT EMPLOYEE_ID, LAST_NAME, JOB_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 10
WITH READ ONLY;

INSERT INTO EMPVU10                -- CAN NOT PERFORM DML OPERATIONS ON EMPVU10 VIEW
VALUES (120, NULL, NULL);   

DROP VIEW EMPVU10;
                                                        -- VERY IMP QUERY
                                                        -- FIND TOP 3 SALARYS
SELECT ROWNUM AS RANK, LAST_NAME, SALARY
FROM ( SELECT LAST_NAME, SALARY
       FROM EMPLOYEES
       ORDER BY SALARY DESC)
WHERE ROWNUM <=3;                   -- ITS FOR MULTIPLE VALUES NOT FOR SINGLE VALUE


-- FINT SECOND HIGHEST SALARY
SELECT MAX(SALARY)
FROM EMPLOYEES
WHERE SALARY < ( SELECT MAX(SALARY)
                 FROM EMPLOYEES 
                 );


-- FINT 3RD HIGHEST SALARY
SELECT MAX(SALARY)
FROM EMPLOYEES
WHERE SALARY < ( SELECT MAX(SALARY)
                 FROM EMPLOYEES 
                 WHERE SALARY < ( SELECT MAX(SALARY)
                                  FROM EMPLOYEES 
                                 )
                 );



--FIND TOP 3RD HIGHEST SALARY
SELECT ROWNUM AS RANK, LAST_NAME, SALARY
FROM ( SELECT ROWNUM , LAST_NAME, SALARY
       FROM EMPLOYEES
       ORDER BY SALARY DESC)       --ERROR
WHERE ROWNUM = 3;                  --ITS RUN FOR 1 BUT ROWNUM = 2,3, SO ON NOT RUN WHAY 












