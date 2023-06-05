-- Extract
-- In SQL, first we need to identify our table, in this case, the table is called dbo.Transactions
-- One of the easiest ways to look at a table is by selecting all its columns, although this is only appropiate if the table is relatively small
-- Run the query below to see our data
SELECT *
FROM test_database.dbo.Transactions

-- The extraction process is also where we want to filter our data, if possible, let's say that we want to retrieve the records that have some kind of discount
-- In this case, we could set the where clause to exclude where the discount is 0, or the discount reason is null, we can use both to play it safe
SELECT *
FROM test_database.dbo.Transactions
WHERE Discount != 0 OR Discount_Reason IS NOT NULL

-- Notice how we only have eight records left, these eight records are the ones that have a discount
-- An advantage of this approach compared to doing everything in Excel from beginning to end, is that we are just getting into any tool that we are exporting the data what we need
-- This is especially useful when our datasets are bigger, having thousands or rows or more
-- Now, we can go into the next step

-- Transform
-- The transform step allows us to get the data into a form that we want to get
-- Let's start with something simple, we want to know how many customers we had and how much they generated in purchases
-- Instead of using the SELECT * wildcard, we will need to use the column names
SELECT COUNT(DISTINCT First_Name), SUM(Purchase)
FROM test_database.dbo.Transactions
WHERE Discount != 0 OR Discount_Reason IS NOT NULL

-- What we have done here is counting the distinct first names of the customers (Not recommended in practice) and adding up all the purchases
-- Notice that there is no column name, the transform step also involves getting useful labels to make clear what we are doing
-- In this case, we can use an alias
SELECT COUNT(DISTINCT First_Name) AS Number_of_Customers, SUM(Purchase) AS Total_Purchases
FROM test_database.dbo.Transactions
WHERE Discount != 0 OR Discount_Reason IS NOT NULL

-- This could be exported into Excel or Tableau, and then used for further analysis
-- However, notice how we just got one number, a lot of times, we want to compare different categories
-- To adjust our query, we will use the GROUP BY clause
SELECT SUM(Purchase) AS Total_Purchase, SUM(Discount) AS Total_Discount, AVG(Discount) AS Average_Discount, Discount_Reason
FROM test_database.dbo.Transactions
WHERE Discount != 0 OR Discount_Reason IS NOT NULL
GROUP BY Discount_Reason

-- If we want to go further, we can get the discount percentage from SQL, by doing a simple calculation
-- This step allows us to also automate the calculation, as we can just execute the query with the calculation every time we need it instead of doing it manually
--The query will also change if a new record is added to the database
SELECT SUM(Purchase) AS Total_Purchase, SUM(Discount) AS Total_Discount, SUM(Discount)/SUM(Purchase) * 100 AS Discount_Percentage, AVG(Discount) AS Average_Discount, Discount_Reason
FROM test_database.dbo.Transactions
WHERE Discount != 0 OR Discount_Reason IS NOT NULL
GROUP BY Discount_Reason

-- Load
-- Load is rather pretty case specific, there is a lot of ways to export your results to other tools
-- In SSMS, we can just right click and get the data from the query
-- We will just export it as a csv for now
-- Tableau, Power BI, and a lot of other tools have the option to connect directly to a database and executing a SQL Query
-- Excel also has an option to connect to SQL Databases