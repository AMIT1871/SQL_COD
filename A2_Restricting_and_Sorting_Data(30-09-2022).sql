--------------------- 2ed CHAPTER ---------------------------------------------
-------------------- Restricting and Sorting Data  ----------------------------

SELECT employee_id, last_name, job_id, department_id
FROM employees
WHERE department_id = 90 ;

SELECT last_name, job_id, department_id
FROM employees
WHERE last_name = 'Whalen' ;

SELECT last_name 
FROM employees
WHERE hire_date = '17-OCT-03' ;

SELECT last_name, salary
FROM employees
WHERE salary <= 3000 ;

SELECT last_name, salary
FROM employees
WHERE salary>=2500 AND salary<=3500 ;

-- alternate of above Query
SELECT last_name, salary
FROM employees
WHERE salary BETWEEN 2500 AND 3500 ;
l
SELECT employee_id, last_name, salary, manager_id
FROM employees
WHERE manager_id=100 or manager_id=101 or manager_id=201 ;

-- Alternate of above Query
SELECT employee_id, last_name, salary, manager_id
FROM employees
WHERE manager_id IN (100, 101, 201) ;

SELECT *
FROM employees
WHERE manager_id is null;

SELECT *
FROM employees
WHERE manager_id is not null;

SELECT first_name
FROM employees
WHERE first_name LIKE '%s';

SELECT last_name
FROM employees
WHERE last_name LIKE '_o%' ;

SELECT last_name
FROM employees
WHERE last_name   not LIKE 'A%' ;

SELECT last_name, manager_id
FROM employees
WHERE manager_id IS NULL ;

SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary >= 10000
AND job_id LIKE '%MAN%' ;

SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary >= 10000
OR job_id LIKE '%MAN%' ;

SELECT last_name, job_id
FROM employees
WHERE job_id 
NOT IN ('IT_PROG', 'ST_CLERK', 'SA_REP') ;

SELECT last_name, department_id, salary
FROM employees
WHERE department_id = 60 OR department_id = 80
AND salary > 10000;

SELECT last_name, department_id, salary
FROM employees
WHERE (department_id = 60 OR department_id = 80)
AND salary > 10000;

SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date ;

SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY department_id DESC ;

SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY department_id ASC ;

SELECT employee_id, last_name, salary*12 as annsal
FROM employees
ORDER BY annsal ;

SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY 3;

SELECT last_name, department_id, salary
FROM employees
ORDER BY department_id, salary DESC;

--
--
--
-- NOT RUNNING
SELECT employee_id, first_name 
FROM employees 
ORDER BY  employee_id 
FETCH FIRST 5 rows only;


--
--
--
--
-- NOT RUNNING
SELECT employee_id, first_name
FROM employees
ORDER BY  employee_id
OFFSET  5 rows FETCH NEXT 5 ROWS only;


--
--
--
-- NOT RUNNING
SELECT employee_id, first_name, salary
FROM employees
ORDER BY  salary
FETCH FIRST 5 percent rows only;



--
--
--
-- NOT RUNNING
SELECT employee_id, first_name, salary
FROM employees
ORDER BY  salary
FETCH FIRST 5 percent rows with ties;



--
--
--
-- NOT RUNNING
SELECT employee_id
ORDER BY  salary
OFFSET 4 rows
FETCH FIRST 5 percent rows with ties;


----------------- SUBSTITUTION VARIABLE ----------------------------------------

SELECT employee_id, first_name, salary, department_id
FROM employees
WHERE employee_id = &employee_num;

SELECT last_name, department_id, salary*12 , JOB_ID
FROM  employees
WHERE job_id = '&job_title';

SELECT employee_id, first_name, JOB_ID, &column_name
FROM employees
WHERE &condition
ORDER BY &order_column;

SELECT employee_id, last_name, JOB_ID, &&column_name
FROM employees
ORDER BY &column_name;


DEFINE employee_num = 200

SELECT employee_id, first_name,salary, department_id
FROM employees
WHERE employee_id = &employee_num;

UNDEFINE employee_num



------------------- PRACTICE QUESTION SET II -----------------------------------

-- Q.2
SELECT *
FROM employees
WHERE last_name LIKE '%hh%';

-- Q.3
SELECT *
FROM employees
WHERE manager_id IS NULL ;

-- Q.4
SELECT *
FROM employees
WHERE first_name LIKE 'S%';

-- Q.5
SELECT *
FROM employees
WHERE PHONE_NUMBER IN (124, 123);
--WHERE phone_number IN (%124%, %123%);

-- Q.6
SELECT *
FROM departments
WHERE location_id = 1700 ;

-- Q.8
SELECT *
FROM departments
WHERE department_name LIKE '%ing%' ;

-- Q.11
SELECT *
FROM locations
WHERE country_ID IN ( 'JP', 'US', 'CA' ) ;

-- Q.12
SELECT job_id
FROM employees
WHERE salary BETWEEN 10000 AND 14000 
ORDER BY job_id;

-- Q.13
SELECT *
FROM employees
WHERE salary BETWEEN &lower_limit  AND &upper_limit
--FETCH FIRST 5 rows only; -- that condition is working

-- Q.14
SELECT employee_id
FROM departments;



















-------------------------- 16-10-2022------------------------------

