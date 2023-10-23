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
select description from film
	where description like 'A Thoughtful%';
--  
-- Select the following columns from the film table for rows where the 
-- description ends with the word "Boat".
select title, description from film
	where description like '%Boat';

-- Select the following columns from the film table where the 
-- description contains the word "Database" and the length of 
-- the film is greater than 3 hours.
select title, description, length from film
	where description like '%Database%'
    and length > 180;
-- LIMIT Operator

-- Select all columns from the payment table and only include the first 20 rows.
select * from payment
limit 20;
-- Select the payment date and amount columns from the payment table for rows where 
-- the payment amount is greater than 5, and only select rows whose zero-based index 
-- in the result set is between 1000-2000.
select payment_date, amount from payment
	where amount > 5
    limit 1000 offset 999;

-- Select all columns from the customer table, limiting results to those where 
-- the zero-based index is between 101-200.
select * from customer
	limit 100 offset 100;

-- ORDER BY statement

-- Select all columns from the film table and order rows by the length 
-- field in ascending order.
select * from film
	order by length;

-- Select all distinct ratings from the film table ordered by rating in 
-- descending order.
select distinct rating from film
	order by rating desc;
-- Select the payment date and amount columns from the payment table for 
-- the first 20 payments ordered by payment amount in descending order.
select payment_date, amount from payment
	order by amount desc
    limit 20;

-- Select the title, description, special features, length, and rental duration columns 
-- from the film table for the first 10 films with behind the scenes footage under 2 hours
--  in length and a rental duration between 5 and 7 days, ordered by length in descending
--  order.
select title, description, special_features, length, rental_duration from film
	where special_features in ('Behind the Scenes')
		and length < 120
        and rental_duration between 5 and 7
	order by length desc
    limit 10;
    
select special_features, length from film;
select length from film;
select rental_duration from film;

-- JOINs

-- Select customer first_name/last_name and actor first_name/last_name columns from 
-- performing a left join between the customer and actor column on the last_name 
-- column in each table. (i.e. customer.last_name = actor.last_name)

-- Label customer first_name/last_name columns as customer_first_name/customer_last_name

-- Label actor first_name/last_name columns in a similar fashion.

-- returns correct number of records: 620
select c.first_name customer_first_name, 
	c.last_name customer_last_name, 
    a.first_name actor_first_name, 
    a.last_name actor_last_name from customer c
	left join actor a
    using (last_name);

-- Select the customer first_name/last_name and actor first_name/last_name
--  columns from performing a right join between the customer and actor column on 
--  the last_name column in each table. (i.e. customer.last_name = actor.last_name)
-- returns correct number of records: 200
select c.first_name customer_first_name, 
c.last_name customer_last_name, 
a.first_name actor_first_name,
a.last_name actor_last_name from customer c
right join actor a
using (last_name);

-- Select the customer first_name/last_name and actor first_name/last_name 
-- columns from performing an inner join between the customer and actor column
--  on the last_name column in each table. (i.e. customer.last_name = actor.last_name)
-- returns correct number of records: 43
select c.first_name customer_first_name, 
c.last_name customer_last_name, 
a.first_name actor_first_name,
a.last_name actor_last_name from customer c
join actor a
using (last_name);

-- Select the city name and country name columns from the city table,
--  performing a left join with the country table to get the country name column.
-- Returns correct records: 600
select city, country from city
	right join country using (country_id);

-- Select the title, description, release year, and language name columns 
-- from the film table, performing a left join with the language table to get 
-- the "language" column.
-- Label the language.name column as "language"
-- Returns 1000 rows
select title, description, release_year, name language from film
	left join language
    using (language_id);

-- Select the first_name, last_name, address, address2, city name, 
-- district, and postal code columns from the staff table, performing 
-- 2 left joins with the address table then the city table to get the 
-- address and city related columns.
-- returns correct number of rows: 2
select first_name, 
	last_name, 
    address, 
    address2, 
    city, 
    district,
    postal_code from staff s
    left join address a
    using (address_id)
    left join city c
	using (city_id);


select city_id from city;

