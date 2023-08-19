-------------------------- Sequence Index Synonym ------------------------------
                                                             -- V CH11.2           
                                                             -- TIME STAMP 14:04
                                                             -- SEQUENCE           -- AUTO GENERATE UNIQUE NUMBERS
 
CREATE SEQUENCE SEQ12
INCREMENT BY 10
START WITH 120
MAXVALUE 9999
CACHE 100         -- USE MEMORY WHICH SIZE IS 100 (ISKE USE SE PROCESS FAST HOTI HAI)
CYCLE;            -- AFTER COMPLEAT 9999 NO. REPEAT TO 120-9999
                  -- NOCYCLE -- NOT REPEAT AFTER 9999 
                  -- NOCACHE -- NOT USE MEMORY (PROCESS ARE SLOW )


CREATE TABLE T1 (SNO NUMBER(5), NAME VARCHAR(30));

INSERT INTO T1
VALUES (SEQ12.NEXTVAL, 'SS');

INSERT INTO T1
VALUES (SEQ12.NEXTVAL, 'SS11');
                  
INSERT INTO T1
VALUES (SEQ12.NEXTVAL, 'SS22');

SELECT * FROM T1;
                                       -- FIND SEQUENCE DETAILS
SELECT SEQUENCE_NAME, MIN_VALUE, MAX_VALUE, INCREMENT_BY, LAST_NUMBER
FROM USER_SEQUENCES;

                                      -- FIND WHERE IS OUR S.N.
SELECT SEQ12.CURRVAL 
FROM DUAL;

                                         -- MODIFY THE SEQUENCE ACCEPT START
ALTER SEQUENCE SEQ12
INCREMENT BY 5
--START WITH 120   -- START CANNOT BE ALTER
MAXVALUE 8888
NOCACHE          
NOCYCLE;            
        

DROP SEQUENCE SEQ12;

-------------------------- INDEXING --------------------------------------------
                                                               -- V CH12.2

SELECT * FROM COPY_EMP;

CREATE INDEX INDEXFIRSTNAMEEMP
ON COPY_EMP(FIRST_NAME);


SELECT * 
FROM COPY_EMP
ORDER BY FIRST_NAME DESC;

CREATE INDEX UPPER_EMP_NAME_IDX
ON  COPY_EMP(UPPER(LAST_NAME));
SELECT * FROM COPY_EMP;

DROP INDEX UPPER_EMP_NAME_IDX;



---------------------------------- SYNONYMS ------------------------------------
                                                              -- V CH13.1
                                                              -- NOT IMP
CREATE  SYNONYM C_EMP
FOR CPOY_EMP;

SELECT * FROM C_EMP;
                                                              
DROP synonym C_EMP;
                                                              
                                                              
 


                  