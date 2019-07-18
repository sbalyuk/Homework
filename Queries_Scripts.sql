
--1.List the following details of each employee: 
--employee number, last name, first name, gender, and salary.
--solution 1 by using join construction:

select e.emp_no,e.last_name,e.first_name,e.gender,s.salary
from employees as e inner join salaries as s
on e.emp_no = s.emp_no;


--solution 2 by using subquery construction:

select e.emp_no,e.last_name,e.first_name,e.gender,(
	 select salary from salaries 
where emp_no = e.emp_no)
as salary 
from employees e;


--2.List employees who were hired in 1986.
--method 1: by using between operator:

select * from employees
where hire_date between '19860101' and '19861231';

--method 2: by using extract() function

select * from employees
where extract(year from hire_date)='1986';

--3.List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name,
--first name, and start and end employment dates.

select dm.dept_no,d.dept_name,dm.emp_no,e.last_name,e.first_name,dm.from_date,dm.to_date
from dept_manager as dm
inner join departments as d
on dm.dept_no = d.dept_no
inner join employees as e
on dm.emp_no = e.emp_no;

--4. List the department of each employee with the following information:
--employee number, last name, first name, and department name.


select e.emp_no,e.first_name,e.last_name,d.dept_name
from employees as e
inner join dept_emp as de
on e.emp_no = de.emp_no
inner join departments as d
on de.dept_no = d.dept_no;


--5. List all employees whose first name is "Hercules" and last names begin with "B".

select * from employees
where first_name='Hercules' and last_name like 'B%';


--6. List all employees in the Sales department, including their employee number, last name, first name,
--and department name.

select e.emp_no,e.last_name,e.first_name,d.dept_name
from employees as e
inner join dept_emp as de
on e.emp_no = de.emp_no
inner join departments as d
on de.dept_no = d.dept_no
where d.dept_name = 'Sales';



--7. List all employees in the Sales and Development departments, including their employee number, last name,
--first name, and department name.

select e.emp_no,e.last_name,e.first_name,d.dept_name
from employees as e
inner join dept_emp as de
on e.emp_no = de.emp_no
inner join departments d
on de.dept_no = d.dept_no
where d.dept_name = 'Sales' or d.dept_name = 'Development';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select last_name,count(*)as empl_count_by_last_name
from employees
group by last_name
order by empl_count_by_last_name desc;



























