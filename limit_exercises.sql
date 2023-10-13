use employees;
-- 2. List the first 10 distinct last names sorted in descending order.
select distinct last_name from employees
order by last_name desc
limit 10;  
-- 'Zykh'
-- 'Zyda'
-- 'Zwicker'
-- 'Zweizig'
-- 'Zumaque'
-- 'Zultner'
-- 'Zucker'
-- 'Zuberek'
-- 'Zschoche'
-- 'Zongker'
-- 3. Find all previous or current employees hired in the 90s and born on Christmas. 
-- Find the first 5 employees hired in the 90's by sorting by hire date 
-- and limiting your results to the first 5 records. 
-- Write a comment in your code that lists the five names of the employees returned.
select first_name, last_name, hire_date, birth_date 
from employees where hire_date like '199%' and birth_date like '%-12-25'
order by hire_date asc
limit 5;
-- 'Alselm','Cappello','1990-01-01','1962-12-25'
-- 'Utz','Mandell','1990-01-03','1960-12-25'
-- 'Bouchung','Schreiter','1990-01-04','1963-12-25'
-- 'Baocai','Kushner','1990-01-05','1959-12-25'
-- 'Petter','Stroustrup','1990-01-10','1959-12-25'

-- 3. Update the query to find the tenth page of results.
-- What is the relationship between OFFSET (number of results to skip),
-- LIMIT (number of results per page), and the page number? All number 5
select first_name, last_name from employees
limit 5
offset 45;
-- 'Lucien','Rosenbaum'
-- 'Zvonko','Nyanchama'
-- 'Florian','Syrotiuk'
-- 'Basil','Tramer'
-- 'Yinghua','Dredge'
