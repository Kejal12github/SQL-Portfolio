create database bike;
use bike;
create table bikesales (
date date not null,
customer_id int not null,
customer_age int not null,
age_group text not null,
customer_gender text not null,
country text not null,
product_category text not null,
sub_category text not null,
product text not null,
order_quantity int not null,
unit_cost int not null,
unit_price int not null,
cost int not null,
revenue int not null,
profit int not null );


-- Bike Sales Analysis in Europe
select * from bikesales limit 10;

-- No of Counts
select count(*) as no_of_counts from bikesales;

-- Total Revenue and Profit
select 
sum(profit) as Total_profit,
sum(revenue) as total_revenue
from bikesales;

-- What are the top-selling product categories in terms of revenue?
Select 
product_category , sum(revenue) as revenue
from bikesales
group by product_category
order by revenue desc limit 1 ;

-- How does the customer age group impact the average unit price of products purchased?
Select 
customer_age , avg(unit_price) as unit_price
from bikesales
group by customer_age 
order by unit_price desc limit 1 ;

-- Which countries have the highest and lowest average profit margins?
Select 
country,
(sum(profit)/sum(revenue))*100 as profit_margin
from bikesales
group by country 
order by profit_margin desc , country asc ;

-- What is the distribution of product categories across different country?
select
country , product_category,
sum(Order_Quantity) as distribution
from bikesales
group by country , product_category
order by distribution desc;

-- What is the average profit per order for each sub-category of products?
select
sub_category, avg(profit) as avg_profit
from bikesales
group by sub_category
order by avg_profit desc;

-- How does the customer age group impact the revenue generated?
select
age_group , sum(revenue) as revenue
from bikesales
group by age_group 
order by revenue desc;

-- Which sub-categories of products have the highest profit margins?
select
sub_category,
(sum(profit)/sum(revenue))*100 as profit_margin
from bikesales
group by sub_category
order by profit_margin desc , sub_category asc ;

-- What is the relationship between unit cost and unit price for different product categories?
select
product_category,
avg(unit_cost) as unit_cost ,
avg(unit_price) as unit_price
from bikesales
group by product_category 
order by unit_cost desc , unit_price desc;
