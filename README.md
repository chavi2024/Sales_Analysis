# WALMART SALES DATA ANALYSIS

 ## About
The objective of this project is to analyze sales data from Walmart stores to gain insights into top-performing branches, popular items, sales trends, and consumer behaviour. The dataset, sourced from the Kaggle Walmart Sales Forecasting Competition (https://www.kaggle.com/c/walmart-recruiting-store-sales-forecasting), serves as the basis for understanding how sales strategies can be optimized for greater effectiveness.


## Purpose
The primary goal of this project is to gain a deeper understanding of Walmart's sales data, focusing on the various factors influencing sales across its branches. 
The dataset comprises sales transactions from three distinct Walmart branches situated in Mandalay, Yangon, and Naypyitaw. It encompasses 17 columns and 1000 rows of data.

## Analysis process
### Data Wrangling: 
In this initial stage, the data undergoes inspection to identify and address NULL and missing values. Appropriate data replacement techniques are employed to handle any identified missing or NULL values.

1.	Create a Database:
(Create database if not exists sales;)

2.	Create the table and insert the data.
While creating the table in database, we set NOT NULL for each field, so null values are filtered out.
3.	After creating database, now we import the data from csv file.

### Feature Engineering
This process involves generating additional columns derived from existing ones to enhance data analysis.
1.	Introduce a new column called "time_of_day" to provide insights into sales patterns during Morning, Afternoon, and Evening periods. This assists in identifying the peak sales times throughout the day.
2.	Incorporate a new column named "day_name" to capture the specific day of the week for each transaction (Mon, Tue, Wed, Thur, Fri). This aids in understanding the busiest days for each branch.
3.	Integrate a new column named "month_name" to record the month of the year for each transaction (Jan, Feb, Mar). This facilitates the analysis of sales and profit trends across different months.

## BUSINESS QUESTIONS TO ANSWER:
### Generic Questions:
(Q1).How many distinct cities are there in the dataset?\
(Q2).In which city is each branch situated?

### Product Analysis
(Q1). How many unique product lines are there in the dataset?\
(Q2).what is the most common payment method?\
(Q3)What is the most selling product line?\
(Q4).What is the total revenue by month?\
(Q5)Which month has the highest COGS?\
(Q6)Which product line had the largest revenue?\
(Q7).Which city has the largest revenue?\
(Q8). Which product line has the largest VAT?\
(Q9).List each product line and add column 'remarks' showing "Good" or "Bad".\
(Q10).Which branch sold more products than average products sold?\
(Q11). What is the most common product line by gender?\
(Q12). What is the average rating of each product line?

### Customer Analysis
(Q1). How many unique customer types does the data have?\
(Q2). How many unique payment methods does the data have?\
(Q3). What is the most common customer type?\
(Q4). Which customer type buys the most?\
(Q5). What is the gender of most of the customers?\
(Q6)What is the gender distribution by branch?\
(Q7) Which time of day do customers give most ratings?\
(Q8)Which time of day do customers give most rating per branch?\
(Q9). Which day of the week has the best average rating?\
(Q10)Which day of the week has the best average ratings per branch?

### Sales Analysis
(Q1) Number of sales made in each time of the day per weekday?\
(Q2) Which of the customer types brings the most revenue?\
(Q3). Which city collected the maximum VAT?\
(Q4). Which customer type  pays the most in vat?










