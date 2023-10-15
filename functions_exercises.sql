-- 2. Write a query to find all employees whose last name starts and ends with 'E'. 
-- Use concat() to combine their first and last name together as a single column 
-- named full_name.
use employees;
show tables;
select concat(first_name, ' ',last_name) as full_name 
from employees
where last_name like ('e%e');

-- 3. Convert the names produced in your last query to all uppercase.
select upper(concat(first_name, ' ',last_name)) as uppercase_full_name 
from employees
where last_name like ('e%e');

-- 4. Use a function to determine how many results were returned from your previous query.
select count(upper(concat(first_name, ' ',last_name))) as names_count 
from employees
where last_name like ('e%e');

-- 5. Find all employees hired in the 90s and born on Christmas. Use datediff() 
-- function to find how many days they have been working at the company 
-- (Hint: You will also need to use NOW() or CURDATE()),
select birth_date, 
concat(first_name, ' ', last_name) as full_name,
datediff(curdate(), hire_date) as days_employed
from employees where birth_date like '%12-25'
and year(hire_date) like '199%';

-- 6. Find the smallest and largest current salary from the salaries table.
describe salaries;
select min(salary) as lowest_salary, max(salary) as highest_salary from salaries;
-- Lowest salary: 38623
-- Highest salary: 158220

-- 7. Use your knowledge of built in SQL functions to generate a 
-- username for all of the employees. A username should be all lowercase,
--  and consist of the first character of the employees first name, the first 
--  4 characters of the employees last name, an underscore, the month the employee 
--  was born, and the last two digits of the year that they were born. 
select lower(concat(substr(first_name, 1,1),
substr(last_name,1, 4),
'_',
substr(birth_date,6,2),
substr(birth_date,3,2))) 
as username, first_name, last_name 
from employees;