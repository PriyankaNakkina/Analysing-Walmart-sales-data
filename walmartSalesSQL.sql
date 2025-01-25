create database if not exists salesdataWalmart;

use salesdataWalmart;

create table if not exists sales(
invoice_id varchar(30) not null primary key,
branch varchar(5),
city varchar(30),
customer_type varchar(30),
gender varchar(30),
product_line varchar(100),
unit_price decimal(10,2),
quantity int,
vat float(6,4),
total decimal(10,2),
date date,
time timestamp,
payment_method decimal(10,2),
cogs decimal(10,2),
gross_margin_percentage float(11,9),
gross_income decimal(10,2),
rating float(2,1)
);

select * from salesdataWalmart.sales;
ALTER TABLE salesdataWalmart.sales
MODIFY COLUMN date date;

SET SQL_SAFE_UPDATES = 0;

UPDATE salesdataWalmart.sales
SET time = STR_TO_DATE(time, '%H:%i:%s')
WHERE time LIKE '__:__:__';

------------------------------------------------------------------------------------------------
----------------- Feature Engineering ------------------------------------------------------------

-- time_of_day

select
time,
(case when 'time' between "00:00:00" and "12:00:00" then "morning"
      when 'time' between "12:00:00" and "16:00:00" then "afternoon"
      else "evening"
      end
) as time_of_date
from sales;

-- adding a colunm to sales table
alter table sales add column time_of_date varchar(20) ;

-- by using the update statement we are updating the records
update sales
set time_of_date = (
case when 'time' between "00:00:00" and "12:00:00" then "morning"
      when 'time' between "12:00:00" and "16:00:00" then "afternoon"
      else "evening"
      end
);

-- day_name
-- dayname gives you the day of the week 
select
     date,
     dayname(date)
     from sales;
     
-- adding a column     
alter table sales add column day_name varchar(20);

-- updating column
update sales
set day_name = dayname(date);


-- month name

select 
date,
monthname(date)
from sales;

-- adding column  
alter table sales add column month_name varchar(15);

-- updating month_name column
update sales
set
month_name = monthname(date);

-----------------------------------------------------------------------------------------------

------------ BUSINESS Question -------------------------------------------------------------------------------------------------
------------ Generic Question ------------------------------------------------------------------

-- How many unique cities does the data have?

select distinct city from salesdataWalmart.sales;

-- In which city is each branch?

select branch, city from salesdataWalmart.sales
group by city;

------------------------------------ Product -------------------------------------

-- How many unique product lines does the data have?
select distinct Product_line from salesdataWalmart.sales ;

-- common payment method

select count(payment) as highest_used_payment, payment from sales
group by payment;

-- most selling product line

select sum(quantity) as sold_products, product_line from sales
group by product_line
order by sold_products desc;

-- What is the total revenue by month?

select floor(sum(total)), month_name
from sales
group by month_name;

-- month has largest cogs

select month_name, sum(cogs)
from sales
group by month_name;

-- product line had the largest revenue

select floor(sum(total)), product_line from sales 
group by product_line;

-- city with largest revenue
select floor(sum(total)), city from sales 
group by city;

-- product line has largest VAT

select avg(tax), product_line from sales 
group by product_line;

-- Fetch each product line and add a column to those product line showing "Good", "Bad". 
-- Good if its greater than average sales

SELECT 
    product_line, 
    CASE 
        WHEN avg_qty > 6 THEN 'Good'
        ELSE 'Bad'
    END AS performance
FROM (
    SELECT 
        product_line, 
        AVG(quantity) AS avg_qty
    FROM sales
    GROUP BY product_line
) a;

-- Which branch sold more products than average product sold?

select branch,
sum(quantity) as qnty
from sales
group by branch
having sum(quantity) > (select avg(quantity) from sales) ;

-- What is the most common product line by gender?

select gender, 
product_line,
count(gender) as cnt_gender
from sales
group by gender, product_line;

-- What is the average rating of each product line?

select 
product_line,
avg(rating) as avg_rating
from sales
group by product_line; 

------------------------------- SALES --------------------------------------------------

-- Number of sales made in each time of the day per weekday

SELECT
TIME_OF_DATE,
COUNT(*) AS TOTAL_SALES
FROM sales
WHERE DAY_NAME = 'SUNDAY'
GROUP BY TIME_OF_DATE;

-- Which of the customer types brings the most revenue?

SELECT
	Customer_type,
	SUM(total) AS total_revenue
FROM sales
GROUP BY Customer_type
ORDER BY total_revenue;

-- Which city has the largest tax/VAT percent?
SELECT
	city,
    ROUND(AVG(tax_pct), 2) AS avg_tax_pct
FROM sales
GROUP BY city 
ORDER BY avg_tax_pct DESC;

-- Which customer type pays the most in VAT?
SELECT
	customer_type,
	AVG(tax_pct) AS total_tax
FROM sales
GROUP BY customer_type
ORDER BY total_tax;



select * from sales;
ALTER TABLE sales
CHANGE COLUMN `Tax 5%` `tax` decimal(10,2);





drop table sales;
drop table saless;
