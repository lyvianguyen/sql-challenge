--Module 9 | Day 3 | Activity 3

--creating employee table
CREATE TABLE employees (
	emp_no SERIAL PRIMARY KEY,
	emp_title_id VARCHAR(10) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL, 
	sex VARCHAR NOT NULL, 
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
);

SELECT * FROM employees;


--creating title table 
CREATE TABLE titles (
	title_id VARCHAR(30),
	title VARCHAR NOT NULL,
	PRIMARY KEY (title_id)
);

SELECT * FROM titles;

--creating department table 
CREATE TABLE departments (
	dept_no VARCHAR(20),
	dept_name VARCHAR(50) NOT NULL,
	PRIMARY KEY (dept_no)
);

SELECT * FROM departments;


--creating salaries table
CREATE TABLE salaries (
	emp_no INT PRIMARY KEY,
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

SELECT * FROM salaries;


--creating dept_manager table
CREATE TABLE dept_manager (
	dept_no VARCHAR(20) NOT NULL,
	emp_no INT
);

SELECT * FROM dept_manager;


--creating dept_emp table
CREATE TABLE dept_emp (
	emp_no INT,
	dept_no VARCHAR(20),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

SELECT * FROM dept_emp;