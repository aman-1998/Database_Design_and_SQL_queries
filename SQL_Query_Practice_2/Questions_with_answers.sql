/* 1. Find employees working in project 'P1'. */
--Ans:
SELECT
    es.project AS project,
    COUNT(*) AS no_of_employes
FROM
    employee_salary es
WHERE
    es.project = 'P1'
GROUP BY
    es.project;
	
-----------------------------------------------------------------------------------------------------------
/* 2. Retrieve employees having salary greater than or equal to 20000 and less than or equal to 35000. */
--Ans:
SELECT
    ed.full_name,
    es.emp_id,
    es.project,
    es.salary
FROM
    employee_salary   es,
    employee_detail   ed
WHERE
    es.salary BETWEEN 20000 AND 35000
    AND es.emp_id = ed.emp_id
	
----------------------------------------------------------------------
/* 3. Retrieve number of employees working in different projects. */
--Ans:
SELECT
    es.project,
    COUNT(*) AS no_of_employees
FROM
    employee_salary es
GROUP BY
    es.project
ORDER BY
    no_of_employees desc
	
---------------------------------------------------------------------------
/* 4. Write query to fetch first name of employees. */
--Ans:
SELECT
    substr(ed.full_name, 1, instr(ed.full_name, ' ') - 1) AS first_name
FROM
    employee_detail ed
	
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
/* 5. Retrieve employee first names and their salary records. The output must contain all the employes even if the salary record is not present for a employee. */
--Ans:
SELECT
    ed.full_name,
    ed.emp_id,
    SUM(es.salary) AS salary
FROM
    employee_detail   ed
    LEFT JOIN employee_salary   es ON ed.emp_id = es.emp_id
GROUP BY
    ed.full_name,
    ed.emp_id
ORDER BY
    salary DESC

--------------------------------------------------------------------
/* 6. Find employees who are also managers. */
--Ans:
SELECT
    ed1.emp_id,
    ed1.full_name
FROM
    employee_detail   ed1,
    employee_detail   ed2
WHERE
    ed1.emp_id = ed2.manager_id
	
--------------------------------------------------------------------------------------------------------
/* 7. Retrieve all employees from EMPLOYEE_DETAIL table who have a record in EMPLOYEE_SALARY table. */
--Ans:
SELECT DISTINCT
    ed.emp_id,
    full_name,
    date_of_joining
FROM
    employee_detail   ed,
    employee_salary   es
WHERE
    ed.emp_id = es.emp_id
	
-------------------------------------------------------------
/* 8. Write sql query to fetch duplicate records. */
--Ans:
WITH emp_with_salary AS (
    SELECT
        ed.emp_id,
        full_name,
        date_of_joining
    FROM
        employee_detail   ed,
        employee_salary   es
    WHERE
        ed.emp_id = es.emp_id
)
SELECT
    emp_with_salary.emp_id,
    emp_with_salary.full_name,
    emp_with_salary.date_of_joining,
    COUNT(*) AS no_of_records
FROM
    emp_with_salary
GROUP BY
    emp_with_salary.emp_id,
    emp_with_salary.full_name,
    emp_with_salary.date_of_joining
HAVING 
    COUNT(*) > 1
	
------------------------------------------------------------------------------------------------
/* 9. Write SQL query to fetch last name of employees with their employee id. */
--Ans:
SELECT
	emp_id,
    reverse(substr(reverse(full_name), 1, instr(reverse(full_name), ' ') - 1)) AS last_name
FROM
    employee_detail
	
------------------------------------------------------------------------------------------------
/* 10. Retrieve detail of all employees with their last names. */
--Ans:
WITH employee_total_salary AS (
    SELECT
        emp_id,
        SUM(salary) AS salary
    FROM
        employee_salary
    GROUP BY
        emp_id
)
SELECT
    ed.emp_id,
    REVERSE(SUBSTR(REVERSE(ed.full_name), 1, INSTR(REVERSE(ed.full_name), ' ') - 1)) AS last_name,
    ed.manager_id,
    ed.date_of_joining,
    ets.salary
FROM
    employee_detail         ed
    LEFT JOIN employee_total_salary   ets ON ed.emp_id = ets.emp_id
	
---------------------------------------------------------------------------------
/* 11. Retrieve detail of all employees whose last name starts with 'R'. */
--Ans:
WITH employee_total_salary AS (
    SELECT
        emp_id,
        SUM(salary) AS salary
    FROM
        employee_salary
    GROUP BY
        emp_id
), employee_with_all_details AS (
    SELECT
        ed.emp_id,
        reverse(substr(reverse(ed.full_name), 1, instr(reverse(ed.full_name), ' ') - 1)) AS last_name,
        ed.manager_id,
        ed.date_of_joining,
        ets.salary
    FROM
        employee_detail         ed
        LEFT JOIN employee_total_salary   ets ON ed.emp_id = ets.emp_id
)
SELECT
    ewad.*
FROM
    employee_with_all_details ewad
WHERE
    ewad.last_name LIKE 'R%'