----------------- A12_CONSTRAINTS(DATA DICTINORY) ------------------------------
-------------- NOT_NULL, UNIQUE, PRIMARY, FOREN KEYS ---------------------------
                                                              --V CH9.4
                                                              -- 8.08 TIME STAMP
--NOT_NULL
CREATE TABLE COPY_EMP2 (EMPLOYEE_ID NUMBER(6),
                        LAST_NAME VARCHAR(50) NOT NULL);      -- WHER YOU ARE INSERT DATA LAST_NAME NULL VALUE NOT ACCEPT       
DESCRIBE COPY_EMP2;                 

INSERT INTO COPY_EMP2
       VALUES (123, NULL);   -- ITS GIVE ERROR BECAUSE LAST_NAME NOT TAKE NULL VALUE
       
INSERT INTO COPY_EMP2   -- ERROR BECAUSE ----
       VALUES (123);
       
DROP TABLE COPY_EMP3;  

CREATE TABLE COPY_EMP123(E_ID NUMBER (6),
                       L_NAME VARCHAR2(25) NOT NULL,    -- SELF TAKE CONSTRAINT NAME
                       SALARY NUMBER(8,22),
                       COMMISITION_PCT NUMBER (2,2),
                       HIRE DATE CONSTRAINT COPY_EMP_HIRE_DATE_NN  -- USER DIFINE CONSTRAINT NAME (CONSTRAINT DELETION ME KAM AATA HAI)
                       NOT NULL);
DESCRIBE COPY_EMP123;                          
DROP TABLE EMPL121;     
    
--------------------------- UNIQUE CONSTRAINT ----------------------------------------------
CREATE TABLE EMPL121( EMPLOYEE_ID NUMBER(6),
                          LAST_NAME VARCHAR(25),
                          EMAIL VARCHAR(25),
                          SALARY NUMBER(8,2),
                          COMMITION_PCT NUMBER(2,2),
                          HIRE_DATE DATE NOT NULL,
                          CONSTRAINT EMP_EMA_UK UNIQUE(EMAIL),
                          CONSTRAINT EMP_SAL_UK UNIQUE(SALARY));
DESCRIBE DEPARTMENTS123;                          
DROP TABLE EMPL121;  
 
------------------------- PRIMARY KEY -------------------------------------------
                                                              --V CH10
CREATE TABLE DEPARTMENTS123( DEPARTMENT_ID NUMBER(4),
                       DEPARTMENT_NAME VARCHAR2(30) CONSTRAINT DEP_NAME_NN NOT NULL,  
                       MANAGER_ID NUMBER(6),                                         -- PRIMARY KEY :-NOT NULL + UNIQUE FEATURE
                       LOCATION_ID NUMBER(4),
                       CONSTRAINT DEPT_PK PRIMARY KEY(DEPARTMENT_ID));
DESCRIBE DEPARTMENTS123;


---------------------- FOREIGN KEY ----------------------------------------------
CREATE TABLE EMPLOYEES000(EMPLOYEE_ID NUMBER(6),
                          LAST_NAME VARCHAR2(25) NOT NULL,           
                          EMAIL VARCHAR2(25),
                          SALARY NUMBER(8,2),
                          COMMISSION_PCT NUMBER(2,2),
                          HIRE_DATE DATE NOT NULL,
                          DEPARTMENT_ID NUMBER(4),
                          CONSTRAINT EMP_DEP_FK FOREIGN KEY(DEPARTMENT_ID)            -- FK UST BE UNIQUE AND NOT NULL
                          REFERENCES DEPARTMENTS123(DEPARTMENT_ID),
                          CONSTRAINT EMP_EM_UK UNIQUE(EMAIL));
DESCRIBE EMPLOYEES000;

         
-------------------- CHECK CONSTRAINT ------------------------------------------
CREATE TABLE EMPLOYEES001(EMPLOYEE_ID NUMBER(6),
                          LAST_NAME VARCHAR2(25) NOT NULL,
                          EMAIL VARCHAR2(25),
                          SALARY NUMBER(8,2),
                          COMMISSION_PCT NUMBER(2,2),
                          HIRE_DATE DATE NOT NULL,
                          DEPARTMENT_ID NUMBER(4),
                          CONSTRAINT E_S_MIN CHECK(SALARY>0),   -- WHEN USER INSERT SALARY THEN S MUST BE > 0 
                          CONSTRAINT E_EM_UK UNIQUE(EMAIL));
DESCRIBE EMPLOYEES001;

------------------------ AFTER CREATED TABLE MAKE CHANGES ------------------------
CREATE TABLE DEPT85(EID NUMBER(2),
                    NAME VARCHAR(30));

ALTER TABLE DEPT85
ADD PRIMARY KEY(EID);   -- AFTER CREATED TABLE YOU CHANGE PK, FK, NOTNULL ETC USE ALTER

CREATE TABLE EMP85(EID NUMBER(2),
                  NAME VARCHAR(30));
                                
ALTER TABLE EMP85
ADD CONSTRAINT EMP_EI_FK FOREIGN KEY(EID)          
               REFERENCES DEPT85(EID);
DESCRIBE EMP85;

---------------------- DROP CONSTRAINT ---------------------------------------------
ALTER TABLE EMP85
DROP CONSTRAINT EMP_EI_FK;    

ALTER TABLE DEPT85    
DROP PRIMARY KEY;

CREATE TABLE AMIT(NAME VARCHAR(10)
                  CONSTRAINT A_N NOT NULL);
ALTER TABLE AMIT        --CONSTRAINT NAME MUST FOR REMOVE NOT NULL
DROP  NOT NULL ;

ALTER TABLE AMIT
DROP constraint A_N;

-------------------------- CASCADE ------------------------------------------
ALTER TABLE DEPT85    
DROP PRIMARY KEY CASCADE;      -- REMOVE PRIMARY KY AND ALL REFERENCES

---------------------- DISABLE -------------------------------------------------
ALTER TABLE AMIT
DISABLE CONSTRAINT A_N CASCADE;                -- TEMPRARY DISABLE

ALTER TABLE AMIT
ENABLE CONSTRAINT A_N CASCADE;                -- TEMPRARY ENABLE


------------------------ DELETE TABLE + CONSTRAINT ------------------------------
ALTER TABLE AMIT
DROP (NAME) CASCADE CONSTRAINT;           --CLUMN + PRIMARY + REFERENC ALL DELETE

ALTER TABLE AMIT
DROP (NAME, SALARY, DATE) CASCADE CONSTRAINT;  

------------------------- FIND CONSTRAINTS ---------------------------------------
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, SEARCH_CONDITION
FROM USER_CONSTRAINTS
--WHERE TABLE_NAME = 'EMPLOYEES












                       
                       
                       
                       
                       