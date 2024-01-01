-- More Drills With The Sakila Database
-- SELECT statements

-- Select all columns from the actor table.
use sakila;
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

-- Select the title, description, rating, and movie length columns from the 
-- films table that last 3 hours or longer.
select title, description, rating, length from film
	where length >= 180;
-- Select the payment id, amount, and payment date columns from the payments
 -- table for payments made on or after 05/27/2005.
 select payment_date from payment;
 select payment_id, amount, payment_date from payment
	where payment_date >= 2005-05-27;
-- Select the primary key, amount, and payment date columns from the payment 
-- table for payments made on 05/27/2005.
select * from payment;
select payment_id, amount, payment_date from payment
	where payment_date = ('2005-05-27');
-- Select all columns from the customer table for rows that have last names
 -- beginning with "S" and first names ending with "N".
 select * from customer
	where last_name like 'S%' and first_name like '%N';
-- Select all columns from the customer table for rows where the customer is 
-- inactive or has a last name beginning with "M".
select * from customer 
	where active = '0' and last_name like 'M%';
-- Select all columns from the category table for rows where the primary key 
-- is greater than 4 and the name field begins with either "C", "S" or "T".
select * from category
	where category_id > 4 and name like 'C%' or name like 'S%' or name like 'T%';
-- Select all columns minus the password column from the staff table for rows 
-- that contain a password.
select last_name, password from staff;
select staff_id, concat(first_name,' ',last_name) name, address_id, picture, email, store_id, active,
username, last_update from staff
	where password is not null;
-- Select all columns minus the password column from the staff table for rows 
-- that do not contain a password.
select staff_id, concat(first_name,' ',last_name) name, address_id, picture, email, store_id, active,
username, last_update from staff
	where password is null;
-- IN operator

-- Select the phone and district columns from the address table for addresses 
-- in California, England, Taipei, or West Java.
select phone, district from address
	where district in ('California', 'England', 'Taipei', 'West Java');
-- Select the payment id, amount, and payment date columns from the payment 
-- table for payments made on 05/25/2005, 05/27/2005, and 05/29/2005. (Use the 
-- IN operator and the DATE function, instead of the AND operator as in previous
--  exercises.)
select payment_id, amount, payment_date from payment
	where payment_date in (2005-05-25, 2005-05-27, 2005-05-29); 
-- Select all columns from the film table for films rated G, PG-13 or NC-17.
select * from film
where rating in ('G', 'PG-13', 'NC-17');
-- BETWEEN operator

-- Select all columns from the payment table for payments made between midnight 
-- 05/25/2005 and 1 second before midnight 05/26/2005.
SELECT * FROM payment
	where payment_date between '2005-05-25 00:00:00' and '2005-05-26 23:59:59';
-- Select the film_id, title, and description columns from the film table for 
-- films where the length of the description is between 100 and 120.
select description from film;
select film_id, title, description from film
	where length(description) between 100 and 120;
-- LIKE operator

-- Select the following columns from the film table for rows where the description 
-- begins with "A Thoughtful".
select * from film 
	where description like 'A Thoughtful%';
-- Select the following columns from the film table for rows where the description 
-- ends with the word "Boat".
select * from film
	where description like '%Boat';
-- Select the following columns from the film table where the description contains 
-- the word "Database" and the length of the film is greater than 3 hours.
select * from film
	where description like '%Database%' and length > 180;
-- LIMIT Operator


-- Select all columns from the payment table and only include the first 20 rows.
select * from payment
	limit 20;
-- Select the payment date and amount columns from the payment table for rows where 
-- the payment amount is greater than 5, and only select rows whose zero-based index 
-- in the result set is between 1000-2000.
select payment_date, amount from payment
	where amount >5.00
    limit 1001 offset 999;
-- Select all columns from the customer table, limiting results to those where the 
-- zero-based index is between 101-200.
select * from customer 
	limit 100 offset 100;
-- ORDER BY statement

-- Select all columns from the film table and order rows by the length field in 
-- ascending order.

select * from film
	order by length;
-- Select all distinct ratings from the film table ordered by rating in descending
-- order.
select distinct rating from film
	order by rating desc;
-- Select the payment date and amount columns from the payment table for the first 
-- 20 payments ordered by payment amount in descending order.
select payment_date, amount from payment
	order by amount desc
    limit 20;
