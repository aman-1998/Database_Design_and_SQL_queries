/* 1. Find detail of all employees who is allocated in atleast one project. */
-- Ans:
SELECT
    ed.*
FROM
    employee_detail ed
WHERE
    EXISTS (
        SELECT
            es.emp_id
        FROM
            employee_salary es
        WHERE
            es.emp_id = ed.emp_id
    )
	
---------------------------------------------------------------------------------------------
/* 2. Find details of all employee who are on bench (i.e., not allocated to any project) */
-- Ans:
SELECT
    ed.*
FROM
    employee_detail ed
WHERE
    NOT EXISTS (
        SELECT
            es.emp_id
        FROM
            employee_salary es
        WHERE
            es.emp_id = ed.emp_id
    )