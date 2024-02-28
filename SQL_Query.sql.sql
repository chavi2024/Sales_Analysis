select * from sales;

-----------------------Feature Engineering steps-----------------------

--(1)Adding new column 'time_of_day'.

Select time,(CASE WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
            When time BETWEEN '12:00:01' AND '16:00:00' THEN 'Afternoon'
			ELSE 'Evening' END) as time_of_day
FROM sales;	

Alter table sales
ADD COLUMN time_of_day varchar(15);

update sales 
set time_of_day= (CASE WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
            When time BETWEEN '12:00:01' AND '16:00:00' THEN 'Afternoon'
			ELSE 'Evening' END);
			
--checking new column 'time_of_day'	in sales table
SELECT * 
FROM sales;

--(2)Adding new column 'day_name'.
Select date,to_char(date,'Day')
FROM sales;

ALTER TABLE sales 
ADD COLUMN day_name varchar(15);

UPDATE sales
SET day_name= to_char(date,'Day');

-- checking new column 'day_name' in sales table
SELECT * 
FROM sales;

--(3).Adding new column 'month_name'.
Select date,to_char(date,'Month')
FROM sales;

ALTER TABLE sales 
ADD COLUMN month_name varchar(20);

UPDATE sales
SET month_name= to_char(date,'Month');

-- checking new column 'month_name' in sales table
SELECT * 
FROM sales;

-- so all three columns 'time_of_day', 'day_name', 'month_name' are added to sales table ----------


-------------------------------EXPLORATORY DATA ANALYSIS (EDA)----------------------------------------
---------------------------------Generic Questions----------------------------------------------------
--(Q1).How many distinct cities are there in the dataset?

SELECT count(DISTINCT city)  
FROM sales;

--(Q2).In which city is each branch situated?
SELECT DISTINCT branch,city
FROM sales;

----------------------------------Product Analysis---------------------------------------------------------

--(Q1). How many unique product lines are there in the dataset?

SELECT COUNT(DISTINCT product_line)
FROM sales;

--(Q2).what is the most common payment method?
SELECT payment_method,count(*)
FROM sales
GROUP BY payment_method
ORDER BY count(*) desc
LIMIT 1;

--(Q3)What is the most selling product line?
SELECT product_line,count(*)
FROM sales
GROUP BY product_line
ORDER BY count(*) DESC
LIMIT 1;

--(Q4).What is the total revenue by month
SELECT month_name,SUM(total) as total_revenue
FROM sales
GROUP BY month_name;

--(Q5)Which month has the highest COGS?
SELECT month_name, SUM(cogs) total_cogs
FROM sales
GROUP BY month_name
ORDER by total_cogs DESC
LIMIT 1;

--(Q6)Which product line had the largest revenue?
SELECT product_line, SUM(total) total_revenue
FROM sales
GROUP BY product_line
ORDER by total_revenue DESC
LIMIT 1;

--(Q7).Which city has the largest revenue?
SELECT city, SUM(total) total_revenue
FROM sales
GROUP BY city
ORDER by total_revenue DESC
LIMIT 1;

--(Q8). Which product line has the largest VAT?
SELECT product_line, SUM(vat) total_vat
FROM sales
GROUP BY product_line
ORDER by total_vat DESC
LIMIT 1;

--(Q9).List each product line and add column 'remarks' showing "Good" or "Bad" .
--"Good" is for those product lines when product average sale is greater than total average sales, else "Bad".
SELECT product_line, CASE WHEN AVG(total)>(SELECT AVG(TOTAL) FROM sales)THEN 'Good'
                          ELSE 'Bad' END as remarks
						  
FROM sales
GROUP BY product_line;

--(Q10).Which branch sold more products than average products sold?
SELECT branch, sum(quantity) as total_quantity
FROM sales
group by branch
HAVING sum(quantity) > (SELECT round(avg(quantity),2) FROM sales);


--(Q11). What is the most common product line by gender?
select * from 
(SELECT  gender,product_line , count(product_line), rank() over(partition by gender order by count(product_line) desc)
										   
from sales
group by gender,product_line
) a
where rank =1;
-- so, 'Fashion accessories' is popular among females and 'Health and Beauty' is most popular among males.

--(Q12). What is the average rating of each product line?
select product_line, avg(rating) as average_rating
from sales 
group by product_line
order by average_rating desc

----------------------------------------Customer Analysis--------------------------------------------------------

--(Q1). How many unique customer types does the data have?

select distinct(customer_type)
from sales

--(Q2). How many unique payment methods does the data have?
select distinct(payment_method)
from sales;

--(Q3). What is the most common customer type?
select customer_type, count(*) total_count
from sales
group by customer_type
order by total_count desc;


--(Q4). Which customer type buys the most
select customer_type, count(*) total_count
from sales
group by customer_type
order by total_count desc;

--(Q5). What is the gender of most of the customers?
select gender,count(*) gender_count
from sales
group by gender
order by gender_count desc;

--(Q6)What is the gender distribution by branch?
select branch, gender, count(*)
from sales 
group by branch,gender
order by branch;

--(Q7) Which time of day do customers give most ratings?
select time_of_day, avg(rating) as average_rating
from sales
group by time_of_day
order by average_rating desc;

--(Q8)Which time of day do customers give most rating per branch?

select * from
(select branch, time_of_day, avg(rating),rank() over(partition by branch  order by avg(rating) desc)

from sales
group by branch,time_of_day) a
where rank=1;

--"A" :	"Afternoon"
--"B" :	"Morning"
--"C" :"Evening"

--(Q9). Which day of the week has the best average rating?

Select day_name, avg(rating) as average_rating
from sales 
group by day_name
order by average_rating desc;


--(Q10)Which day of the week has the best average ratings per branch?
select * from
(select branch, day_name, avg(rating),rank() over(partition by branch  order by avg(rating) desc)

from sales
group by branch,day_name) a
where rank=1;

"A"	:Friday   
"B"	:Monday   
"C"	:Friday   


----------------------------------------Sales Analysis-----------------------------------------------

--(Q1) Number of sales made in each time of the day per weekday

SELECT day_name,time_of_day, COUNT(*) AS total_sales
FROM sales
GROUP BY day_name,time_of_day 
ORDER BY day_name ;

--(Q2) Which of the customer types brings the most revenue?
select customer_type, sum(total) as total_revenue
from sales
group by customer_type
order by total_revenue desc;

--(Q3). Which city collected the maximum VAT?
select city, sum(vat) as total_vat
from sales
group by city
order by total_vat desc
limit 1;

--(Q4). Which customer type  pays the most in vat?
							  
select customer_type, sum(vat) as total_vat
from sales
group by customer_type
order by total_vat desc
limit 1;

-----------------------------------------------------------------------------------------------------------------------------------



