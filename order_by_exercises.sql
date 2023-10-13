-- 2. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. 
-- and order your results returned by first name. 
-- What was the first and last name in the first 
-- row of the results?  
-- 'Irena','Reutenauer'
--  What was the first and last name of the last person in the table?
-- 'Vidya Simmen'
use employees;
show tables;
describe employees;
select emp_no, first_name, last_name 
from employees where first_name in ('Irena', 'Vidya', 'Maya')
order by first_name;
-- 3. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. 
-- and order your results returned by first name and then last name. 
-- What was the first and last name in the first row of the results? Irena Acton
-- What was the first and last name of the last person in the table? Vidya Zweizig
select emp_no, first_name, last_name 
from employees where first_name 
= ('Irena') or first_name = ('Vidya') or first_name = ('Maya')
order by first_name, last_name;
-- 4. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male.
-- and order your results returned by last name and then first name.
-- What was the first and last name in the first row of the results? Irena Acton
-- What was the first and last name of the last person in the table? Maya Zyda
select emp_no, last_name, first_name, gender 
from employees where (first_name
= 'Irena' or first_name = 'Vidya' or first_name = 'Maya') and gender = 'M'
order by last_name, first_name;
-- 5. Find all unique last names that start and end with 'E'.
-- Sort the results by their employee number.
-- Enter a comment with the number of employees returned: 899
-- the first employee number: 10021
-- and their first and last name: Ramzi Erde
-- and the last employee number with their first and last name: 499648 Tadahiro Erde
select emp_no, first_name, last_name from employees 
where last_name like 'E%' and last_name like '%E'
order by emp_no;
-- 6. Find all employees whose last name starts and ends with 'E'
-- Sort the results by their hire date, so that the newest employees are listed first. 
-- Enter a comment with the number of employees returned: 899
-- the name of the newest employee: Teiji Eldridge
-- and the name of the oldest employee: Sergi Erde
select last_name, first_name, hire_date from employees 
where last_name like 'E%E'
order by hire_date desc;
-- 7. Find all current or previous employees hired in the 90s and born on Christmas.
-- Sort the results so that the oldest employee who was hired last is the first result. 
-- Enter a comment with the number of employees returned:362
-- the name of the oldest employee who was hired last: Khun Bernini
-- and the name of the youngest employee who was hired first: Alseim Cappello
select first_name, last_name, hire_date, birth_date 
from employees where hire_date like '199%' and birth_date like '%-12-25'
order by hire_date desc, birth_date asc;
