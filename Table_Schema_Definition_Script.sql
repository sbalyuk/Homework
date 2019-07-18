create table departments(
	dept_no char(4)not null,
	dept_name varchar(50)not null,
	Primary Key(dept_no),
	Unique (dept_name)
); 

create table employees( 
	emp_no integer not null,
	birth_date date not null,
	first_name varchar(30)not null,
	last_name varchar(30)not null,
	gender char(1)not null,
	hire_date date not null,
	Primary Key(emp_no)
);
create table dept_emp(
	emp_no int not null,
	dept_no char(4)not null,
	from_date date not null,
	to_date date not null,
	Primary Key(emp_no,dept_no),
	Foreign Key(emp_no)references employees(emp_no) on delete cascade,
	Foreign Key(dept_no)references departments(dept_no)on delete cascade
);
create table dept_manager(
	dept_no char(4)not null,
	emp_no integer not null,
	from_date date not null,
	to_date date not null,
	Primary Key(emp_no,dept_no),
	Foreign Key(emp_no)references employees(emp_no) on delete cascade,
	Foreign Key(dept_no)references departments(dept_no) on delete cascade
);

create table salaries(
	emp_no int not null,
	salary int not null,
	from_date date not null,
	to_date date not null,
	Primary Key(emp_no,from_date),
	Foreign Key(emp_no)references employees(emp_no)on delete cascade
);

create table titles(
	emp_no int not null,
	title varchar(50) not null,
	from_date date not null,
	to_date date not null,
	Primary Key(emp_no,title,from_date),
	Foreign Key(emp_no)references employees(emp_no)on delete cascade
);



	
	
