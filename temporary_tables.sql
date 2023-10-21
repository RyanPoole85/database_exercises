-- 1. Using the example from the lesson, create a temporary table called 
-- employees_with_departments that contains first_name, last_name, and dept_name for 
-- employees currently with that department. Be absolutely sure to create this table on 
-- your own database. If you see "Access denied for user ...", it means that the query was
-- attempting to write a new table to a database that you can only read.
use ursula_2328;

create temporary table employees_with_departments
(
SELECT emp_no, first_name, last_name, dept_no, dept_name
	FROM employees.employees
	JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
where dept_emp.to_date >now()
);
-- a. Add a column named full_name to this table. It should be a VARCHAR whose length 
-- is the sum of the lengths of the first name and last name columns.
alter table employees_with_departments add full_name varchar(30);

-- b. Update the table so that the full_name column contains the correct data.
update employees_with_departments set full_name = CONCAT(first_name, ' ', last_name);

-- c. Remove the first_name and last_name columns from the table.
alter table employees_with_departments drop column first_name, drop column last_name;

-- d. What is another way you could have ended up with this same table? 
	-- You could drop the table, add the full_name column and 
	-- remove the other two columns and then re-run the create table query.

select * from employees_with_departments;
 
-- 2. Create a temporary table based on the payment table from the sakila database.
use sakila;
select * from payment;
use ursula_2328;

create temporary table sakila_payments 
	(
    select *
    from sakila.payment);
    
select * from sakila_payments;
-- Write the SQL necessary to transform the amount column such that it is stored as an
-- integer representing the number of cents of the payment. For example, 1.99 should become 199.

alter table sakila_payments modify amount float (10);
ALTER TABLE sakila_payments MODIFY amount int;
update sakila_payments set amount = amount * 100;


-- Go back to the employees database. Find out how the current average pay 
-- in each department compares to the overall current pay for everyone at the company.
-- For this comparison, you will calculate the z-score for each salary. 

create temporary table avg_current_pay(
SELECT dept_name, avg(salary) as d_salary
	FROM employees.employees
	JOIN employees.dept_emp USING(emp_no)
	JOIN employees.departments USING(dept_no)
    JOIN employees.salaries USING(emp_no)
where dept_emp.to_date >now()
and salaries.to_date >now()
group by dept_name);

create temporary table std (
select 
	avg(salary) as overall_avg
    ,std(salary) as overall_std
from employees.salaries as s
where to_date > now()
);
select * from std;
create temporary table avg_with_std (
select *
from avg_current_pay
join std
);
select * from std;

alter table avg_with_std add zscore float;
update avg_with_std set zscore = (d_salary - overall_avg) / overall_std;


 -- final table: avg_with_std
select * from avg_with_std;

drop table avg_with_std;
drop table avg_current_pay;

-- In terms of salary, what is the best department right now to work for? The worst?
select * from avg_with_std
order by zscore desc;
-- Best: sales
-- Worst: Human Resources


-- BONUS Determine the overall historic average department average salary, the historic
-- overall average, and the historic z-scores for salary. Do the z-scores for current 
-- department average salaries (from exercise 3) tell a similar or a different story 
-- than the historic department salary z-scores?

-- Hint: How should the SQL code used in exercise 3 be altered to instead use historic salary values?