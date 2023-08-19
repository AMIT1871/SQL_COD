--------------------------- 7th CHAPTER ----------------------------------------
-------------------- Using Subqueries to Solve Queries -------------------------

SELECT  LAST_NAME, HIRE_DATE
FROM  EMPLOYEES
WHERE HIRE_DATE > ( SELECT HIRE_DATE
                    FROM EMPLOYEES
                    WHERE LAST_NAME = 'Davies');

-- V V IMP 
-- FIND SECOND HIGHEST SALARY
SELECT MAX(SALARY)
FROM EMPLOYEES
WHERE SALARY < ( SELECT MAX(SALARY)
                 FROM EMPLOYEES 
                 );
 
 
-- FIND SECOND HIGHEST SALARY AND HIS NAME
SELECT FIRST_NAME, SALARY 
FROM EMPLOYEES
WHERE SALARY = 
               (SELECT MAX(SALARY)
               FROM EMPLOYEES
               WHERE SALARY < ( SELECT MAX(SALARY)
                                 FROM EMPLOYEES 
                                 ));
  
  
  
SELECT LAST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE JOB_ID = ( SELECT JOB_ID     --SA_REP
                 FROM EMPLOYEES 
                 WHERE LAST_NAME = 'Taylor')
 
 AND SALARY > ( SELECT SALARY      -- 8600
                FROM EMPLOYEES
                WHERE LAST_NAME = 'Taylor');
 
 
  
SELECT LAST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE JOB_ID = ( SELECT JOB_ID     -- ST_CLERK
                 FROM EMPLOYEES 
                 WHERE employee_id = 141)
 
 AND SALARY > ( SELECT SALARY      -- 2600
                FROM EMPLOYEES
                WHERE employee_id = 143);
 
 
SELECT LAST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY = ( SELECT MIN(SALARY)
                 FROM EMPLOYEES 
                 );
 
 
SELECT DEPARTMENT_ID, MIN(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING MIN(SALARY) > ( SELECT MIN(SALARY)  --2500
                       FROM EMPLOYEES 
                       WHERE DEPARTMENT_ID = 30 );
                      
 
  
SELECT EMPLOYEE_ID, LAST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY < ANY   ( SELECT SALARY  -- 9000, 6000,4200,4800
                       FROM EMPLOYEES 
                       WHERE JOB_ID = 'IT_PROG' )
AND JOB_ID <> 'IT_PROG'; 
 
 
SELECT EMPLOYEE_ID, LAST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY < ALL   ( SELECT SALARY  -- 9000, 6000,4200,4800
                       FROM EMPLOYEES 
                       WHERE JOB_ID = 'IT_PROG' )
AND JOB_ID <> 'IT_PROG'; 
 
 
SELECT FIRST_NAME, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE(SALARY, DEPARTMENT_ID) IN (SELECT MIN(SALARY), DEPARTMENT_ID
                                 FROM EMPLOYEES
                                 GROUP BY DEPARTMENT_ID)
ORDER BY DEPARTMENT_ID;


SELECT EMP.LAST_NAME
FROM EMPLOYEES EMP
WHERE EMP.EMPLOYEE_ID  NOT IN ( SELECT MGR.MANAGER_ID
                               FROM EMPLOYEES MGR);
 
 
SELECT LAST_NAME, MANAGER_ID
FROM EMPLOYEES 
WHERE EMPLOYEE_ID  IN ( SELECT MANAGER_ID
                        FROM EMPLOYEES);
 
 
WITH 
   EMP_COUNT
   AS
   
   (SELECT COUNT(*) NUM, DEPARTMENT_ID
    FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID)
    
    SELECT D.DEPARTMENT_ID, LOCATION_ID, NUM
    FROM DEPARTMENT D, EMP_COUNT
    WHERE D.DEPARTMENT_ID = EMP_COUNT.DEPARTMENT_ID;
 
 
 
 
 
 
 
 
 
 
                                  
                                 
                                 
                                 
                      