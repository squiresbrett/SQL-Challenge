-- Create the Titles table
CREATE TABLE Titles (
    title_id VARCHAR PRIMARY KEY,
    title VARCHAR
);

-- Create the Employees table
CREATE TABLE Employees (
    emp_no INTEGER PRIMARY KEY,
    title_id VARCHAR,
    birth_date DATE,
    first_name VARCHAR,
    last_name VARCHAR,
    sex VARCHAR,
    hire_date DATE,
    FOREIGN KEY (title_id) REFERENCES Titles(title_id)
);

-- Create the Salaries table
CREATE TABLE Salaries (
    emp_no INTEGER PRIMARY KEY,
    salary BIGINT,
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

-- Create the Departments table
CREATE TABLE Departments (
    dept_no VARCHAR PRIMARY KEY,
    dept_name VARCHAR
);

-- Create the Department Employees table
CREATE TABLE Department_Employees (
    emp_no INTEGER,
    dept_no VARCHAR,
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

-- Create the Department Managers table
CREATE TABLE Department_Managers (
    dept_no VARCHAR,
    emp_no INTEGER,
    FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

