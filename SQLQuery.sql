select * from pizza_sales
-- Total Revenue
select 
		sum(total_price) as Total_Revenue
from
		pizza_sales

-- Average Order Value
select 
		sum(total_price) / count(distinct order_id) as Average_Order_Value
from
		pizza_sales

-- Total Pizzas Sold
select 
		sum(quantity) as Total_Pizzas_Sold
from
		pizza_sales
-- Total Orders
select 
		count(distinct order_id) as Total_Orders
from
		pizza_sales

-- Average Pizzas Per Order
select 
		cast(cast (sum(quantity) as decimal (10,2)) / cast (count(distinct order_id)as decimal (10,2)) as decimal (10,2))  as Average_Pizzas_Per_Order
from 
		pizza_sales

-- Daily Trend for Total Orders
select 
		DATENAME(DW,order_date) as order_date ,
		count(distinct order_id)as total_order
from
		pizza_sales
group by
		DATENAME(DW,order_date)

-- Monthly Trend for Orders
select 
		DATENAME(MONTH,order_date) as order_month ,
		count(distinct order_id)as total_order
from
		pizza_sales
group by
		DATENAME(MONTH,order_date)

-- % of Sales by Pizza Category
select 
		pizza_category,
		sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as PCT
from
		pizza_sales
group by
		pizza_category

-- % of Sales by Pizza Size
select 
		pizza_size,
		sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as PCT
from
		pizza_sales
group by
		pizza_size

-- Total Pizzas Sold by Pizza Category
select
		pizza_category,
		sum(quantity) as Total_sold
from
		pizza_sales
group by
		pizza_category

-- Top 5 Pizzas by Revenue
select 
		top 5 pizza_name,
		sum(total_price) as total_price
from
		pizza_sales
group by
		pizza_name
order by
		total_price desc
		
-- Bottom 5 Pizzas by Revenue
select 
		top 5 pizza_name,
		sum(total_price) as total_price
from
		pizza_sales
group by
		pizza_name
order by
		total_price asc

-- Top 5 Pizzas by Quantity
select 
		top 5 pizza_name,
		sum(quantity) as total_quantity
from
		pizza_sales
group by
		pizza_name
order by
		total_quantity desc

--  Bottom 5 Pizzas by Quantity
select 
		top 5 pizza_name,
		sum(quantity) as total_quantity
from
		pizza_sales
group by
		pizza_name
order by
		total_quantity asc
-- Top 5 Pizzas by Total Orders
select 
		top 5 pizza_name,
		count(distinct order_id) as total_orders
from
		pizza_sales
group by
		pizza_name
order by
		total_orders desc

-- Bottom 5 Pizzas by Total Orders
select 
		top 5 pizza_name,
		count(distinct order_id) as total_orders
from
		pizza_sales
group by
		pizza_name
order by
		total_orders asc
