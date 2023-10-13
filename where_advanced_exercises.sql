-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. What is the employee number of the top three results? 
-- '10200','Vidya','Awdeh'
-- '10397','Irena','Reutenauer'
-- '10610','Irena','Roccetti'
use employees;
show tables;
describe employees;
select emp_no, first_name, last_name 
from employees where first_name in ('Irena', 'Vidya', 'Maya');
-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. What is the employee number of the top three results?
-- '10200','Vidya','Awdeh'
-- '10397','Irena','Reutenauer'
-- '10610','Irena','Roccetti'
-- Does it match the previous question? Yes
select emp_no, first_name, last_name 
from employees where first_name 
= ('Irena') or first_name = ('Vidya') or first_name = ('Maya');
-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. What is the employee number of the top three results?
-- '10200','Vidya','Awdeh'
-- '10397','Irena','Reutenauer'
-- '10821','Irena','Schurmann'
select emp_no, first_name, last_name, gender
from employees where (first_name 
= 'Irena' or first_name = 'Vidya' or first_name = 'Maya') and gender = 'M';
-- Find all unique last names that start with 'E'.
select last_name from employees where last_name like 'E%';
-- Find all unique last names that start or end with 'E'.
select last_name from employees where last_name like 'E%' or last_name like '%E';
-- Find all unique last names that end with E, but does not start with E?
select last_name from employees where last_name like '%E' and last_name not like 'E%';
-- Find all unique last names that start and end with 'E'.
select last_name from employees where last_name like 'E%' and last_name like '%E';
select hire_date from employees;
-- Find all current or previous employees hired in the 90s. Enter a comment with the top three employee numbers.
-- '10008','Saniya','Kalloufi','1994-09-15'
-- '10011','Mary','Sluis','1990-01-22'
-- '10012','Patricio','Bridgland','1992-12-18'
select emp_no, first_name, last_name, hire_date 
from employees where hire_date like '199%';
-- Find all current or previous employees born on Christmas. Enter a comment with the top three employee numbers.
-- '10050','Yinghua','Dredge','1990-12-25'
-- '10456','Stepehn','Hardjono','1995-12-25'
-- '10463','Ung','Zaiane','1987-12-25'
select emp_no, first_name, last_name, hire_date 
from employees where hire_date like '%-12-25';
-- Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the top three employee numbers.
-- '10050','Yinghua','Dredge','1990-12-25'
-- '10456','Stepehn','Hardjono','1995-12-25'
-- '10517','Tiina','Speek','1990-12-25'
select emp_no, first_name, last_name, hire_date 
from employees where hire_date like '199%' and hire_date like '%-12-25';
-- Find all unique last names that have a 'q' in their last name.
select last_name from employees where last_name like '%q%';
-- Find all unique last names that have a 'q' in their last name but not 'qu'.
select last_name from employees where last_name like '%q%' and last_name not like '%qu%';