-- Select the title, description, special features, length, and rental duration columns 
-- from the film table for the first 10 films with behind the scenes footage under 2 
-- hours in length and a rental duration between 5 and 7 days, ordered by length in 
-- descending order.
select title, description, special_features, length, rental_duration from film
	where special_features like ('%Behind the Scenes%') and length < 120  
		and rental_duration between 5 and 7
	order by length desc
    limit 10;
-- JOINs

-- Select customer first_name/last_name and actor first_name/last_name 
-- columns from performing a left join between the customer and actor column on 
-- the last_name column in each table. (i.e. customer.last_name = actor.last_name)
-- Label customer first_name/last_name columns as customer_first_name/customer_last_name
-- Label actor first_name/last_name columns in a similar fashion.
-- returns correct number of records: 620
select concat(c.first_name,' ',c.last_name) customer_name, 
	concat(a.first_name,' ',a.last_name) actor_name
	from customer c
    left join actor a on c.last_name = a.last_name;

-- Select the customer first_name/last_name and actor first_name/last_name
 -- columns from performing a right join between the customer and actor column on
 -- the last_name column in each table. (i.e. customer.last_name = actor.last_name)
-- returns correct number of records: 200
select concat(c.first_name,' ',c.last_name) customer_name,
	concat(a.first_name,' ',a.last_name) actor_name from customer c
    right join actor a on c.last_name = a.last_name;
    
-- Select the customer first_name/last_name and actor first_name/last_name columns 
-- from performing an inner join between the customer and actor column on the last_name 
-- column in each table. (i.e. customer.last_name = actor.last_name)
-- returns correct number of records: 43
select concat(c.first_name,' ',c.last_name) customer_name,
	concat(a.first_name,' ',a.last_name) actor_name from customer c
    inner join actor a on c.last_name = a.last_name;

-- Select the city name and country name columns from the city table, 
-- performing a left join with the country table to get the country name column.
-- Returns correct records: 600
select c.city city, co.country country from city c 
 left join country co using (country_id);
-- Select the title, description, release year, and language name columns 
-- from the film table, performing a left join with the language table to 
-- get the "language" column.
-- Label the language.name column as "language"
-- Returns 1000 rows
select f.title, f.description, f.release_year, l.name from film f 
	left join language l using (language_id);
-- Select the first_name, last_name, a.address, a.address2, c.city, a.district, 
-- and a.postal code columns from the staff table, performing 2 left joins with 
-- the address table then the city table to get the address and city related columns.
-- returns correct number of rows: 2
select s.first_name, s.last_name, a.address, a.address2, c.city, a.district, 
a.postal_code from staff s
	left join address a using (address_id)
    left join city c using (city_id);
-- Display the first and last names in all lowercase of all the actors.
select lower(first_name), lower(last_name) from actor;
-- You need to find the ID number, first name, and last name of an actor, 
-- of whom you know only the first name, "Joe." What is one query would 
-- you use to obtain this information?
select actor_id, concat(first_name,' ',last_name) name from actor
	where first_name in ('Joe');
-- Find all actors whose last name contain the letters "gen":
select concat(first_name,' ',last_name) name from actor
	where last_name like '%gen%';
-- Find all actors whose last names contain the letters "li". This time, 
-- order the rows by last name and first name, in that order.
select first_name, last_name from actor
	where last_name like '%li%'
    order by last_name, first_name;
-- Using IN, display the country_id and country columns for the following countries:
--  Afghanistan, Bangladesh, and China.
select country_id, country from country
	where country in ('Afghanistan', 'Bangladesh', 'China');
-- List the last names of all the actors, as well as how many actors have that 
-- last name.
select last_name, count(*) cnt from actor
	group by last_name;
-- List last names of actors and the number of actors who have that last name, 
-- but only for names that are shared by at least two actors
select last_name, count(*) cnt from actor
	group by last_name having cnt >=2;
-- You cannot locate the schema of the address table. Which query would 
-- you use to recreate it?
select * from address;
-- Use JOIN to display the first and last names, as well as the address, 
-- of each staff member.
select * from staff;
select concat(first_name,' ',last_name) name, address from staff s 
	left join address a using (address_id);
