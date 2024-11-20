create database unified_mentor;

use unified_mentor;

select * from pizza_sales;

-- Q1) Total Revenue
select round(sum(total_price),3) as `Total_Revenue` from pizza_sales;

-- Q2) Average order value
select round(sum(total_price)/count(distinct order_id),3) as `Average_order` from pizza_sales;

-- Q3) Total pizza sold
select sum(quantity) as `Total_Sold` from pizza_sales;

-- Q4) Total orders
select count(distinct order_id) as `Total_orders` from pizza_sales;

-- Q5) Average pizza per order 
select round(sum(quantity)/count(distinct order_id),3) as `Avg_pizzaper_order` from pizza_sales;

-- Q6) Daily Trends for Total orders
create view Daily_Trends as (
select dayname(str_to_date(order_date,'%y-%m-%d')) as `dayname`,
count(distinct order_id) as `Total_orders`
 from pizza_sales group by `dayname` order by field(dayname,'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'));

-- Q7) Monthly Trends for orders
create view Monthly_Trend as (
select monthname(str_to_date(order_date,'%y-%m-%d')) as `Monthname`,
count(distinct order_id) as `Total_Orders` from pizza_sales group by
`Monthname` order by field(Monthname,'January','February','March','April','May','June','July','August','September','October','November','December')); 

-- Q8) Sales by pizza_category
create view Revenue_pizza_category as (
select pizza_category, round(sum(total_price),3) as `Total_Revenue` from pizza_sales
group by pizza_category);

-- Q9) Sales by pizza_size
create view pizza_size_sales as(
select pizza_size, round(sum(total_price),3) as `Total_Revenue` from pizza_sales
group by pizza_size);

-- Q10) Total pizza sold pizza_category
create view pizza_category_sales as(
select pizza_category, sum(quantity) as 'Total_quantity_sold' from pizza_sales
group by pizza_category);

-- Q11) Top 5 pizza by revenue
create view sales_pizza_name as(
select pizza_name, sum(total_price) as `Total_revenue` from pizza_sales
group by pizza_name order by Total_revenue desc limit 5);

-- Q12) Bottom 5 pizza by revenue
create view bottom_pizza_sales as(
select pizza_name, round(sum(total_price),3) as `Total_revenue` from pizza_sales
group by pizza_name order by Total_revenue asc limit 5);

-- Q13) Top 5 pizza by Total orders
create view pizza_total_orders as(
select pizza_name, count(distinct order_id) as `Total_Orders` from pizza_sales
group by pizza_name order by Total_orders desc limit 5);

-- Q14) Bottom 5 pizza by Total orders
create view bottom_pizza_orders as (
select pizza_name, count(distinct order_id) as `Total_Orders` from pizza_sales
group by pizza_name order by Total_orders asc limit 5);
select * from bottom_pizza_orders;
-- Q15) Top 5 pizza by quantity
create view pizza_quantity as (
select pizza_name, sum(quantity) as `Total_pizza_sold` from pizza_sales
group by pizza_name order by Total_pizza_sold desc limit 5);

-- Q16) Bottom 5 pizza by quantity
create view bottom_pizza_quantity as (
select pizza_name, sum(quantity) as `Total_pizza_sold` from pizza_sales
group by pizza_name order by Total_pizza_sold asc limit 5);





