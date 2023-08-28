/*PIZZA SALES SQL QUERIES*/

--1. Total Revenue
select SUM (total_price) as Total_Revenue 
from pizza_sales

--2. Total Average Orders
select SUM (total_price)/ count(distinct order_id) as Average_Order_Values 
from pizza_sales

--3. Total Pizza’s Sold
select SUM (quantity) as Total_Pizza_Sold 
from pizza_sales

--4. Total Orders
select count (distinct order_id) as Total_Orders 
from pizza_sales

--5. Average Pizza’s Per Order
select cast(cast(sum(quantity) as decimal(10,2))/ cast(count (distinct order_id)as decimal(10,2)) as decimal(10,2)) as Average_Pizza_Perorder from pizza_sales

--6. Daily Trend for All Orders
select datename(DW, order_date) as order_day, count (distinct order_id) as total_order 
from pizza_sales 
group by datename(DW, order_date)

--6. Monthly Trend for All Orders
select datename(month, order_date) as month_name, count (distinct order_id) as total_order 
from pizza_sales 
group by datename(month, order_date)

--7. % of Sales by Pizza Category
select pizza_category, sum(total_price) as Total_price, sum(total_price)*100/ 
(select sum(total_price) from pizza_sales where MONTH(order_date)=1) as total_sales_percentage 
from pizza_sales
where MONTH(order_date)=1
group by pizza_category

--8. % of Sales by Pizza Size for 1st Quarter 
select pizza_size, cast(sum(total_price) as decimal(10,2)) as Total_Sales, cast(sum(total_price)*100/ 
(select sum(total_price) from pizza_sales where DATEPART(quarter, order_date) =1) as decimal(10,2)) as total_sales_percentage 
from pizza_sales
where DATEPART(quarter, order_date) =1
group by pizza_size
order by total_sales_percentage desc

--9. Top 5 Pizza’s sold
SELECT top 5 pizza_name, sum(total_price) as total_revenue
from pizza_sales
group by pizza_name
order by total_revenue desc

--10. Bottom 5 Pizza’s sold
SELECT top 5 pizza_name, sum(total_price) as total_revenue
from pizza_sales
group by pizza_name
order by total_revenue 

--11. Bottom 5 Pizza’s based on Quantity
SELECT top 5 pizza_name, sum(quantity) as total_Quantity
from pizza_sales
group by pizza_name
order by total_Quantity 

--12. Top 5 Pizza’s based on Quantity
SELECT top 5 pizza_name, sum(quantity) as total_Quantity
from pizza_sales
group by pizza_name
order by total_Quantity desc

