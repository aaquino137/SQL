CREATE TABLE Titles (
	title_id VARCHAR NOT NULL,
	title VARCHAR NOT NULL,
	PRIMARY KEY (title_id)
	);
	
CREATE TABLE Employees (
    emp_no INTEGER NOT NULL,
    emp_title_id VARCHAR NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY(emp_title_id) REFERENCES Titles (title_id)
	);
	
CREATE TABLE Departments (
    dept_no VARCHAR NOT NULL,
    dept_name VARCHAR NOT NULL,
	PRIMARY KEY (dept_no)
);
CREATE TABLE Dept_Emp (
    emp_no INTEGER NOT NULL,
    dept_no VARCHAR NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY(emp_no) REFERENCES Employees (emp_no),
	FOREIGN KEY(dept_no) REFERENCES Departments (dept_no)
    );
CREATE TABLE Dept_Manager (
    dept_no VARCHAR NOT NULL,
    emp_no INTEGER NOT NULL,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY(emp_no) REFERENCES Employees (emp_no),
	FOREIGN KEY(dept_no) REFERENCES Departments (dept_no)
);
CREATE TABLE Salaries (
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY(emp_no) REFERENCES Employees (emp_no)
);

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e
INNER JOIN salaries as s ON
e.emp_no=s.emp_no; 

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '01/01/1986' AND '12/31/1986'

SELECT dm.emp_no, dm.dept_no, dept.dept_name,e.last_name, e.first_name
FROM employees as e
INNER JOIN dept_manager as dm ON
e.emp_no=dm.emp_no
INNER JOIN dept_emp as de ON
e.emp_no = de.emp_no
INNER JOIN departments as dept ON
de.dept_no = dept.dept_no;

SELECT de.dept_no, e.emp_no, e.last_name, e.first_name, dept.dept_name
FROM employees as e
INNER JOIN dept_emp as de ON
e.emp_no = de.emp_no
INNER JOIN departments as dept ON
de.dept_no = dept.dept_no;

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'

SELECT e.emp_no, e.last_name, e.first_name, dept.dept_name
FROM employees as e
INNER JOIN dept_emp as de ON
e.emp_no = de.emp_no
INNER JOIN departments as dept ON
de.dept_no = dept.dept_no
WHERE 
	dept_name = 'Sales';

SELECT  e.emp_no, e.last_name, e.first_name, dept.dept_name
FROM employees as e
INNER JOIN dept_emp as de ON
e.emp_no = de.emp_no
INNER JOIN departments as dept ON
de.dept_no = dept.dept_no
WHERE 
	dept_name = 'Sales'
OR
	dept_name = 'Development';

SELECT last_name,COUNT (last_name) AS Frequency
FROM employees
GROUP BY last_name
ORDER BY
COUNT (last_name) DESC;
