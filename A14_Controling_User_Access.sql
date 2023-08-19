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
                                                              
                                                              
                                                              
                                                              
                                                              
                                                              
                                                              
                                                              
                                                              
                                                              
                                                              
                                                              
                                                              