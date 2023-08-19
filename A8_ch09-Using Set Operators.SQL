--------------------------- 8th CHAPTER ----------------------------------------
---------------------- A8_ch09-Using Set Operators -----------------------------
                                                           -- v ch13.2
                                                           -- 37:18 TIME STAMP VIDEO START AT THAT POINT
-- UNION
SELECT JOB_ID, DEPARTMENT_ID
FROM EMPLOYEES
UNION                                    -- UION:- DATA RETURN BOTH TABLE BUT ELIMINAT DUPLICATE DATA 
SELECT JOB_ID, DEPARTMENT_ID             -- AS WELL AS BOTH TABLE HAE SAME NAME AND SAME DATA TYPE
FROM JOB_HISTORY;                        -- UNION ALSO WORK WITH 3 TABLES-(1,2,3)UNION(2,3,4,5,6) =(1,2,3,4,5,6)

    
--UION ALL                                                 -- V CH15.2
SELECT JOB_ID, DEPARTMENT_ID
FROM EMPLOYEES
UNION ALL                                -- UION ALL:- DATA RETURN BOTH TABLE AND DUPLICATE DATA  ARE ALSO COME 
SELECT JOB_ID, DEPARTMENT_ID             --(1,2,3)UNION ALL(2,3,4,5,6) =(1,2,2,3,3,4,5,6)
FROM JOB_HISTORY;                        


--UION ALL                                                
SELECT JOB_ID, DEPARTMENT_ID
FROM EMPLOYEES                           --(1,2,3,4)INTERSECT(2,3,4,5,6) = (2,3,4)
INTERSECT                                
SELECT JOB_ID, DEPARTMENT_ID             
FROM JOB_HISTORY;


-- MINUS                                                
SELECT JOB_ID, DEPARTMENT_ID
FROM EMPLOYEES                           --(1,2,3,4,5,6)INTERSECT(2,3,4) = (1,5,6)
MINUS                                    -- A ME HO PAR B ME  NA SO
SELECT JOB_ID, DEPARTMENT_ID             
FROM JOB_HISTORY;


SELECT LOCATION_ID, DIPARTMENT_NAME "DEPARTMENT", TO_CHAR(NULL) "WAREHOUSE LOCATION"    -- INVALID BECAUSE NO. OF COLUMN NOT MATCH
FROM DEPARTMENTS
UNION
SELECT LOCATION_ID, TO_CHAR(NULL) "DEPARTMENT", STATE_PROVINCE
FROM LOCATIONS;

SELECT EMPLOYEE_ID, JOB_ID, TO_DATE(HIRE_DATE) "HIRE_DATE"
FROM EMPLOYEES
UNION 
SELECT EMPLOYEE_ID, JOB_ID, TO_DATE(NULL) "HIRE_DATE"
FROM JOB_HISTORY;





