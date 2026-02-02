CREATE DATABASE amazon_sales;
use amazon_sales;
create table amazon(
invoice_id varchar(20),
branch char(1),
city varchar(20),
customer_type varchar(10),
gender varchar(10),
product_line varchar(30),
unit_price decimal(10,2),
quantity int,
tax_5_percent decimal(10,2),
total decimal(10,2),
date Date,
time Time,
payment varchar(20),
cogs decimal(10,2),
gross_margin_percentage decimal(10,4),
gross_income decimal(10,2),
rating decimal(3,1)
);
select * from amazon;

-- Business Question

-- 1.Find the total sales of the company?
SELECT ROUND(SUM(total_amount), 2) AS total_sales
FROM amazon;


-- 2. Find the total sales by the city?
SELECT city, ROUND(SUM(total),2) AS total_sales
FROM amazon
GROUP BY city;

-- 3.Find the top 5 Selling Product lines?
SELECT 'product_line', SUM(quantity) AS total_quantity
FROM amazon
GROUP BY 'product_line'
ORDER BY total_quantity DESC
LIMIT 5;

-- 4. Find the total total sales by Branch?
SELECT branch, ROUND(SUM(total),2) AS sales
FROM amazon
GROUP BY branch;

-- 5. Find the revenue by Product line?
SELECT 'product_line', ROUND(SUM(total),2) AS revenue
FROM amazon
GROUP BY 'product_line';


-- 6. Identify the customer type contribution?
SELECT 'customer_type', ROUND(SUM(total),2) AS revenue
FROM amazon
GROUP BY 'customer_type';

-- 7. What are the Gender wise sales?
SELECT gender, ROUND(SUM(total),2) AS total_sales
FROM amazon
GROUP BY gender;

-- 8. Which Payment method occur most preferred in the sales?
SELECT payment, COUNT(*) AS total_transactions
FROM amazon
GROUP BY payment
ORDER BY total_transactions DESC;

-- 9. Fetch me the montly sales trend?
SELECT MONTH(date) AS month, ROUND(SUM(total),2) AS total_sales
FROM amazon
GROUP BY MONTH(date)
ORDER BY month;

-- 10. Find the Peak Sales Time in hour- wise?
SELECT HOUR(time) AS hour, COUNT(*) AS orders
FROM amazon
GROUP BY hour
ORDER BY orders DESC;

-- 11. What is the Highest Grocess Income Product Line?
SELECT 'product_line', ROUND(SUM('gross_income'),2) AS gross_income
FROM amazon
GROUP BY 'product_line'
ORDER BY 'gross_income' DESC
LIMIT 1;


-- 12. Count all the Product line preferred by the females?
SELECT 'product_line', COUNT(*) AS orders
FROM amazon
WHERE gender = 'Female'
GROUP BY 'product_line'
ORDER BY orders DESC;

-- 13.Fetch me Average Rating per Product Line?
SELECT 'product_line', ROUND(AVG(rating),2) AS avg_rating
FROM amazon
GROUP BY 'product_line';

-- 14.What are the highest Rated Product Line?
SELECT 'product_line', ROUND(AVG(rating),2) AS rating
FROM amazon
GROUP BY 'product_line'
ORDER BY rating DESC
LIMIT 1;

-- 15. Which is the Highest City in Revenue?
SELECT city, ROUND(SUM(total),2) AS revenue
FROM amazon
GROUP BY city
ORDER BY revenue DESC
LIMIT 1;

-- 16. Find the highest Taxing Paying City?
SELECT city, ROUND(SUM('tax_5_percent'),2) AS tax
FROM amazon
GROUP BY city
ORDER BY tax DESC;

-- 17. Find the total Quantity Sold ?
SELECT SUM(quantity) AS total_units_sold
FROM amazon;

-- 18. Fetch Revenue by payment method.
SELECT payment, ROUND(SUM(total),2) AS revenue
FROM amazon
GROUP BY payment;

-- 19. Fetch me the City wise Average Rating?
SELECT city, ROUND(AVG(rating),2) AS avg_rating
FROM amazon
GROUP BY city;

-- 20. Find the Branch wise Gross India?
SELECT branch, ROUND(SUM('gross_income'),2) AS gross_income
FROM amazon
GROUP BY branch;

-- 21. Find the Average Purchase Value?
SELECT ROUND(AVG(total),2) AS avg_order_value
FROM amazon;

-- 22. What is the number Order Per City?
SELECT city, COUNT('invoice_id') AS total_orders
FROM amazon
GROUP BY city;

-- 23. Find Member vs Normal Average Rating?
SELECT 'customer_type', ROUND(AVG(rating),2) AS avg_rating
FROM amazon
GROUP BY 'customer_type';

-- 24. How many orders are with Rating greater than 9?
SELECT COUNT(*) AS high_rating_orders
FROM amazon
WHERE rating > 9;

-- 25.Find the Customer types and Quantity Purchased?
SELECT 'customer_type', SUM(quantity) AS total_quantity
FROM amazon
GROUP BY 'customer_type';


 