-- Use JOIN to display the total amount rung up by each staff member in
--  August of 2005.
use sakila;

select * from payment;

select concat(first_name,' ',last_name) name, sum(amount) from staff
	join payment p using (staff_id)
    where payment_date like '2005-08%'
	group by name;
    
-- List each film and the number of actors who are listed for that film.
select * from film_actor;
select title, count(actor_id) cnt from film
	join film_actor using (film_id)
    group by title;
-- How many copies of the film Hunchback Impossible exist in the inventory system?
select * from film;
select title, count(inventory_id) cnt from film
	join inventory using (film_id)
    where title in ('HUNCHBACK IMPOSSIBLE')
    group by title;
    
-- The music of Queen and Kris Kristofferson have seen an unlikely resurgence. 
-- As an unintended consequence, films starting with the letters K and Q have 
-- also soared in popularity. Use subqueries to display the titles of movies 
-- starting with the letters K and Q whose language is English.
select * from language;
select title, l.name from film
	join language l using (language_id)
    where title like 'K%' or title like 'Q%' and 
     l.name in (select name from language where name in ('English'));
     
-- Use subqueries to display all actors who appear in the film Alone Trip.
select * from film;
select title, concat(a.first_name,' ', a.last_name) actor_name from film
	join film_actor using (film_id)
    join actor a using (actor_id)
    where title in (select title from film where title in ('ALONE TRIP'));
    
-- You want to run an email marketing campaign in Canada, for which you will 
-- need the names and email addresses of all Canadian customers.
select country from country;
select concat(first_name,' ',last_name) customer_name, email, country from customer
	join address using (address_id)
    join city using (city_id)
    join country using (country_id)
    where country in (select country from country where country in ('Canada'));

-- Sales have been lagging among young families, and you wish to target all family 
-- movies for a promotion. Identify all movies categorized as family films.
select title, name from film
	join film_category using (film_id)
    join category using (category_id)
    where name in (select name from category where name in ('Family'));
    
-- Write a query to display how much business, in dollars, each store brought in.
select store_id, sum(amount) from store 
	join staff using (store_id)
    join payment using (staff_id)
    group by store_id;

-- Write a query to display for each store the store ID, city, and country.
select store_id, city, country from store
	join address using (address_id)
    join city using (city_id)
    join country using (country_id)
    group by store_id;
    
-- List the top five genres in gross revenue in descending order. (Hint: you may need
-- to use the following tables: category, film_category, inventory, payment, and rental.)
select rental from payment
group by rental_id;

select name, sum(amount) total from category
	join film_category using(category_id)
    join inventory using (film_id)
	join rental using (inventory_id)
    join payment using (customer_id)
    group by name
    order by total desc
    limit 5;
use sakila;
-- What is the average replacement cost of a film? Does this change depending on the 
-- rating of the film?

select avg(replacement_cost) from film;
select rating, avg(replacement_cost) avg_replace_cost from film
	group by rating
    order by avg_replace_cost;

-- +-----------------------+
-- | AVG(replacement_cost) |
-- +-----------------------+
-- |             19.984000 |
-- +-----------------------+
-- 1 row in set (2.39 sec)

-- +--------+-----------------------+
-- | rating | AVG(replacement_cost) |
-- +--------+-----------------------+
-- | G      |             20.124831 |
-- | PG     |             18.959072 |
-- | PG-13  |             20.402556 |
-- | R      |             20.231026 |
-- | NC-17  |             20.137619 |
-- +--------+-----------------------+
-- 5 rows in set (0.09 sec)

-- How many different films of each genre are in the database?
select * from category;
select name, count(film_id) from category
	join film_category using (category_id)
    group by name;


-- +-------------+-------+
-- | name        | count |
-- +-------------+-------+
-- | Action      |    64 |
-- | Animation   |    66 |
-- | Children    |    60 |
-- | Classics    |    57 |
-- | Comedy      |    58 |
-- | Documentary |    68 |
-- | Drama       |    62 |
-- | Family      |    69 |
-- | Foreign     |    73 |
-- | Games       |    61 |
-- | Horror      |    56 |
-- | Music       |    51 |
-- | New         |    63 |
-- | Sci-Fi      |    61 |
-- | Sports      |    74 |
-- | Travel      |    57 |
-- +-------------+-------+
-- 16 rows in set (0.06 sec)
-- What are the 5 frequently rented films?
select * from film
	join inventory using (film_id)
	join rental using (inventory_id)
    join payment using (customer_id);


