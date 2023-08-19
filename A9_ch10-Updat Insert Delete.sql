--------------------------- 9th CHAPTER ----------------------------------------
----------------------Managing Table Using DML ---------------------------------
                                                            -- V CH7.8
                                                            -- 28:01 TIEM STAMP
-- PLEASE DO NOT RUN BECAUSE IF CHANGES ARE MAIN HR SCHEEMA
DESCRIBE DEPARTMENTS;

INSERT INTO DEPARTMENTS                                    -- ONLY ONE ROW INSERT AT A TIME
VALUES (500, 'PUBLIC RELATIONS', 101, 1700);               -- IF COLUMN NOT MENTION VALUES ORDER ARE ACORDING TO DEPARTMENTS COLUMN ORDER

INSERT INTO DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID)                                   
VALUES (500, 'PUBLIC RELATIONS', 101, 1700);               --VALUES ORDER ARE ACORDING TO COLUMN MENTION ORDER

INSERT INTO DEPARTMENTS (DEPARTMENT_ID)                    -- IF YOU WANT TO PUT ONLLY ONLY 1 DATA WITH THE HELP OF THIS FORMAT                
VALUES (500);                                              -- OTHER ONE AUTOMATICALY NULL

INSERT INTO DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID)                                   
VALUES (500, 'PUBLIC RELATIONS', NULL, NULL);              -- IF YOU WANT TO PUT DATA ON SELECTED ROWS 

SELECT * 
FROM DEPARTMENTS;

-- INSER STUDENT TABLE FROM DRIVE                                 -- v ch8.2
-- IF YOU WANT TO INSERT ANY DATA PLEASE INSERT THERE

CREATE TABLE TEMP (NAME VARCHAR(50),
                   EMAIL VARCHAR(100));

INSERT INTO TEMP 
VALUES('SS', 'SS@SS.COM');

SELECT * 
FROM TEMP;

INSERT INTO TEMP(NAME)
VALUES('AMIT');

SELECT * 
FROM TEMP;

INSERT INTO TEMP(EMAIL,NAME)
VALUES('AA@AA','AMIT');


INSERT INTO employees (employee_id, first_name, last_name, email, phone_number,
                       hire_date, job_id, salary,commission_pct, manager_id,
                       department_id)
            VALUES		(113, 'Louis', 'Popp', 'LPOPP', '515.124.4567',
                       sysdate, 'AC_ACCOUNT', 6900, null , 205,         -- FOR CURRENT SYSDATE
                        110);


INSERT INTO employees (employee_id, first_name, last_name, email, phone_number,
                      hire_date, job_id, salary, commission_pct, manager_id,
                      department_id)
            VALUES		(114, 'DEN', 'RAPHEALY', 'LPOPP', '515.124.4567', 
                      TO_DATE('FEB 3 2003','MON DD YYYY'), 'AC_ACCOUNT',     --FIRST CONVERT IN TO DATE
                      6900,0.2, 100, 60);


INSERT INTO departments (department_id, department_name, location_id)        -- with substitution variable
               VALUES   (&department_id, &department_name, &location_id);


INSERT INTO salse_rep(id, name, slary, commission_pc)
       select employee_id, last_name, salary, commission_pc                   -- SUBQUERY PART COPY IN SALSE_REP(INSERT)
       from employees                                                         -- VALUE CLAUSE NOT USE HERE
       where job_id LIKE '%REP%';                                             -- () NOT MUST IN SUBQUERY
 
 
INSERT INTO TEMP(NAME)
       (SELECT FIRST_NAME || LAST_NAME
        FROM EMPLOYEES
        WHERE JOB_ID = 'IT_PROG');  --5 ROWA INSERTED
 
 
INSERT INTO TEMP(NAME)
       VALUES ('AIT''S');           -- AMIT''S HERE '' IS NOT A DOUBLE QUTE IT'S A TWO TIME SINGLE QUTE

SELECT * 
FROM TEMP;


