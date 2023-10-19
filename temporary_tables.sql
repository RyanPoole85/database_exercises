-- Using the example from the lesson, create a temporary table called 
-- employees_with_departments that contains first_name, last_name, and dept_name for 
-- employees currently with that department. Be absolutely sure to create this table on 
-- your own database. If you see "Access denied for user ...", it means that the query was
-- attempting to write a new table to a database that you can only read.

-- Add a column named full_name to this table. It should be a VARCHAR whose length 
-- is the sum of the lengths of the first name and last name columns.
-- Update the table so that the full_name column contains the correct data.
-- Remove the first_name and last_name columns from the table.
-- What is another way you could have ended up with this same table?
-- Create a temporary table based on the payment table from the sakila database.

-- Write the SQL necessary to transform the amount column such that it is stored as an
-- integer representing the number of cents of the payment. For example, 1.99 should 
-- become 199.

-- Go back to the employees database. Find out how the current average pay 
-- in each department compares to the overall current pay for everyone at the company.
-- For this comparison, you will calculate the z-score for each salary. In terms of salary, 
-- what is the best department right now to work for? The worst?

-- BONUS Determine the overall historic average department average salary, the historic
-- overall average, and the historic z-scores for salary. Do the z-scores for current 
-- department average salaries (from exercise 3) tell a similar or a different story 
-- than the historic department salary z-scores?

-- Hint: How should the SQL code used in exercise 3 be altered to instead use historic salary values?