--TOTAL REVENUE--
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales

SELECT * FROM pizza_sales

--AVERAGE ORDER VALUES--
SELECT SUM(total_price)/COUNT(DISTINCT order_id) AS Avg_Order_Value FROM pizza_sales

--TOTAL PIZZAS SOLD--
SELECT SUM(quantity) AS Total_Pizza_Sold FROM pizza_sales

--TOTAL ORDERS--
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales

--AVERAGE PIZZAS PER ORDER--
SELECT CAST(SUM(quantity) AS DECIMAL(10,2))/CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS Avg_Pizzas_per_Order FROM pizza_sales


SELECT * FROM pizza_sales

--HOURLY TREND FOR TOTAL ORDERS--
SELECT DATEPART (HOUR, order_time) AS order_hour, SUM(quantity) AS total_pizzas_sold
FROM pizza_sales
GROUP BY DATEPART (HOUR, order_time)
ORDER BY DATEPART (HOUR, order_time) ASC

--WEEKLY TREND FOR TOTAL ORDERS--
SELECT DATEPART(ISO_WEEK, order_date) AS week_no, YEAR(order_date) AS order_year, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DATEPART(ISO_WEEK, order_date), YEAR(order_date)
ORDER BY DATEPART(ISO_WEEK, order_date), YEAR(order_date)

--PERCENTAGE OF SALES BY PIZZA CATEGORY--
SELECT pizza_category, SUM(total_price) AS total_sales, SUM(total_price) * 100/ (SELECT SUM(total_price) FROM pizza_sales) AS pct_by_category
FROM pizza_sales
GROUP BY pizza_category

--PERCENTAGE OF SALES BY PIZZA SIZE--
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) AS total_sales, CAST(SUM(total_price) * 100/ (SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL (10,2)) AS pct_by_size 
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pct_by_size desc

----TOP/BOTTOM 5 BEST SEELERS BY 
--1 REVENUE
SELECT  TOP 5 pizza_name, SUM(total_price) AS total_revenue FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue DESC

--2 TOTAL QUANTITY 
SELECT  TOP 5 pizza_name, SUM(quantity) AS total_quantity FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity DESC

--3 TOTAL ORDERS
SELECT  TOP 5 pizza_name, COUNT(DISTINCT order_id) AS total_orders FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_orders DESC

--BOTTOM 5 BEST SEELERS BY REVENUE, TOTAL QUANTITY AND TOTAL ORDERS--
SELECT  TOP 5 pizza_name, SUM(total_price) AS total_revenue FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue 

--TOTAL QUANTITY
SELECT  TOP 5 pizza_name, SUM(quantity) AS total_quantity FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity

--TOTAL ORDERS
SELECT  TOP 5 pizza_name, COUNT(DISTINCT order_id) AS total_orders FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_orders
