-- 1. Create a new file named group_by_exercises.sql

-- 2. In your script, use DISTINCT to find the unique titles 
-- in the titles table. How many unique titles have there ever been? 7
-- Answer that in a comment in your SQL file.
use titles;
describe titles;
select distinct title from titles;

-- 3. Write a query to find a list of all unique last names that start and 
-- end with 'E' using GROUP BY.
use employees;
select last_name from employees 
	group by last_name having last_name like 'e%e';

-- 4. Write a query to find all unique combinations of first and last names
-- of all employees whose last names start and end with 'E'.
select first_name, last_name from employees
	group by first_name, last_name having last_name like 'e%e';

-- 5. Write a query to find the unique last names with a 'q' but not 'qu'. 
-- Include those names in a comment in your sql code.
select last_name from employees
	group by last_name having last_name like '%q%' and last_name not like '%qu%';
-- 'Chleq'
-- 'Lindqvist'
-- 'Qiwen'

-- 6. Add a COUNT() to your results for exercise 5 to find the number of 
-- employees with the same last name.
select count(*) from employees
	group by last_name 
    having last_name like '%q%' 
    and last_name not like '%qu%';

-- 7. Find all employees with first names 'Irena', 'Vidya', or 'Maya'. 
-- Use COUNT(*) and GROUP BY to find the number of employees with those names for each gender.
select count(*), gender
	from employees
    where first_name in ('Irena', 'Vidya', 'Maya')
    group by gender;
-- 441 M
-- 268 F

-- 8. Using your query that generates a username for all employees, 
-- generate a count of employees with each unique username.
select lower(concat(substr(first_name,1,1),
	substr(last_name,1,4),'_',
    substr(birth_date,6,2),
    substr(birth_date,3,2))) as username,
    count(*) as duplicate_count from employees
    GROUP BY username
    HAVING (duplicate_count = 1);

-- 9. From your previous query, are there any duplicate usernames? Yes
-- What is the highest number of times a username shows up? 6 times
-- Bonus: How many duplicate usernames are there?
select lower(concat(substr(first_name,1,1),
	substr(last_name,1,4),'_',
    substr(birth_date,6,2),
    substr(birth_date,3,2))) as username,
    count(*) as duplicate_count from employees
    GROUP BY username
    HAVING (duplicate_count > 1)
    order by duplicate_count desc;


-- Bonus Exercises:

-- Determine the historic average salary for each employee. When you hear, read, 
-- or think "for each" with regard to SQL, you'll probably be grouping by that exact column.
describe salaries;
select emp_no,avg(salary) from salaries
group by emp_no;

-- Using the dept_emp table, count how many current employees work in each department. 
-- The query result should show 9 rows, one for each department and the employee count.
describe dept_emp;

select dept_no, count(*) dept_employees
	from dept_emp
    where to_date = '9999-01-01'
    group by dept_no;

-- 'd001','14842'
-- 'd002','12437'
-- 'd003','12898'
-- 'd004','53304'
-- 'd005','61386'
-- 'd006','14546'
-- 'd007','37701'
-- 'd008','15441'
-- 'd009','17569'

-- Determine how many different salaries each employee has had. 
-- This includes both historic and current.
select emp_no, count(*) diff_salaries from salaries
	group by emp_no;

-- Find the maximum salary for each employee.
select emp_no, max(salary) from salaries
	group by emp_no;

-- Find the minimum salary for each employee.
select emp_no, min(salary) from salaries
	group by emp_no;
-- Find the standard deviation of salaries for each employee.
select emp_no, STDDEV(salary) salary_dispersion from salaries
	group by emp_no;

-- Find the max salary for each employee where that max salary is greater than $150,000.
select emp_no, max(salary) from salaries
	where salary > '150000'
    group by emp_no;

-- Find the average salary for each employee where that average salary 
-- is between $80k and $90k.
select emp_no, avg(salary) from salaries
	where salary between 80000 and 90000
    group by emp_no;