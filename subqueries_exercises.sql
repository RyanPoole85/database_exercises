-- 1. Find all the current employees with the same hire date as employee 101010 using a subquery.
use employees;
select concat(first_name,' ',last_name) Name, hire_date 
	from employees
    JOIN dept_emp as de
    USING (EMP_NO)
    where hire_date = (select hire_date from employees where emp_no = '101010')
    and de.to_date > now()
        ;
	-- 55 rows returned
    
-- 2. Find all the titles ever held by all current employees with the first name Aamod.

Select distinct t.title
	from titles as t
    join employees as e
    using (emp_no)
    where e.emp_no in
    (
    select emp_no 
	from employees 
	where e.first_name = 'Aamod' and t.to_date > curdate())
    ;
-- 6 rows returned

-- 3. How many people in the employees table are no longer working for the company?
 
select count(*) 
	from employees 
	where emp_no not in ( 
select emp_no from dept_emp where to_date > curdate());

-- Give the answer in a comment in your code. 59900

-- 4. Find all the current department managers that are female. List their names in a comment 
-- in your code.
select concat(first_name,' ',last_name) as Managers
from employees
	where emp_no in (
select emp_no
	from dept_manager
    where to_date > curdate() and gender = 'f') ;
-- 'Isamu Legleitner'
-- 'Karsten Sigstam'
-- 'Leon DasSarma'
-- 'Hilary Kambil'


-- 5. Find all the employees who currently have a higher salary than the companie's overall, 
-- historical average salary.
use employees;
select count(*) -- concat(first_name,' ',last_name) as Name 
	from employees
    join salaries as s
    using (emp_no) 
    where s.to_date > curdate()
		and s.salary > 
		(select round(avg(salary),2)
	from salaries);
-- 154543

select count(*) from salaries where to_date > curdate();
-- 6. How many current salaries are within 1 standard 
--    deviation of the current highest salary? 83
-- (Hint: you can use a built-in function to calculate the standard deviation.) 
-- What percentage of all salaries is this? 0.0346%
select count(*)
from salaries
where salary >
(select max(salary) - STD(salary) from salaries where to_date > curdate())
and to_date > curdate();

-- Percent
select (select count(*)
from salaries
where salary >
(select max(salary) - STD(salary) 
from salaries 
where to_date > curdate())
and to_date > curdate()) / (select count(*) 
	from salaries 
    where to_date > curdate()) * 100 as percent 
    from salaries
limit 1;


-- Hint You will likely use multiple subqueries in a variety of ways
-- Hint It's a good practice to write out all of the small queries that you can.
--  Add a comment above the query showing the number of rows returned. 
--  You will use this number (or the query that produced it) in other, larger queries.
-- BONUS

-- Find all the department names that currently have female managers.
select dept_name
	from departments as d
    join dept_manager as dm
    using (dept_no)
    join employees as e
    using (emp_no)
    where e.last_name in( select concat(first_name,' ',last_name) as Managers
from employees
	where emp_no in (
select emp_no
	from dept_manager
    where to_date > curdate() and gender = 'f'));
    

-- Find the first and last name of the employee with the highest salary.
-- Find the department name that the employee with the highest salary works in.

-- Who is the highest paid employee within each department.