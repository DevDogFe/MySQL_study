use employees;
show TABLES;

SELECT * FROM employees;
desc employees;

SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM salaries;
SELECT * FROM titles;

SELECT * 
FROM dept_emp
WHERE dept_no = 'd005';

SELECT *
FROM dept_emp as de
INNER JOIN employees as e
ON de.emp_no = e.emp_no
INNER JOIN departments as d
ON de.dept_no = d.dept_no
ORDER BY de.emp_no;