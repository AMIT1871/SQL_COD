--------------------- 3rd CHAPTER ---------------------------------------------
----------- Using Single-Row Functions to Customizw Output  -------------------

                                                -- DRIVE V CH3 PART2
            
SELECT employee_id, last_name, department_id
FROM employees
WHERE LOWER(last_name) = 'higgins';

SELECT employee_id, last_name, department_id
FROM employees
WHERE LOWER(last_name) = LOWER('HIGGIns');

SELECT UPPER(department_name)
FROM departments;

SELECT INITCAP(department_name)
FROM departments;

SELECT INITCAP('my name is amit')
FROM dual;

SELECT CONCAT('Hello', 'World')
FROM dual;

SELECT SUBSTR('HelloWorld', 2,5)   -- 2 start 5 no. of letters
FROM dual;

SELECT LENGTH(first_name)
FROM employees;

SELECT INSTR('HelloWorld', 'W') -- 6TH POSITION
FROM dual;

SELECT INSTR('HelloWorld', 'A') -- not found so 0
FROM dual;

SELECT INSTR('HelloWorldW', 'W') -- 6TH POSITION
FROM dual;                     -- FOUND ANY FIRST TIME CHARATER ANS 1ST POSITION

SELECT LPAD(salary, 10, '*')
FROM employees;

SELECT RPAD(salary, 10, '#')
FROM employees;

SELECT TRIM('A' FROM 'AMITA')   -- trim only left and right but not trim bitween
FROM DUAL;

SELECT CONCAT(CONCAT(last_name,'''s job category is '), job_id) "job"
FROM employees
WHERE SUBSTR(job_id,4) = 'REP';   -- start to 4     end to last

SELECT employee_id, CONCAT(first_name, last_name) name , LENGTH(last_name),
INSTR(last_name,'a') "Contains 'a'?", last_name
FROM employees
WHERE SUBSTR(last_name,-1,1) = 'n';

SELECT last_name, UPPER(CONCAT(SUBSTR(last_name,1,8),'_US')) 
FROM employees
WHERE department_id = 60;

SELECT ROUND(45.926,2)  --O/P 45.93
FROM DUAL;

SELECT ROUND(45.924,2) --O/P 45.92
FROM DUAL;

SELECT ROUND(45.924,2) --O/P 45.92
FROM DUAL;

SELECT ROUND(45.964,1) --O/P 46
FROM DUAL;

SELECT ROUND(45.924,1) --O/P 45.9
FROM DUAL;

SELECT ROUND(45.324,0) --O/P 45
FROM DUAL;

SELECT ROUND(45.966,1), ROUND(45.466,0),ROUND(45.900) --O/P 46 45 46
FROM DUAL;

SELECT ROUND(45.924,-1), ROUND(44.926,-1), -- 50  40
ROUND(45.924,-2),ROUND(50,-2)          -- 0   100
FROM DUAL;

SELECT TRUNC(45.924,2), TRUNC(44.926),              -- 45.92  44
TRUNC(45.924,-1),TRUNC(55.924,-1) ,TRUNC(55.924,-2), -- 40  50 0
TRUNC(555.454,-3)    -- 0
FROM DUAL;

SELECT MOD(1300,300) -- 100
FROM dual;

SELECT  FIRST_NAME, SALARY, MOD(SALARY,2)
FROM EMPLOYEES
WHERE MOD(SALARY,2)=0;

SELECT employee_id as"Even Numbers", last_name
FROM employees
WHERE MOD(employee_id,2) = 0;



------------------ WORKING WITH DATES -----------------------------------------
               
                                              -- DRIVE V CH3 PART3
SELECT *    -- Represent all tables of HR user
FROM tab;

SELECT  sysdate   --current date
FROM dual;

SELECT SYSDATE-10  -- subtract 10 days from sysdate
FROM DUAL;

SELECT SYSDATE    -- o/p like   18-11-22
FROM DUAL;        -- hire problem is 22 is 1922 or 2022 which one

SELECT (18-11-2022) - (10-11-2022)  -- 8
FROM dual;

SELECT (sysdate) - (10-11-2022)  -- wrong output
FROM dual;

SELECT last_name, (current_date - hire_date)/7 as weeks   -- find no. of weeks
FROM employees
WHERE department_id = 90;

--both are same 
SELECT last_name, (sysdate - hire_date)/7 as weeks
FROM employees
WHERE department_id = 90;

SELECT last_name, months_between(sysdate,hire_date) as month
FROM employees
WHERE department_id = 90;

SELECT  add_months(current_date,2) AS MONTHS
FROM DUAL;

SELECT  NEXT_DAY(SYSDATE, 'WEDNESDAY')
FROM DUAL;

SELECT  LAST_DAY(SYSDATE)
FROM DUAL;

SELECT ROUND(SYSDATE, 'MONTH')
FROM DUAL;

SELECT ROUND(TO_DATE('15-06-2022'), 'MONTH') --01-06-22
FROM DUAL;

SELECT ROUND(TO_DATE('16-06-2022'), 'MONTH')  --01-07-22
FROM DUAL;

SELECT ROUND(TO_DATE('14-06-2022'), 'MONTH') -- 01-06-2022
FROM DUAL;

SELECT ROUND(TO_DATE('14-06-2022'), 'YEAR') -- 01-01-2022
FROM DUAL;

SELECT TRUNC(TO_DATE('14-07-2022'), 'MONTH') -- 01-07-2022
FROM DUAL;

SELECT TRUNC(TO_DATE('14-07-2022'), 'YEAR') -- 01-01-2022
FROM DUAL;



--------------------------------- PRACTICE -----------------------------------

SELECT  ROUND(12.450)    -- 12
FROM DUAL;

SELECT  ROUND(12.550)    -- 13
FROM DUAL;

SELECT  ROUND(12.650)    --13
FROM DUAL;

SELECT  ROUND(12.654,2)  --12.65
FROM DUAL;

SELECT  ROUND(12.655,2)  --12.66
FROM DUAL;






