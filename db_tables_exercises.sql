-- List all the databases
show databases;
-- Write the SQL code necessary to use the albums_db database
use albums_db;
-- show the currently selected database
select database();
-- List all tables in the database
show tables;
-- Write the SQL code to switch to the employees database
use employees;
-- Show the currently selected database
select database();
-- List all tables in the database
show tables;
-- Explore the employees table. What different data types are present in this table? int, date, varchar(14), varchar(16), enum('M','F')
describe employees;
-- Which table(s) do you think contain a numeric type column? Salaries; dept_emp; titles, employees, dept_manager.
show tables;
describe departments;
describe dept_emp;
describe dept_manager;
-- Which table(s) do you think contain a string type column? employees, titles
-- Which table(s) do you think contain a date type column? dept_emp, dept_manager, employees, salaries, titles
-- What is the relationship between the employees and the departments tables? The emp_no and dept_no are linked by a third table (dept_emp)
describe employees; describe dept_emp;
-- Show the SQL code that created the dept_manager table. Write the SQL it takes to show this as your exercise solution.
show create table dept_manager;