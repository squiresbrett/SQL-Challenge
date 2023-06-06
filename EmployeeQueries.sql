-- 1. List the employee number, last name, first name, sex, and salary of each employee.

SELECT employees.emp_no, 
employees.last_name,
employees.first_name,
employees.sex,
salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no
ORDER BY emp_no

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT * 
FROM employees
WHERE DATE_PART('year',hire_date) = 1986
ORDER BY emp_no;

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT Department_Managers.dept_no,
Departments.dept_name,
Department_Managers.emp_no,
Employees.last_name,
Employees.first_name
FROM Department_Managers
JOIN Departments
ON Department_Managers.dept_no = Departments.dept_no
JOIN Employees
ON Department_Managers.emp_no = Employees.emp_no
ORDER BY emp_no;

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT Employees.emp_no,
Employees.last_name,
Employees.first_name,
Department_Employees.dept_no,
Departments.dept_name
FROM Employees
JOIN Department_Employees
ON Employees.emp_no = Department_Employees.emp_no
JOIN Departments
ON Departments.dept_no = Department_Employees.dept_no
ORDER BY emp_no;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT Employees.emp_no,
Employees.first_name,
Employees.last_name,
Employees.sex
FROM Employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.

SELECT Employees.emp_no,
Employees.last_name,
Employees.first_name,
Departments.dept_name
FROM Employees
JOIN Department_Employees
ON Employees.emp_no = Department_Employees.emp_no
JOIN Departments
ON Departments.dept_no = Department_Employees.dept_no
WHERE departments.dept_name='Sales';

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT Employees.emp_no,
Employees.last_name,
Employees.first_name,
Departments.dept_name
FROM Employees
JOIN Department_Employees
ON Employees.emp_no = Department_Employees.emp_no
JOIN Departments
ON Departments.dept_no = Department_Employees.dept_no
WHERE departments.dept_name in ('Sales','Development')

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name, COUNT('*') AS freq_count
FROM Employees
GROUP BY last_name
ORDER BY freq_count DESC;
