------------------- 4TH CHAPTER -----------------------------------------------
----------- USING CONVERSION FUNCTION AND CONDITION EXPAESIONS-----------------
                                         -- DRIVE V CH3.4

SELECT SYSDATE            -- OUTPUT CONSIDER DATE FORMAT
FROM dual;

SELECT to_char(sysdate,'dd-mm-yy'), --OUTPUT CONSIDER CHARACTER FORMAT
to_char(sysdate, 'dd-mm-yyyy'),to_char(sysdate, 'day-month-year'),
to_char(sysdate, 'dy-mon-yy')
FROM DUAL;

SELECT to_char(sysdate,'yyyy'),to_char(sysdate,'mon'), to_char(sysdate,'dd')
FROM DUAL;

SELECT last_name, to_char(hire_date,'dd month yyyy')
FROM employees;

SELECT last_name, to_char(hire_date,'ddth month yyyy'),
to_char(hire_date,'ddspth month yyyy'), to_char(hire_date,'ddth month yyyy'),
to_char(hire_date,'ddsp month yyyy')
FROM employees;

SELECT first_name, to_char(hire_date, 'hh:mi:ss')
FROM employees;

SELECT first_name, to_char(hire_date, 'hh24:mi:ss:PM')
FROM employees;

SELECT first_name, to_char(hire_date, 'DD "OF" MM')
FROM employees;


--- 
SELECT first_name, to_char(salary,'$99,999.99')
FROM employees;

SELECT first_name, to_char(salary,'L99,999.99')
FROM employees;


SELECT to_number('$234', '$999')
FROM dual;

SELECT to_date('12-12-19', 'dd-mm-yy')
FROM dual;

--                                                  
-- 
--  NOT RUN                                            V CH 3.5
SELECT (to_number(to_char(sysdate,'yyyy'),'9999')) -
(to_number(to_char(to_date('01/01/2000', 'dd/mm/yyyy'),'yyyy'),'9999'))
FROM dual;

SELECT first_name
FROM employees
WHERE  ((to_number(to_char(sysdate,'yyyy'),'9999')) -
(to_number(to_char(hire_date,'yyyy'),'9999')))> 18;

SELECT FIRST_NAME, TO_CHAR(HIRE_DATE,'DD "OF" MONTH')
FROM EMPLOYEES;

SELECT FIRST_NAME, TO_CHAR(HIRE_DATE,'HH:MI:SS: AM')  -- DEFAULT 12:00
FROM EMPLOYEES;

SELECT FIRST_NAME, TO_CHAR(HIRE_DATE,'HH24:MI:SS: PM')  -- DEFAULT 12:00
FROM EMPLOYEES;

SELECT LAST_NAME, TO_CHAR(HIRE_DATE,' FM DD MONTH YYYY') --FORMAT MODEL
FROM EMPLOYEES;

SELECT TO_DATE('12/11/2019','DD/MM/YYYY')+10
FROM DUAL;

SELECT LAST_NAME, TO_CHAR(HIRE_DATE,'DD-MON-YYYY')
FROM EMPLOYEES
WHERE HIRE_DATE < TO_DATE('01-JAN-90','DD-MON-RR');  --RR PREVIUS CENTURY


SELECT LAST_NAME, TO_CHAR(HIRE_DATE,'DD-MON-YYYY')
FROM EMPLOYEES
WHERE HIRE_DATE < TO_DATE('01-JAN-90','DD-MON-YY');  --YY CURRENT YEAR


-------------------------- NVL -----------------------------------------------
                                                 --  V  CH3.7
                                                
SELECT LAST_NAME, FIRST_NAME, NVL(TO_CHAR(MANAGER_ID),'NO MANAGER')
FROM EMPLOYEES
WHERE MANAGER_ID IS NULL;

SELECT LAST_NAME, FIRST_NAME, NVL(MANAGER_ID,0)
FROM EMPLOYEES
WHERE MANAGER_ID IS NULL;

SELECT LAST_NAME, FIRST_NAME,MANAGER_ID
FROM EMPLOYEES;

SELECT LAST_NAME, FIRST_NAME, NVL(COMMISSION_PCT,0)
FROM EMPLOYEES;

SELECT LAST_NAME, FIRST_NAME, NVL(HIRE_DATE,'01-JAN-97')
FROM EMPLOYEES;

SELECT LAST_NAME, FIRST_NAME, NVL(JOB_ID, 'NO JOB YET')
FROM EMPLOYEES;

SELECT LAST_NAME, SALARY, NVL(COMMISSION_PCT,0),
(SALARY*12) + (SALARY*12*NVL(COMMISSION_PCT,0)) AS AN_SALARYF
FROM EMPLOYEES;

SELECT LAST_NAME, SALARY, COMMISSION_PCT,
NVL2(COMMISSION_PCT, 'SAL+COMM', 'SAL') INCOME
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN(50,80);

SELECT LAST_NAME, SALARY, COMMISSION_PCT,
NVL2(COMMISSION_PCT, '1', '0') INCOME            -- WHIE MASSAGE ARE DIGIT OR 
FROM EMPLOYEES                                  --CHAR USE SINGLE QOUTE
WHERE DEPARTMENT_ID IN(50,80);

SELECT LAST_NAME, SALARY, COMMISSION_PCT,
NVL2(COMMISSION_PCT, 1, 0) INCOME            --  BOTH ARE CORRECT STATEMENT UP AND DOWN
FROM EMPLOYEES                               
WHERE DEPARTMENT_ID IN(50,80);

SELECT FIRST_NAME, LENGTH(FIRST_NAME) "EXP1", LENGTH(LAST_NAME) "EXP2",
NULLIF(LENGTH(FIRST_NAME), LENGTH(LAST_NAME)) RESULT
FROM EMPLOYEES;

SELECT LAST_NAME, COALESCE(COMMISSION_PCT, SALARY, 10) COMM
FROM EMPLOYEES
ORDER BY COMMISSION_PCT;

SELECT LAST_NAME, JOB_ID, SALARY,
CASE JOB_ID WHEN 'IT_PROG' THEN 1.10*SALARY
            WHEN 'ST_CLERK' THEN 1.15*SALARY
            WHEN 'SA_REP' THEN 1.20*SALARY
ELSE SALARY
END "REVISED SALARY"
FROM EMPLOYEES;
                                              -- BOTH OUTPUT ARE SAME ABOVE AND BELLO
                                              -- QUEARY
SELECT LAST_NAME, JOB_ID, SALARY,
DECODE( JOB_ID, 'IT_PROG'  , 1.10*SALARY,
                'ST_CLERK' , 1.15*SALARY,
                'SA_REP'   , 1.20*SALARY,
                SALARY)
 "REVISED SALARY"
FROM EMPLOYEES;

SELECT LAST_NAME, SALARY,
DECODE (TRUNC (SALARY/2000,0),
                    0,0.00,
                    1,0.09,
                    2,0.20,
                    3,0.30,
                    4,0.40,
                    5,0.42,
                    6,0.44,
                      0.45) TAX_RATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80;
                      