select title, count(distinct(r.rental_id)) total from film
	join inventory using (film_id)
	join rental r using (inventory_id)
    join payment using (customer_id)
    group by title
    order by total desc
    limit 5;

-- +---------------------+-------+
-- | title               | total |
-- +---------------------+-------+
-- | BUCKET BROTHERHOOD  |    34 |
-- | ROCKETEER MOTHER    |    33 |
-- | GRIT CLOCKWORK      |    32 |
-- | RIDGEMONT SUBMARINE |    32 |
-- | JUGGLER HARDLY      |    32 |
-- +---------------------+-------+
-- 5 rows in set (0.11 sec)

-- What are the most profitable films (in terms of gross revenue)?
select title, sum(amount) total from payment
	join rental using (rental_id)
	join inventory using (inventory_id)
    join film using (film_id)
    group by title
    order by total desc
    limit 5;

-- +-------------------+--------+
-- | title             | total  |
-- +-------------------+--------+
-- | TELEGRAPH VOYAGE  | 231.73 |
-- | WIFE TURN         | 223.69 |
-- | ZORRO ARK         | 214.69 |
-- | GOODFELLAS SALUTE | 209.69 |
-- | SATURDAY LAMBS    | 204.72 |
-- +-------------------+--------+
-- 5 rows in set (0.17 sec)

-- Who is the best customer?
select concat(last_name,', ',first_name) name, sum(amount) total from customer
	join payment using (customer_id)
    group by name
    order by total desc
    limit 1;
-- +------------+--------+
-- | name       | total  |
-- +------------+--------+
-- | SEAL, KARL | 221.55 |
-- +------------+--------+
-- 1 row in set (0.12 sec)
-- Who are the most popular actors (that have appeared in the most films)?
select concat(last_name,', ', first_name) actor_name, count(title) total from actor
	join film_actor using (actor_id)
    join film f using (film_id)
    group by actor_name
    order by total desc
    limit 5 offset 1;

-- +-----------------+-------+
-- | actor_name      | total |
-- +-----------------+-------+
-- | DEGENERES, GINA |    42 |
-- | TORN, WALTER    |    41 |
-- | KEITEL, MARY    |    40 |
-- | CARREY, MATTHEW |    39 |
-- | KILMER, SANDRA  |    37 |
-- +-----------------+-------+
-- 5 rows in set (0.07 sec)
-- What are the sales of each store for each month in 2005?
select payment_date from payment;
select date_format(payment_date, '%y-%m') month, store_id, sum(amount) sales from payment
	join staff using (staff_id)
    join store using (store_id)
    where year(payment_date) = 2005
    group by month, store_id
    order by month;
-- +---------+----------+----------+
-- | month   | store_id | sales    |
-- +---------+----------+----------+
-- | 2005-05 |        1 |  2459.25 |
-- | 2005-05 |        2 |  2364.19 |
-- | 2005-06 |        1 |  4734.79 |
-- | 2005-06 |        2 |  4895.10 |
-- | 2005-07 |        1 | 14308.66 |
-- | 2005-07 |        2 | 14060.25 |
-- | 2005-08 |        1 | 11933.99 |
-- | 2005-08 |        2 | 12136.15 |
-- +---------+----------+----------+
-- 8 rows in set (0.14 sec)
-- Bonus: Find the film title, customer name, customer phone number,
-- and customer address for all the outstanding DVDs.
select title, concat(last_name,', ',first_name) customer_name, phone, address from customer
	join rental using (customer_id)
    join address using (address_id)
    join inventory using (inventory_id)
    join film using (film_id)
    where return_date is null;
    