CREATE TABLE LOW_SAL	(employee_id NUMBER(6), SALARY NUMBER(8));
CREATE TABLE AVG_SAL	(employee_id NUMBER(6), SALARY NUMBER(8));
CREATE TABLE HI_SAL	(employee_id NUMBER(6), SALARY NUMBER(8));
INSERT ALL
			WHEN salary  <= 7000 THEN
				INTO low_sal
			WHEN salary BETWEEN 7001 AND 14000 THEN
				INTO avg_sal
			WHEN salary > 14000 THEN
				INTO hi_sal  
        
SELECT employee_id, salary 
FROM employees;
 
 
 
CREATE TABLE bonus							/*CREATE TABLE*/
		(employee_id NUMBER(6), bonus NUMBER(6) 	DEFAULT 500);
INSERT INTO bonus(employee_id)    /*POPULATE DATA*/
	 			SELECT employee_id FROM employees;
COMMIT;
MERGE INTO bonus b
  USING (SELECT employee_id, department_id, salary
						 FROM employees
						 WHERE department_id=&DEPTNO) e
  ON (b.employee_id = e.employee_id)
  WHEN MATCHED THEN 
				UPDATE SET b.bonus = e.salary * 0.25
				DELETE WHERE e.salary > 15000
  WHEN NOT MATCHED THEN
				INSERT (b.employee_id, b.bonus)
				VALUES (e.employee_id, e.salary * 0.35)
				WHERE (e.salary < 15000);

SELECT * 
FROM TEMP;

CREATE TABLE  SATA (NAME VARCHAR(50), CITY VARCHAR(50) DEFAULT'JBP');

INSERT INTO  SATA(NAME)   -- IF YOU NOT GIVE CITY DEFAULT JBP PUT
VALUES ('SS');

SELECT * 
FROM SATA;



--------------------------- UPDATE ---------------------------------------------
                                                                 --- V CH8.3
UPDATE TEMP
SET EMAIL = 'ABC@ABC.COM'
WHERE NAME = 'AMIT';         --IF YOU NOT GIVE WHERE ALL RECARDE ARE CHENG


CREATE TABLE COPY_EMP    -- COPY ALL EMPLOYEES DATA FROM EOPY_EMP TABLE
AS
SELECT * FROM EMPLOYEES;


SELECT * FROM COPY_EMP;


UPDATE COPY_EMP
SET    department_id = 50
WHERE  employee_id = 113;

SELECT * FROM EMPLOYEES;


UPDATE COPY_EMP
SET    department_id = 110;  -- ALL DEPARTMENT_ID = 110 (WITHOUT CONDITION)

SELECT * FROM COPY_EMP;

ROLLBACK;      -- CHANGES ARE UNDO WHILE YOU ARE NOT COMMIT

COMMIT;        -- AFTER COMMIT YOU CAN NOT ROLLBACK


UPDATE   COPY_EMP 
SET      (job_id,salary)  = (SELECT  job_id,salary
                    	       FROM    employees 
                             WHERE   employee_id = 205)
WHERE    employee_id    =  103;


UPDATE COPY_EMP
SET DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                     FROM EMPLOYEES
                     WHERE EMPLOYEE_ID = 100)
WHERE JOB_ID = (SELECT JOB_ID
                FROM EMPLOYEES
                WHERE EMPLOYEE_ID = 200);

SELECT * FROM COPY_EMP;

ROLLBACK;
---------------------------- DELETE -------------------------------------------
                                                              --V CH8.3
                                                              --28:23 TIME STAMP
CREATE TABLE COPY_EMP  -- COPY TABLE
AS
SELECT * FROM EMPLOYEES;

SELECT * FROM COPY_EMP;


DELETE FROM  COPY_EMP       -- IN DELETE FROM ARE NOT COMPALSARY WITHOUT FROM IT ALSO WORK
WHERE  department_name = 'Finance';

DELETE FROM COPY_EMP;       -- DELETE ALL DATA FROM COPY_EMP DELETE (NOT USE WHERE ALL ROWS ARE DELETE)

DELETE FROM COPY_EMP
WHERE  department_id IN
                (SELECT department_id
                 FROM   departments
                 WHERE  department_name 
                        LIKE '%Public%');



CREATE TABLE ST(NAME VARCHAR(50), CITY VARCHAR(50) DEFAULT 'JBP'); 

INSERT INTO ST(NAME)
       VALUES('SS');

SELECT *
FROM ST;