select to_char(sysdate, 'dd "of" month') from dual;

select last_name,  to_char(hire_date, 'fmDD month YYYY')
as HIREDATE
from employees;

select to_char(SALARY, '$99,999.00') SALARY
from EMPLOYEES;

select to_char(SALARY, 'L99,999.00') SALARY
from EMPLOYEES;


select sysdate-to_date('11/13/2022', 'MM/DD/YYYY') 
from dual;

select salary, salary-to_number('$100.00' , '$99,999.00')
from employees;




select intcap( replace('SHE IS BEAUTIFUL,"DEAUTIFUL",''CLAVER'))
from DUAL;

SELECT *
from employees
where hire_date>'01_May_01'
and job_id in('IT_PROG', 'MGR');


SELECT last_name, to_char(hire_date, 'DD-Mon_YYYY')
from employees
where hire_date> to_date('01-Jan-90', 'DD-Mon_RR');

select employee_id, last_name, hire_date 
from employees
where extract (year from hire_date) = 2004;


select first_name, salary, commission_pct 
from employees;


select first_name, salary, nvl(commission_pct , 0)
from employees;

select last_name, salary, nvl(to_char(manager_id), 'no manager') 
from employees
where manager_id is null;

select last_name, salary, nvl(commission_pct,0),
(salary*12)+(salary*12*nvl(commission_pct,0)) AN_SAL
from employees;


---------------------------19-10-2022------------------------------------------

select count(*)
from employees 
where commission_pct is not null;


select count(*)  -- ITS NOT PERFORMS WITH NULL VALUE
from employees 
where commission_pct <= .2;

select count(*)    -- ITS PERFORMS WITH NULL VALUE
from employees 
where LNNVL (commission_pct <= .2);

select last_name, salary, commission_pct,  -- its works like a if else
NVL2(commission_pct, 'sal+comm' , 'sal') income
from employees 
where department_id in (50,80);

select last_name, salary, commission_pct,  -- its works like a if else
NVL2(commission_pct,  salary + (salary*commission_pct) , salary) income
from employees 
where last_name like 'B%'
order by last_name;

select first_name, length(first_name) "expr1"
      last_name, length(last_name) "expr2"
      nullif(length(first_name),length(last_name))result
from employees;



select last_name, salary, commission_pct,
coalesce ((salary + (commission_pct *salary)),salary+2000)"new salary"
from employees;


select last_name, salary, commission_pct,
coalesce ((salary + (commission_pct *salary)), commission_pct,10)"new salary"
from employees;


selEct last_name, job_id, salary,
case job_id when 'IT_PROG'  then 1.10*salary
            when 'ST_CLERK'  then 1.15*salary
            when 'SA_REP'  then 1.20*salary
ELSE SALARY END "REVISED_SALARY"
FROM employees;


selEct last_name, job_id, salary,
decode( job_id, 'IT_PROG', 1.10*salary,
             'ST_CLERK', 1.15*salary,
             'SA_REP', 1.20*salary,
             SALARY)
             REVISED_SALARY
FROM employees;

selEct last_name, salary,
decode(trunc(salary/2000, 0),
             0, 0.00,
             1, 0.09,
             2, 0.20,
             3, 0.30,
             4, 0.40,)
             tax_rate
             
FROM employees
where department_id = 80;


select avg(salary), max(salary),
       min(salary), sum(salary)
from employees
order by salary desc;

select max(hire_date), min(hire_date) from employees;

select max(salary), min(salary) from employees;

select max(last_name), min(last_name) from employees;

select * from departments;
select * from departments;


--------------------------------- 21-10-2022  ----------------------------
select department_id, avg(salary)
from employees
group by department_id;

select department_id, max(salary)
from employees
group by department_id;

select department_id, min(salary)
from employees
group by department_id;

select department_id, sum(salary)
from employees
group by department_id;

select department_id, job_id, sum(salary) 
from employees
WHERE DEPARTMENT_ID>40
group by department_id, JOB_ID
ORDER BY DEPARTMENT_ID;

select department_id, MAX(salary)
from employees
group by department_id
HAVING MAX(SALARY)>10000;

select JOB_id, SUM(salary) PAYORLL  --IMP
from employees
WHERE JOB_ID NOT LIKE '%REP%'
group by JOB_id
HAVING SUM(SALARY)>13000
ORDER BY SUM(SALARY);

select MAX(avg(salary))
from employees
group by department_id;

SELECT * FROM JOBS;

SELECT * FROM EMPLOYEES NATURAL JOIN JOBS;

SELECT * FROM DEPARTMENTS;

SELECT * FROM EMPLOYEES NATURAL JOIN DEPARTMENTS;

SELECT EMPLOYEE_ID, LAST_NAME, LOCATION_ID, DEPARTMENT_ID
FROM EMPLOYEES JOIN DEPARTMENTS
USING DEPARTMENT_ID;

SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.DEPARTMENT_ID,
       D.DEPARTMENT_ID, D.LOCATION_ID
FROM EMPLOYEES E JOIN DEPARTMENTS D
ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID);

SELECT LAST_NAME, DEPARTMENT_NAME, CITY
FROM EMPLOYEES E JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN LOCATIONS L
ON D.LOCATION_ID = L.LOCATION_ID;
