-- +------------------------+------------------+--------------+
-- | title                  | customer_name    | phone        |
-- +------------------------+------------------+--------------+
-- | HYDE DOCTOR            | KNIGHT, GAIL     | 904253967161 |
-- | HUNGER ROOF            | MAULDIN, GREGORY | 80303246192  |
-- | FRISCO FORREST         | JENKINS, LOUISE  | 800716535041 |
-- | TITANS JERK            | HOWELL, WILLIE   | 991802825778 |
-- | CONNECTION MICROCOSMOS | DIAZ, EMILY      | 333339908719 |
-- +------------------------+------------------+--------------+
-- 5 rows in set (0.06 sec)
-- 183 rows total, above is just the first 5
-- Employees Database
-- How much do the current managers of each department get paid, relative to 
-- the average salary for the department? 
use employees;
select concat(first_name,' ', last_name) manager_name, dept_name, salary, avg(salary) from dept_manager
	join employees e using (emp_no)
    join departments d using (dept_no)
    join salaries s using (emp_no)
    join dept_manager dm using (dept_no)
    where dm.emp_no in (select emp_no from dept_manager) and 
			s.to_date > now() and dm.to_date > now() and avg(salary) in (select avg(salary) from salaries)
    group by manager_name, salary, dept_name;
-- Is there any department where the department manager gets paid less than 
-- the average salary?
-- World Database
-- Use the world database for the questions below.

-- What languages are spoken in Santa Monica?
use world;
select Language, Percentage from city c
	join countrylanguage cl using (CountryCode)
	where c.name in ('Santa Monica')
	order by Percentage;

-- +------------+------------+
-- | Language   | Percentage |
-- +------------+------------+
-- | Portuguese |        0.2 |
-- | Vietnamese |        0.2 |
-- | Japanese   |        0.2 |
-- | Korean     |        0.3 |
-- | Polish     |        0.3 |
-- | Tagalog    |        0.4 |
-- | Chinese    |        0.6 |
-- | Italian    |        0.6 |
-- | French     |        0.7 |
-- | German     |        0.7 |
-- | Spanish    |        7.5 |
-- | English    |       86.2 |
-- +------------+------------+
-- 12 rows in set (0.01 sec)
-- How many different countries are in each region?
select * from country;
select Region, count(name) num_countries from country
	group by region
	order by num_countries; 

-- +---------------------------+---------------+
-- | Region                    | num_countries |
-- +---------------------------+---------------+
-- | Micronesia/Caribbean      |             1 |
-- | British Islands           |             2 |
-- | Baltic Countries          |             3 |
-- | Antarctica                |             5 |
-- | North America             |             5 |
-- | Australia and New Zealand |             5 |
-- | Melanesia                 |             5 |
-- | Southern Africa           |             5 |
-- | Northern Africa           |             7 |
-- | Micronesia                |             7 |
-- | Nordic Countries          |             7 |
-- | Central America           |             8 |
-- | Eastern Asia              |             8 |
-- | Central Africa            |             9 |
-- | Western Europe            |             9 |
-- | Eastern Europe            |            10 |
-- | Polynesia                 |            10 |
-- | Southeast Asia            |            11 |
-- | Southern and Central Asia |            14 |
-- | South America             |            14 |
-- | Southern Europe           |            15 |
-- | Western Africa            |            17 |
-- | Middle East               |            18 |
-- | Eastern Africa            |            20 |
-- | Caribbean                 |            24 |
-- +---------------------------+---------------+
-- 25 rows in set (0.00 sec)
-- What is the population for each region?
select * from country;
select Region, sum(Population) population from country
	group by Region
    order by population desc;

-- +---------------------------+------------+
-- | Region                    | population |
-- +---------------------------+------------+
-- | Eastern Asia              | 1507328000 |
-- | Southern and Central Asia | 1490776000 |
-- | Southeast Asia            |  518541000 |
-- | South America             |  345780000 |
-- | North America             |  309632000 |
-- | Eastern Europe            |  307026000 |
-- | Eastern Africa            |  246999000 |
-- | Western Africa            |  221672000 |
-- | Middle East               |  188380700 |
-- | Western Europe            |  183247600 |
-- | Northern Africa           |  173266000 |
-- | Southern Europe           |  144674200 |
-- | Central America           |  135221000 |
-- | Central Africa            |   95652000 |
-- | British Islands           |   63398500 |
-- | Southern Africa           |   46886000 |
-- | Caribbean                 |   38140000 |
-- | Nordic Countries          |   24166400 |
-- | Australia and New Zealand |   22753100 |
-- | Baltic Countries          |    7561900 |
-- | Melanesia                 |    6472000 |
-- | Polynesia                 |     633050 |
-- | Micronesia                |     543000 |
-- | Antarctica                |          0 |
-- | Micronesia/Caribbean      |          0 |
-- +---------------------------+------------+
-- 25 rows in set (0.00 sec)
-- What is the population for each continent?
select Continent, sum(population) population from country
	group by Continent
    order by population desc;