-- Display the first and last names in all lowercase of all the actors.
select lower(concat(first_name,' ', last_name)), actor_id
from actor;
-- You need to find the ID number, first name, and last name of an actor, of 
-- whom you know only the first name, "Joe." What is one query would you use 
-- to obtain this information?
select lower(first_name), lower(last_name), actor_id
from actor
where first_name like 'Joe%';

-- Find all actors whose last name contain the letters "gen":
select lower(first_name), lower(last_name), actor_id
from actor
where last_name like '%gen%';
-- Find all actors whose last names contain the letters "li". 
-- This time, order the rows by last name and first name, in that order.
select lower(first_name)first_name, lower(last_name) last_name, actor_id
from actor
where last_name like '%li%'
order by last_name, first_name;

-- Using IN, display the country_id and country columns for the following countries: 
-- Afghanistan, Bangladesh, and China.
select country_id, country from country
	where country in ('Afghanistan','Bangladesh','China');

-- List the last names of all the actors, as well as how many actors have that last name.
select count(*) cnt,last_name from actor
	group by last_name;

-- List last names of actors and the number of actors who have that last name, 
-- but only for names that are shared by at least two actors
select last_name, count(*) cnt from actor
    group by last_name having cnt >=2;

-- You cannot locate the schema of the address table. Which query would you use to recreate it?
describe address;
-- Use JOIN to display the first and last names, as well as the address, of each staff member.
select concat(first_name,' ',last_name) full_name, a.address from staff
	join address a
    using (address_id);

-- Use JOIN to display the total amount rung up by each staff member in August of 2005.
select * from payment;
select concat(first_name,' ',last_name) full_name, sum(p.amount) from staff
	join payment p
    using (staff_id)
    where p.payment_date like ('2005-08%')
    group by full_name;

-- List each film and the number of actors who are listed for that film.
select title, count(*) cnt from film
	join film_actor
    using (film_id)
    group by title;
    
-- How many copies of the film Hunchback Impossible exist in the inventory system?
select title, count(*) cnt from film
	join inventory i
    using (film_id)
    group by title having title = 'Hunchback Impossible'
    ;
    
-- The music of Queen and Kris Kristofferson have seen an unlikely resurgence. 
-- As an unintended consequence, films starting with the letters K and Q have also 
-- soared in popularity. Use subqueries to display the titles of movies starting with 
-- the letters K and Q whose language is English.
(select name from language
	where name in ('English'));

select title, l.name from film
	join language l using (language_id)
	where title like 'k%'or title like 'Q%'
    and l.name in (select name from language
	where name in ('English'));


-- Use subqueries to display all actors who appear in the film Alone Trip.
select concat(first_name,' ',last_name) Actor_name, f.title from actor
	join film_actor fa
    using (actor_id)
    join film f
    using (film_id)
    where f.title in 
		(select f.title from film
        where f.title = 'Alone Trip');
        
-- You want to run an email marketing campaign in Canada, for which you will need the 
-- names and email addresses of all Canadian customers.
select concat(first_name,' ',last_name) customer_name, email, country from customer
	join address a
    using (address_id)
    join city c
    using (city_id)
    join country co
    using (country_id)
    -- group by customer_name having
	where country = 'Canada';

-- Sales have been lagging among young families, and you wish to target all family 
-- movies for a promotion. Identify all movies categorized as family films.
select title, c.name from film
	join film_category
    using (film_id)
    join category c
    using (category_id)
    where c.name = 'family';

-- Write a query to display how much business, in dollars, each store brought in.
select * from payment;
select * from inventory;
select s.store_id store, sum(amount) from payment
	join customer
    using (customer_id)
    join inventory i
    using (store_id)
    join store s
    using (store_id)
    group by store, amount;

-- Write a query to display for each store the store ID, city, and country.
select store_id, c.city, co.country from store
	join address a
    using (address_id)
    join city c
    using (city_id)
    join country co
    using (country_id);

-- List the top five genres in gross revenue in descending order. 
-- (Hint: you may need to use the following tables: category, 
-- film_category, inventory, payment, and rental.)