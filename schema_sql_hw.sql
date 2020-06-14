--1.Titles table
Create Table Titles(
	title_id varchar(100) Not Null,
	title varchar(50) Not Null,
	PRIMARY KEY(title_id)
);

select * from Titles;

--2. Employees table
CREATE TABLE Employees (
     emp_no int  NOT NULL,
     emp_title_id varchar(100) NOT NULL,
     birth_date date,
     first_name varchar(100) NOT NULL,
     last_name varchar(100) NOT NULL,
     sex varchar(50) NOT NULL,
     hire_date date,
	 PRIMARY KEY(emp_no),
	 FOREIGN KEY(emp_title_id) REFERENCES Titles (title_id)
);


SELECT * FROM Employees;

--3. Salaries table

CREATE TABLE Salaries (
	emp_no int  NOT NULL,
    salary int  NOT NULL,
	PRIMARY KEY(emp_no),
	FOREIGN KEY(emp_no) REFERENCES Employees (emp_no)
);

SELECT * FROM Salaries;

--4. Dept_manager table

CREATE TABLE Dept_manager(
	dept_no varchar(50),
	emp_no int,
	PRIMARY KEY(emp_no),
	FOREIGN KEY(emp_no) REFERENCES Employees(emp_no)		
);
select * from Dept_manager;

 --5.Department table
Create Table Departments(
	dept_no varchar(50) Not Null,
	dept_name varchar(50) Not Null,
	PRIMARY KEY(dept_no)
);
select * from Departments;



--6.Dept_emp table

CREATE TABLE Dept_emp (
	id SERIAL PRIMARY KEY,
    emp_no int NOT NULL,
    dept_no varchar(50) NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY(dept_no) REFERENCES Departments(dept_no)
);
	

SELECT * FROM Dept_emp;
Drop Table Dept_emp;