-- +---------------+------------+
-- | Continent     | population |
-- +---------------+------------+
-- | Asia          | 3705025700 |
-- | Africa        |  784475000 |
-- | Europe        |  730074600 |
-- | North America |  482993000 |
-- | South America |  345780000 |
-- | Oceania       |   30401150 |
-- | Antarctica    |          0 |
-- +---------------+------------+
-- 7 rows in set (0.00 sec)
-- What is the average life expectancy globally?
select avg(LifeExpectancy) from country;

-- +---------------------+
-- | avg(LifeExpectancy) |
-- +---------------------+
-- |            66.48604 |
-- +---------------------+
-- 1 row in set (0.00 sec)
-- What is the average life expectancy for each region, each continent? Sort the results from shortest to longest
select Region, avg(LifeExpectancy) life_expectancy from country
	group by Region
    order by life_expectancy;
    
select Continent, avg(LifeExpectancy) life_expectancy from country
	group by Continent
    order by life_expectancy;

-- +---------------+-----------------+
-- | Continent     | life_expectancy |
-- +---------------+-----------------+
-- | Antarctica    |            NULL |
-- | Africa        |        52.57193 |
-- | Asia          |        67.44118 |
-- | Oceania       |        69.71500 |
-- | South America |        70.94615 |
-- | North America |        72.99189 |
-- | Europe        |        75.14773 |
-- +---------------+-----------------+
-- 7 rows in set (0.00 sec)

-- +---------------------------+-----------------+
-- | Region                    | life_expectancy |
-- +---------------------------+-----------------+
-- | Antarctica                |            NULL |
-- | Micronesia/Caribbean      |            NULL |
-- | Southern Africa           |        44.82000 |
-- | Central Africa            |        50.31111 |
-- | Eastern Africa            |        50.81053 |
-- | Western Africa            |        52.74118 |
-- | Southern and Central Asia |        61.35000 |
-- | Southeast Asia            |        64.40000 |
-- | Northern Africa           |        65.38571 |
-- | Melanesia                 |        67.14000 |
-- | Micronesia                |        68.08571 |
-- | Baltic Countries          |        69.00000 |
-- | Eastern Europe            |        69.93000 |
-- | Middle East               |        70.56667 |
-- | Polynesia                 |        70.73333 |
-- | South America             |        70.94615 |
-- | Central America           |        71.02500 |
-- | Caribbean                 |        73.05833 |
-- | Eastern Asia              |        75.25000 |
-- | North America             |        75.82000 |
-- | Southern Europe           |        76.52857 |
-- | British Islands           |        77.25000 |
-- | Western Europe            |        78.25556 |
-- | Nordic Countries          |        78.33333 |
-- | Australia and New Zealand |        78.80000 |
-- +---------------------------+-----------------+
-- 25 rows in set (0.00 sec)
-- Bonus
-- Find all the countries whose local name is different from the official name
select name, localname from country
	where LocalName != Name;

-- How many countries have a life expectancy less than x?
select count(name) cnt from country
	where lifeexpectancy < 50;
    
-- What state is city x located in?
select * from city;
select district state from city
	where name in ('Dordrecht');
-- What region of the world is city x located in?
select * from country;
select c.name, Region from country co
	join city c on c.countrycode = co.code
    where c.name in ('Dordrecht');
-- What country (use the human readable name) city x located in?
select c.name City, co.name Country from country co
	join city c on c.countrycode = co.code
    where c.name in ('Dordrecht');

-- What is the life expectancy in city x?
select c.name City, lifeexpectancy Life_Expectancy from country co
	join city c on c.countrycode = co.code
    where c.name in ('Dordrecht');
