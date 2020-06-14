--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
Select Employees.emp_no,Employees.last_name,Employees.first_name,Employees.sex,Salaries.salary
from Employees
JOIN Salaries
ON Employees.emp_no = Salaries.emp_no
  
  
--2. List first name, last name, and hire date for employees who were hired in 1986.
Select Employees.first_name,Employees.last_name,Employees.hire_date
from Employees
Where hire_date between '1986-01-01' and '1986-12-31'

--3.List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name.
Select Dept_emp.dept_no,Departments.dept_name,Employees.emp_no,Employees.last_name,Employees.first_name
From Dept_emp
Join Departments
On Dept_emp.dept_no = Departments.dept_no
Join Employees
On Employees.emp_no = Dept_emp.emp_no
Where emp_title_id in
(
	Select title_id 
	From Titles
	Where title Like 'Manager'
	);

--4. List the department of each employee with the following information: employee number, last name, 
--first name, and department name.

Select 	Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
From Employees
Join Dept_emp
on Employees.emp_no = Dept_emp.emp_no	
Join Departments
on Dept_emp.dept_no = Departments.dept_no

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
Select 	 Employees.first_name,Employees.last_name, Employees.sex
from Employees
Where first_name like 'Hercules' and last_name like 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
Select Employees.emp_no,Employees.last_name,Employees.first_name,Departments.dept_name
From Employees
Join Dept_emp
On Employees.emp_no = Dept_emp.emp_no
Join Departments
On Dept_emp.dept_no = Departments.dept_no
Where dept_name like 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
Select Employees.emp_no,Employees.last_name,Employees.first_name,Departments.dept_name
From Employees
Join Dept_emp
On Employees.emp_no = Dept_emp.emp_no
Join Departments
On Dept_emp.dept_no = Departments.dept_no
Where dept_name = 'Development' or dept_name = 'Sales';

--8. In descending order, list the freque
SELECT last_name, count(*) FROM Employees
GROUP BY last_name
ORDER BY count(*) DESC;

--9 .average salary by title
Create view title_salraries As
Select Employees.emp_no,Employees.emp_title_id,Salaries.salary,Titles.title
from Employees
JOIN Salaries
On Employees.emp_no = Salaries.emp_no
Join Titles
On Employees.emp_title_id= Titles. title_id
  
select * from title_salraries;
--new table for plot
Create view title_by_salraries As
SELECT title, AVG(salary)
FROM title_salraries
GROUP BY title;

select * from title_by_salraries;


  