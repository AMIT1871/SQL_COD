----------------------- 1ST CHAPTER -------------------------------------------
---------- Retricving Data Using The SQL SQL Select Statement -----------------
SELECT *
FROM departments ;

SELECT department_id, location_id
FROM departments;

SELECT last_name, salary, salary+300
FROM employees;

SELECT last_name, salary, 12*salary+100
FROM employees;

SELECT last_name, salary, 12*(salary+100)
FROM employees;

SELECT last_name, job_id, salary, commission_pct
FROM employees;

SELECT last_name, 12*salary*commission_pct
FROM employees;

SELECT last_name AS name, commission_pct comm
FROM employees;

SELECT last_name  "Name", salary*12 "Annual Salary"
FROM employees;

SELECT last_name || job_id AS "Employees" 
FROM employees;

SELECT last_name || ' is a '|| job_id as "employee details "
FROM employees;

SELECT department_name || q'[ Department's Manager id :]' ||
manager_id AS "Department and Manager" 
FROM departments;

SELECT department_name || ' Department''s Manager id :' ||
manager_id AS "Department and Manager" 
FROM departments;

SELECT department_id 
FROM departments;

SELECT DISTINCT department_id 
FROM employees;

DESCRIBE employees

-- or
DESC employees

-------------------  PRACTICE QUESTIONS (CH-1) ------------------------

-- Q.1 of ans
SELECT COUNT (*)
FROM countries;

-- Q.2 of ans
SELECT *
FROM regions;

-- Q.3 of ans
SELECT country_name, region_id
FROM countries;

-- Q.4 of ans
SELECT department_name, manager_id
FROM departments;

-- Q.5 of ans
SELECT state_province, city
FROM locations;

-- Q.6 of ans
SELECT COUNT(*) city
FROM locations;

-- Q.7 of ans
SELECT  FIRST_NAME ||' '|| LAST_NAME ||' '|| 'can be contacted via email: S'||
LAST_NAME ||', AND contact NUMBER :'
FROM employees
WHERE (FIRST_NAME = 'Steven') AND (LAST_NAME = 'King');

-- Q.8 of ans
DESCRIBE regions;

-- Q.9 of ans
SELECT hire_date, last_name, job_id, phone_number
FROM employees;

-- Q.10 of ans
SELECT PHONE_NUMBER
FROM employees
WHERE PHONE_NUMBER LIKE '%44%';