-- Advanced: Pizza Database
-- Use the pizza database to answer the following questions.
use pizza;
-- What information is stored in the toppings table? topping_id, topping_name, topping_price.
show tables;
select * from toppings;
-- How does this table relate to the pizzas table? pizza_toppings table
select * from pizza_toppings;
-- What information is stored in the modifiers table? modifier id, modifier name, modifier price 
select * from modifiers;
-- How does this table relate to the pizzas table? must use pizza_modifiers table to link
select * from pizza_modifiers;
-- How are the pizzas and sizes tables related? size_id
select * from sizes;

-- What other tables are in the database? pizza_toppings,
show tables;
-- How many unique toppings are there? 9
select distinct count(topping_name) unique_toppings from toppings;

-- How many unique orders are in this dataset? 20,001
select count(distinct(order_id)) unique_orders from pizzas;

-- Which size of pizza is sold the most?
select size_name, count(size_id) cnt from pizzas
	join sizes using (size_id)
	group by size_name
    order by cnt desc
    limit 1;

-- How many pizzas have been sold in total?
select count(order_id) cnt from pizzas;

-- What is the most common size of pizza ordered?
select size_name, count(size_id) cnt from pizzas
	join sizes using (size_id)
	group by size_name
    order by cnt desc
    limit 1;
-- What is the average number of pizzas per order?

select count(distinct(pizza_id)) / count(distinct(order_id)) from pizzas;
-- Find the total price for each order. The total price is the sum of:
select sum(size_price) + (sum(topping_price) * sum(topping_id)) + sum(modifier_price) from pizzas
	join pizza_toppings using (pizza_id)
    join pizza_modifiers using (pizza_id)
    join modifiers using (modifier_id)
    join toppings using (topping_id)
    join sizes using (size_id)
    group by order_id;
    
-- select * from pizzas
	-- join pizza_toppings using (pizza_id)
    -- join pizza_modifiers using (pizza_id)
    -- join modifiers using (modifier_id)
    -- join toppings using (topping_id)
    -- join sizes using (size_id)
-- The price based on pizza size
-- Any modifiers that need to be charged for
-- The sum of the topping prices
-- Topping price is affected by the amount of the topping specified. A light 
-- amount is half of the regular price. An extra amount is 1.5 times the regular 
-- price, and double the topping is double the price.

-- Additional Questions:
select * from modifiers;
-- What is the average price of pizzas that have no cheese?
select order_id, sum(size_price) + (sum(topping_price) * sum(topping_id)) + sum(modifier_price) from pizzas
	join pizza_toppings using (pizza_id)
    join pizza_modifiers using (pizza_id)
    join modifiers using (modifier_id)
    join toppings using (topping_id)
    join sizes using (size_id)
    group by order_id;

-- What is the most common size for pizzas that have extra cheese?
use pizza;
select size_name, count(size_name) cnt from sizes
join pizzas using (size_id)
join pizza_toppings using (pizza_id)
where topping_amount in ('extra')
group by size_name
order by cnt desc
limit 1; 

-- What is the most common topping for pizzas that are well done?
select * from modifiers;
select topping_name, count(topping_name) cnt from toppings
	join pizza_toppings using (topping_id)
    join pizza_modifiers using (pizza_id)
    join modifiers using (modifier_id) 
    where modifier_name in ('well done')
    group by topping_name
    order by cnt desc
    limit 1;

-- How many pizzas are only cheese (i.e. have no toppings)?
select topping_amount, count(topping_amount) cnt from pizza_toppings
group by topping_amount
;
select * from toppings;
select * from sizes;

-- How many orders consist of pizza(s) that are only cheese? What is the average price of these orders? The most common pizza size?
-- How many large pizzas have olives on them?
-- What is the average number of toppings per pizza?
-- What is the average number of pizzas per order?
-- What is the average pizza price?
-- What is the average order total?
-- What is the average number of items per order?
-- What is the average number of toppings per pizza for each size of pizza?
-- What is the average order total for orders that contain more than 1 pizza?
-- What is the most common pizza size for orders that contain only a single pizza?
-- How many orders consist of 3+ pizzas? What is the average number of toppings for these orders?
-- What is the most common topping on large and extra large pizzas?
-- What is the most common topping for orders that consist of 2 pizzas?
-- Which size of pizza most frequently has modifiers?
-- What percentage of pizzas with hot sauce have extra cheese?
-- What is the average order price for orders that have at least 1 pizza with pineapple?
