-- 1. Write a query that returns all employees, their department number, 
-- their start date, their end date, and a new column 'is_current_employee' that 
-- is a 1 if the employee is still with the company and 0 if not. 
-- DO NOT WORRY ABOUT DUPLICATE EMPLOYEES.
use employees;
select concat(first_name,' ',last_name) as Employee_Name, 
	de.dept_no,
    de.from_date start_date, 
    de.to_date end_date,
	if(to_date >curdate(), True, False) as is_current_employee 
from employees
join dept_emp as de
using (emp_no)
;

-- 2. Write a query that returns all employee names (previous and current),
--  and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending 
--  on the first letter of their last name.
select first_name, last_name,-- concat(first_name,' ',last_name),
	case
		when left(last_name, 1) between 'A' and 'H' then 'A-H'
        when left(last_name, 1) between 'I' and 'Q' then 'I-Q'
        when left(last_name, 1) between 'R' and 'Z' then 'R-Z'
	end as alpha_group
from employees
order by alpha_group;

-- 3. How many employees (current or previous) were born in each decade?
select birth_date from employees;
select
	 case
	 when birth_date like '195%' then '50s'
     when birth_date like '196%' then '60s' 
	end as 'decades',
    count(*) 
	from employees
    group by decades;
    
-- '50s','182886'
-- '60s','117138'


-- 4. What is the current average salary for each of the following department 
-- groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?
select dept_name from departments;
select 
	Case
    when dept_name like 'Research' or dept_name like 'Development' then 'R&D' 
    when dept_name like 'Sales' or dept_name like 'Marketing' then 'Sales & Marketing'
    when dept_name like 'Production' or dept_name like 'Quality Management' then 'Prod & QM'
    when dept_name like 'Finance' or dept_name like 'Human Resources' then 'Finance & HR'
    when dept_name like 'Customer Service' then 'Customer Service'
end as 'Department_Groups', round(avg(salary),2) as 'Average Salary'
from salaries s
join dept_emp de
using (emp_no)
join departments d
using (dept_no)
where s.to_date >curdate() and de.to_date >curdate()
group by Department_Groups;

-- 'R&D','67709.26'
-- 'Sales & Marketing','86368.86'
-- 'Prod & QM','67328.50'
-- 'Finance & HR','71107.74'
-- 'Customer Service','67285.23'


-- BONUS

-- Remove duplicate employees from exercise 1.

select distinct concat(first_name,' ',last_name) as Employee_Name, emp_no,
	de.dept_no,
    de.from_date start_date, 
    de.to_date end_date,
	if(to_date >curdate(), True, False) as is_current_employee 
from employees
join dept_emp as de
using (emp_no)
;