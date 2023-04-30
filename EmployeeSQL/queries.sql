
CREATE TABLE "departments" (
    "dept_no" varchar   NOT NULL,
    "dept_name" varchar   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "titles" (
    "title_id" varchar   NOT NULL,
    "title" varchar   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "employees" (
    "emp_no" int   NOT NULL,
    "emp_title_id" varchar   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "sex" varchar   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" int   NOT NULL,
    "dept_no" varchar   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

CREATE TABLE "dept_manager" (
    "dept_no" varchar   NOT NULL,
    "emp_no" int   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "dept_no","emp_no"
     )
);



--List the employee number, last name, first name, sex, and salary of each employee.
select e.emp_no, last_name, first_name, sex, salary
from employees e
inner join salaries s
on e.emp_no = s.emp_no

--List the first name, last name, and hire date for the employees who were hired in 1986
select first_name, last_name, hire_date
from employees
where extract (year from hire_date)= 1986;



--List the manager of each department along with their department number, department name, 
--employee number, last name, and first name.
select dm.dept_no, dm.emp_no, d.dept_name, last_name, first_name
from dept_manager dm
inner join departments d
on dm.dept_no = d.dept_no
inner join employees e
on dm.emp_no = e.emp_no


--List the department number for each employee along with that employee’s employee number, 
--last name, first name, and department name.
select de.dept_no, e.emp_no, last_name, first_name, d.dept_name
from dept_emp de
inner join employees e
on e.emp_no = de.emp_no
inner join departments d
on d.dept_no = de.dept_no


--List first name, last name, and sex of each employee whose 
--first name is Hercules and whose last name begins with the letter B.
select first_name, last_name, sex
from employees
where first_name ='Hercules' and last_name like 'B%'


--List each employee in the Sales department, including their employee number, last name, and first name.
select e.emp_no, last_name, first_name, d.dept_name
from employees e
inner join dept_emp de
on e.emp_no = de.emp_no
inner join departments d
on de.dept_no = d.dept_no 
where dept_name = 'Sales'


--List each employee in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.
select e.emp_no, last_name, first_name, d.dept_name
from employees e
inner join dept_emp de
on e.emp_no = de.emp_no
inner join departments d
on de.dept_no = d.dept_no 
where dept_name in ('Sales', 'Development')

--List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name).
select last_name, count (last_name) as frequency_counts
from employees
group by last_name
order by frequency_counts desc
