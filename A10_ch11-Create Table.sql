--------------------------- 11th CHAPTER ---------------------------------------
--------------------------- CREATE TABLE  --------------------------------------
                                                            -- V CH9.1
CREATE TABLE DEPT (DEPTNO NUMBER(2), DNAME VARCHAR(14),
                   LOC VARCHAR(13));
                   
DESCRIBE DEPT;
SELECT* FROM DEPT;

INSERT INTO DEPT
       VALUES (10, 'AA', 'DD');
       
SELECT * FROM USER_TABLES;     -- SHOW HOW MANY TABLES ARE PRESENT / OWNED BY THE USER

SELECT * FROM USER_OBJECTS;    -- HOW MANY TYPE OF PERMITION YOU HAVE / OWNED BY THE USER

SELECT * FROM USER_CATALOG;    -- USER KE DATA KO ORACAL APNI TABLE ME STORE KARTA HAI (METE DATA)

                                                               -- V CH9.2
CREATE  TABLE DEPT5 (NAME VARCHAR(50), DOJ DATE DEFAULT SYSDATE);  
INSERT INTO DEPT5 (NAME)
       VALUES('SS');    
SELECT * FROM DEPT5;           -- DATE DATA TYPE ARE STORE ONLY DATE


CREATE  TABLE DEPT4 (NAME VARCHAR(50), DOJ TIMESTAMP DEFAULT SYSDATE);  
INSERT INTO DEPT4 (NAME)       -- TIMESTAMP DATA TYPE ARE STORE DATE WITH TIME
       VALUES('SS');       
SELECT * FROM DEPT4;


CREATE  TABLE DEPT6 (NAME VARCHAR(50), DOJ TIMESTAMP WITH TIME ZONE DEFAULT SYSDATE);  
INSERT INTO DEPT6 (NAME)       -- TIMESTAMP WITH TIME ZOME DATA TYPE ARE STORE DATE WITH TIME AND TIME ZONE
       VALUES('SS');       
SELECT * FROM DEPT6;


CREATE  TABLE DEPT7 (NAME VARCHAR(50), DOJ TIMESTAMP WITH LOCAL TIME ZONE DEFAULT SYSDATE);  
INSERT INTO DEPT7 (NAME)       -- TIMESTAMP WITH LOCAL TIME ZOME DATA TYPE ARE STORE DATE WITH TIME AND TIME ZONE ACORDING TO YOUR COMPUTER
       VALUES('SS');       
SELECT * FROM DEPT7;


CREATE TABLE DEPT70           -- CREATE TABLE WITH SUBQUERY (DATA COPY IN DEPT70)
AS
  SELECT EMPLOYEE_ID, LAST_NAME, SALARY*12 ANUALSAL, HIRE_DATE
  FROM EMPLOYEES
  WHERE DEPARTMENT_ID = 80;

DESCRIBE DEPT70;


--------------------------- ALTER ----------------------------------------------
                                                                -- V CH9.3
                                                                --19:40 TIME STAMP
DESCRIBE DEPT70;  

ALTER TABLE DEPT70                   -- ADD NEW COLUMN (LAST ME ADD HOGA)
ADD     (JOB_ID VARCHAR(2));         -- COLUMN RENAME NAHI HOTA HAI

SELECT* FROM DEPT70;  


ALTER TABLE DEPT70
MODIFY (LAST_NAME VARCHAR2(30));     -- LAST_NAME KA DATA TYPE VARCHAR2(25) TO CHANGE VARCHAR2(30)

DESCRIBE DEPT70;  


ALTER TABLE DEPT70            -- WITH THE HELF OF DROPE DELETE SELECTED ROW
DROP COLUMN JOB_ID;

DESCRIBE DEPT70;  


DROP TABLE DEPT80;            -- EXISTENCE OF DEPT70 REMOVE IT CAN NOT ROLLBACK
DESCRIBE DEPT80;  


DELETE COPY_EMP;           --ALL ROWS DELET BUTROLL BACK POSSIBLE
ROLLBACK;

TRUNCATE TABLE COPY_EMP;   -- ALL ROWS DELET BUT ROLLBACK NOT POSSIBLE
ROLLBACK;


                                                              -- V CH9.4
                                                              
RENAME COPY_EMP TO EMP_COPY;            -- WE CAN CHANGE OBJECT NAME
RENAME EMP_COPY TO COPY_EMP;

COMMENT ON TABLE COPY_EMP               -- STORE INFORMATION ABOUT TABLE
IS 'EMPLOYEE INFORMATION';






