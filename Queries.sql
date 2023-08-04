--List the employee number, last name, first name, sex, and salary of each employee. 
--Module 9 | Day 1 | Activity 9
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s ON
e.emp_no = s.emp_no;


--List the first name, last name, and hire date for the employees who were hired in 1986.
--https://www.w3schools.com/sql/func_mysql_extract.asp
SELECT * 
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;


--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_no, d.dept_name
FROM employees AS e
INNER JOIN dept_manager AS dm
ON e.emp_no = dm.emp_no
JOIN departments AS d
ON dm.dept_no = d.dept_no;


--List the department number for each employee along with that employee's employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name, d.dept_no
FROM employees AS e
INNER JOIN dept_emp AS de
ON e.emp_no = de.emp_no 
JOIN departments AS d
ON de.dept_no = d.dept_no;


--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees 
WHERE first_name = 'Hercules' OR 
last_name LIKE 'B%';


--List each employee in the Sales department, including their employee number, last name, and first name. -- NEED HELP
--Office hours with TA Aarti
SELECT  e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
    INNER JOIN dept_emp AS de
        ON (e.emp_no = de.emp_no)
    INNER JOIN departments AS d
        ON (de.dept_no = d.dept_no)
WHERE d.dept_name = 'Sales'
ORDER BY e.emp_no;


--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de 
ON e.emp_no = de.emp_no
INNER JOIN departments AS d ON 
de.dept_no = d.dept_no
WHERE dept_name IN ('Sales','Development'); 


--List the frequency counts, in descending order, of all the employees last name(how many employees share each last name)
SELECT last_name, count(last_name) AS frequency_count
FROM employees
GROUP BY last_name
ORDER BY frequency_count DESC;
