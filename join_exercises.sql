-- Use the join_example_db. Select all the records from both the users and roles tables.
    
use join_example_db;
select * from roles;
select * from users;

-- Use join, left join, and right join to combine results from the users and 
-- roles tables as we did in the lesson. Before you run each query, 
-- guess the expected number of results.

SELECT 
*
FROM users
JOIN roles 
-- ON users.id = roles.id
using(id);

SELECT
	*
-- users.id, users.role_id, roles.name roles, users.name, users.email
FROM users
LEFT JOIN roles 
-- ON users.id = roles.id
using(id);

SELECT 
	*
-- users.id, users.role_id, roles.name roles, users.name, users.email
FROM users
RIGHT JOIN roles 
-- ON users.id = roles.id
using(id);

SELECT
* 
-- users.name AS user_name, roles.name AS role_name
FROM users
RIGHT JOIN roles 
ON users.role_id = roles.id;

-- Although not explicitly covered in the lesson, aggregate functions 
-- like count can be used with join queries. Use count and the appropriate 
-- join type to get a list of roles along with the number of users that have the role. 
-- Hint: You will also need to use group by in the query.
SELECT roles.name roles, count(*)
FROM users
left JOIN roles 
using (id)
group by roles;

-- Use the employees database.
use employees;
-- 2. Using the example in the Associative Table Joins section as a guide, 
-- write a query that shows each department along 
-- with the name of the current manager for that department.
    
select d.dept_name as department_name, concat(e.first_name, " ", e.last_name) as manager_name
from employees as e
join dept_manager as dm
using (emp_no)
-- on e.emp_no = dm.emp_no 
join departments as d
using (dept_no)
-- on d.dept_no = dm.dept_no
where dm.to_date = "9999-01-01"
order by department_name asc;

-- 3. Find the name of all departments currently managed by women.

select d.dept_name as department_name, 
concat(e.first_name, " ", e.last_name) as manager_name, e.gender
from employees as e
join dept_manager as dm
using (emp_no)
-- on e.emp_no = dm.emp_no 
join departments as d
using (dept_no)
-- on d.dept_no = dm.dept_no
where dm.to_date = "9999-01-01" and gender = 'f'
order by department_name asc;

-- 4. Find the current titles of employees currently working in the Customer Service department.
select t.title, count(*) as cnt
from employees as e
join dept_emp as de
-- on e.emp_no = de.emp_no 
using (emp_no)
join departments as d
using (dept_no)
-- on d.dept_no = dm.dept_no
join titles as t
using (emp_no)
where t.to_date = "9999-01-01" and dept_name = 'customer service'
group by t.title
order by t.title;

-- 5. Find the current salary of all current managers.
select d.dept_name as department_name, concat(e.first_name, " ", e.last_name) as manager_name, s.salary
from employees as e
join dept_manager as dm
using (emp_no)
join departments as d
using (dept_no)
join salaries as s
using (emp_no)
where dm.to_date = '9999-01-01' and s.to_date = '9999-01-01'
order by department_name asc;

-- 6. Find the number of current employees in each department.
select dept_no, d.dept_name as department_name, count(*) as num_employees
from employees as e
join dept_emp as de
using (emp_no)
join departments as d
using (dept_no)
where de.to_date = '9999-01-01'
group by department_name
order by dept_no;

-- 7. Which department has the highest average salary? 
-- Hint: Use current not historic information.
select d.dept_name, avg(salary) as average_salary
from salaries as s
join dept_emp as de
using (emp_no)
join departments as d
using (dept_no)
where s.to_date = '9999-01-01' and de.to_date = '9999-01-01'
group by d.dept_name
order by average_salary desc
limit 1;

-- 8. Who is the highest paid employee in the Marketing department?
select first_name, last_name
from employees as e
join salaries as s
using (emp_no)
join dept_emp as de
using (emp_no)
join departments as d
using (dept_no)
where s.to_date = '9999-01-01' and d.dept_name = 'marketing'
order by salary desc
limit 1;

-- 9. Which current department manager has the highest salary?
select first_name, last_name, salary, dept_name
from employees as e
join dept_manager as dm
using (emp_no)
join salaries as s
using (emp_no)
join departments as d
using (dept_no)
where dm.to_date = '9999-01-01' and s.to_date = '9999-01-01'
order by salary desc
limit 1;

-- 10. Determine the average salary for each department. 
-- Use all salary information and round your results.
select dept_name, round(avg(salary),0) as avg_salary
from departments as d
join dept_emp as de
using (dept_no)
join salaries as s
using (emp_no)
group by dept_name
order by avg_salary desc;

-- 11. Bonus Find the names of all current employees, their department 
-- name, and their current manager's name.
select concat(e.first_name,' ', e.last_name) as Employee, dept_name,
concat(e2.first_name,' ', e2.last_name) as Department_Manager
from employees as e
join dept_emp as de
using (emp_no)
join dept_manager as dm
using (emp_no)
join employees as e2
on dm.emp_no = e2.emp_no
join departments as d
using (dept_no)
where de.to_date = '9999-01-01' and dm.to_date = '9999-01-01';

