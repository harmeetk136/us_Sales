create database project;
use project;

CREATE TABLE us_sales (
    SL_NO INT,
    Date DATE,
    Product_Type VARCHAR(50),
    Product VARCHAR(50),
    Type VARCHAR(50),
    Profit INT,
    Margin INT,
    Sales INT,
    COGS INT,
    Total_Expenses INT,
    Marketing INT,
    Expected_Profit INT,
    Expected_COGS INT,
    Expected_Margin INT,
    Expected_Sales INT,
    state VARCHAR(50),
    market VARCHAR(50),
    market_size VARCHAR(50)
);

SELECT * FROM us_sales;

-- 1. Write a query to fetch the data from sales where product type should be Coffee,Tea and Herbal Tea
SELECT * 
FROM us_sales 
WHERE product_type IN ("coffee","tea","herbal tea");

-- 2. Write a query to show the name of state whose name start and ends with [a, i, o, e] and [t, o, a, n]
SELECT state 
FROM us_sales 
WHERE LEFT(STATE,1) IN("a","e","i","o","u")
AND RIGHT(STATE,1) IN("t","o","a","n")
GROUP BY state; 

-- 3. Extract the table from sales whose state is Connecticut and product is tea and coffee
SELECT * 
FROM us_Sales 
WHERE state="connecticut"
and product_type IN("tea","coffee");

-- 4. combine the three column product sales and state with separator of "-" these symbol
SELECT CONCAT(product,"-",sales,"-",state) AS combIne 
FROM us_Sales;

-- 5. Show the total value with state with is total expense IN bracket Example
SELECT CONCAT(state,"(",total_expenses,")") AS state_total_expenses
FROM us_sales;

-- 6. Query the two states in Sales with the short and longest state names, as well as their respective lengths 
(SELECT state,length(state) AS state_length
FROM us_sales
GROUP BY STATE
ORDER BY state_length,STATE
limit 1)
union  
(SELECT state,length(STATE) AS state_length
FROM us_sales
GROUP BY state
ORDER BY state_length DESC, state
limit 1);

-- 7. Query the difference between the maximum and minimum COGS IN CITY.
SELECT state, max(COGS)-min(COGS) AS cogs_difference
FROM us_Sales 
GROUP BY state;

-- 8. Find the minimum length of the state and alphabatically sorted which is in market
SELECT state, max(LENGTH(STATE)) AS lenstate 
FROM us_Sales 
GROUP BY state 
ORDER BY lenstate ASC, state;

-- 9. Show the sales details whose cogs is greater than average cogs and Total expense is less than average expense
SELECT *
FROM us_sales
WHERE cogs > (SELECT avg(cogs) FROM us_sales) 
AND total_expenses< (SELECT avg(total_expenses) FROM us_sales);

-- 10. Find the total sales IN each month whose type should be regular
SELECT sum(sales), month(date) AS month
FROM us_sales 
WHERE type="regular" 
GROUP BY month
ORDER BY month; 

-- 11. Write a query to show which Market expected sales is high
SELECT market, max(Expected_Sales) AS max_expected_Sales
FROM us_sales 
GROUP BY market;

-- 12. What is the key difference between the profit and margin in each market and product type
SELECT market, Product_Type, sum(margin-profit) AS diff
FROM us_sales 
GROUP BY market, Product_Type;

-- 13. Show the sort day name and sort month name in a column from sales with his month name and day name
SELECT CONCAT(monthname(date),' ',dayname(date),' ',sales) AS month_day_Sales
FROM us_sales 
ORDER BY monthname(date), dayname(date);

-- 14. Group the all state base of total sales and total profit and show the investment in each state
SELECT sum(sales) AS total_sales, sum(profit) AS total_profit, sum(Marketing) AS total_marketing,STATE 
FROM us_sales 
GROUP BY state;

-- 15.Show the all odd si_no whose type is regular and STATE is New York and data should be arranged IN descending order on expected Margin
SELECT * 
FROM us_sales 
WHERE mod(SI_NO,2)<>0 
  and type="regular" 
  and state="new york" 
ORDER BY margIN DESC;

-- 16. Show the maximum sales minimum cogs average margin and total number of product IN IN each product data should be arranged in ascending order
SELECT max(sales) AS max_sales, min(cogs) AS mIN_cogs, avg(margIN) AS avg_margIN, count(product) AS count_product,product 
FROM us_sales 
GROUP BY product 
ORDER BY product ASc;

-- 17. Show the details of minimum and maximum profit IN washington and market size should be east, west and north
SELECT min(profit) AS min_profit, max(profit) AS max_profit
FROM us_sales 
WHERE STATE="washington" 
 AND market IN("east","west","north");

-- 18. Write a query to extract the all-negative value FROM the sales data set and after convert all the negative data to positive data
SELECT abs(profit) AS abs_profit, abs(sales) AS abs_sales, abs(cogs) AS abs_cogs, 
abs(total_expenses) AS abs_total_expenses, abs(marketINg) AS abs_marketINg, 
abs(expected_profit) AS abs_expected_profit, abs(expected_cogs) AS abs_expected_cogs, 
abs(expected_margIN) AS abs_expected_margIN, abs(expected_sales) AS abs_expected_sales
FROM us_sales;

-- 19. Find the top 5 best-sellling products by total sales amount.
SELECT product, sum(Sales) AS total_sales
FROM us_sales 
GROUP BY product 
ORDER BY total_sales DESC 
limit 5;

-- 20. Count the number of orders made by each state.
SELECT state,count(*) AS order_count 
FROM us_sales 
GROUP BY STATE;

-- 21. Calculate the total sales amount for all transactions in the dataset
SELECT sum(sales)  AS total_sales
FROM us_Sales;

-- 22. Calculate the total sales amount for each states.
SELECT state , sum(sales) AS total_Sales
FROM us_sales 
GROUP BY STATE;

-- 23. Find the with the highest and lowest quantity value by product.
SELECT max(product) AS max_product, min(product) AS min_product
FROM us_sales;

-- 24. Find the total sales placed after a 2011-05-10
SELECT sum(sales) AS total_sales
FROM us_sales 
WHERE date>"2011-05-10";

-- 25.FINd the details WHERE the profit margin (profit_amount / sales_amount) is greater than 50%
SELECT * FROM us_sales
WHERE (profit/sales)>0.5;

 
