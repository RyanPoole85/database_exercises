-- More Drills With The Sakila Database
use sakila;
show tables;
-- SELECT statements

-- Select all columns from the actor table.
select * from actor;
-- Select only the last_name column from the actor table.
select last_name from actor;
-- Select only the film_id, title, and release_year columns from the film table.
select film_id, title, release_year from film;
-- DISTINCT operator

-- Select all distinct (different) last names from the actor table.
select distinct last_name from actor;
-- Select all distinct (different) postal codes from the address table.
select distinct postal_code from address;
-- Select all distinct (different) ratings from the film table.
select distinct rating from film;
-- WHERE clause
select length from film;
-- Select the title, description, rating, and movie length columns from the 
-- films table that last 3 hours or longer.
select title, description, rating, length 
	from film
    where length >= 180;
select payment_date from payment;
-- Select the payment id, amount, and payment date columns from the payments 
-- table for payments made on or after 05/27/2005.
select payment_id, amount, payment_date 
	from payment
    where payment_date >= '2005-05-27';
select * from payment;
-- Select the primary key, amount, and payment date columns from the payment 
-- table for payments made on 05/27/2005.
describe payment;
select payment_id, amount, payment_date 
	from payment
    where payment_date = '2005-05-27';

-- Select all columns from the customer table for rows that have last names 
-- beginning with "S" and first names ending with "N".
select * from customer
	where last_name like 'S%' and first_name like '%N';

-- Select all columns from the customer table for rows where the customer is 
-- inactive or has a last name beginning with "M".
select * from customer
	where active = 0 and last_name like 'M%';
    
select active from customer;
-- Select all columns from the category table for rows where the primary key is
--  greater than 4 and the name field begins with either "C", "S" or "T".
select * from category
	where category_id > 4 and name like 'c%' or name like 's%' or name like 't%';
    
-- Select all columns minus the password column from the staff table for rows that 
-- contain a password.
select * from staff
	where password is not null;

-- Select all columns minus the password column from the staff table for rows that 
-- do not contain a password.
select * from staff
	where password is null;

-- IN operator
select address from address;
select district from address;
-- Select the phone and district columns from the address table for addresses in 
-- California, England, Taipei, or West Java.
select phone, district
	from address
	where district in ('California', 'England', 'Taipei', 'West Java');
select payment_date from payment;
-- Select the payment id, amount, and payment date columns from the payment table for
-- payments made on 05/25/2005, 05/27/2005, and 05/29/2005. (Use the IN operator and
-- the DATE function, instead of the AND operator as in previous exercises.)
select payment_id, amount, payment_date
	from payment
    where payment_date like '2005-05-25%' 
    or payment_date like '2005-05-27%'
   or payment_date like '2005-05-29%';

-- Select all columns from the film table for films rated G, PG-13 or NC-17.
select * from film
	where rating in ('G', 'PG-13','NC-17'); 
    
select rating from film;
-- BETWEEN operator

-- Select all columns from the payment table for payments made between midnight
--  05/25/2005 and 1 second before midnight 05/26/2005.
select * from payment
 where payment_date between '2005-05-25 00:00:00' and '2005-05-26 23:59:59';

-- Select the film_id, title, and description columns from the film table for 
-- films where the length of the description is between 100 and 120.
select film_id, title, description 
	from film
    where length between '100' and '120'
    
;
select description from film;
select length from film;
-- LIKE operator

-- Select the following columns from the film table for rows where the description
-- begins with "A Thoughtful".
--  
-- Select the following columns from the film table for rows where the 
-- description ends with the word "Boat".

-- Select the following columns from the film table where the 
-- description contains the word "Database" and the length of 
-- the film is greater than 3 hours.

-- LIMIT Operator

-- Select all columns from the payment table and only include the first 20 rows.

-- Select the payment date and amount columns from the payment table for rows where 
-- the payment amount is greater than 5, and only select rows whose zero-based index 
-- in the result set is between 1000-2000.

-- Select all columns from the customer table, limiting results to those where 
-- the zero-based index is between 101-200.

-- ORDER BY statement

-- Select all columns from the film table and order rows by the length 
-- field in ascending order.

-- Select all distinct ratings from the film table ordered by rating in 
-- descending order.

-- Select the payment date and amount columns from the payment table for 
-- the first 20 payments ordered by payment amount in descending order.

-- Select the title, description, special features, length, and rental duration columns 
-- from the film table for the first 10 films with behind the scenes footage under 2 hours
--  in length and a rental duration between 5 and 7 days, ordered by length in descending
--  order.
--  
-- JOINs

-- Select customer first_name/last_name and actor first_name/last_name columns from 
-- performing a left join between the customer and actor column on the last_name 
-- column in each table. (i.e. customer.last_name = actor.last_name)

-- Label customer first_name/last_name columns as customer_first_name/customer_last_name

-- Label actor first_name/last_name columns in a similar fashion.

-- returns correct number of records: 620

-- Select the customer first_name/last_name and actor first_name/last_name
--  columns from performing a right join between the customer and actor column on 
--  the last_name column in each table. (i.e. customer.last_name = actor.last_name)
-- returns correct number of records: 200

-- Select the customer first_name/last_name and actor first_name/last_name 
-- columns from performing an inner join between the customer and actor column
--  on the last_name column in each table. (i.e. customer.last_name = actor.last_name)
-- returns correct number of records: 43

-- Select the city name and country name columns from the city table,
--  performing a left join with the country table to get the country name column.
-- Returns correct records: 600

-- Select the title, description, release year, and language name columns 
-- from the film table, performing a left join with the language table to get 
-- the "language" column.
-- Label the language.name column as "language"
-- Returns 1000 rows

-- Select the first_name, last_name, address, address2, city name, 
-- district, and postal code columns from the staff table, performing 
-- 2 left joins with the address table then the city table to get the 
-- address and city related columns.
-- returns correct number of rows: 2

-- Display the first and last names in all lowercase of all the actors.

-- You need to find the ID number, first name, and last name of an actor, of 
-- whom you know only the first name, "Joe." What is one query would you use 
-- to obtain this information?

-- Find all actors whose last name contain the letters "gen":

-- Find all actors whose last names contain the letters "li". 
-- This time, order the rows by last name and first name, in that order.

-- Using IN, display the country_id and country columns for the following countries: 
-- Afghanistan, Bangladesh, and China.

-- List the last names of all the actors, as well as how many actors have that last name.

-- List last names of actors and the number of actors who have that last name, 
-- but only for names that are shared by at least two actors

-- You cannot locate the schema of the address table. Which query would you use to recreate it?

-- Use JOIN to display the first and last names, as well as the address, of each staff member.

-- Use JOIN to display the total amount rung up by each staff member in August of 2005.

-- List each film and the number of actors who are listed for that film.

-- How many copies of the film Hunchback Impossible exist in the inventory system?
-- The music of Queen and Kris Kristofferson have seen an unlikely resurgence. 
-- As an unintended consequence, films starting with the letters K and Q have also 
-- soared in popularity. Use subqueries to display the titles of movies starting with 
-- the letters K and Q whose language is English.

-- Use subqueries to display all actors who appear in the film Alone Trip.
-- You want to run an email marketing campaign in Canada, for which you will need the 
-- names and email addresses of all Canadian customers.
-- Sales have been lagging among young families, and you wish to target all family 
-- movies for a promotion. Identify all movies categorized as family films.
-- Write a query to display how much business, in dollars, each store brought in.

-- Write a query to display for each store the store ID, city, and country.
-- List the top five genres in gross revenue in descending order. 
-- (Hint: you may need to use the following tables: category, 
-- film_category, inventory, payment, and rental.)