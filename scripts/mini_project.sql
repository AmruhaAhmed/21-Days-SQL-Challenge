use idc_pizza;

-- List all unique pizza categories (DISTINCT)
SELECT DISTINCT category
FROM pizza_types;

-- Display pizza_type_id, name, and ingredients, replacing NULL ingredients with "Missing Data"
SELECT 
pizza_type_id AS "ID",
name,
IFNULL(ingredients,"Missing Data") AS "Ingredients"
FROM pizza_types
LIMIT 5; 

-- Check for pizzas missing a price
SELECT 
pizza_id AS "ID",
price
FROM pizzas
where price IS NULL;

-- Orders placed on '2015-01-01'
SELECT *
FROM orders
WHERE date='2015-01-01';

-- List pizzas with price descending.
SELECT
pizza_id AS "ID",
price
FROM pizzas
ORDER BY price DESC;

-- Pizzas sold in sizes 'L' or 'XL'
SELECT 
pizza_id AS "ID",
size
FROM pizzas
WHERE size IN ('L','XL');

-- Pizzas priced between $15.00 and $17.00
SELECT 
pizza_id AS "ID",
price
FROM pizzas
WHERE price BETWEEN 15.00 AND 17.00;

-- Pizzas with "Chicken" in the name
SELECT 
pizza_type_id AS "ID",
name
FROM pizza_types
WHERE name like "%Chicken%";

-- Orders on '2015-02-15' or placed after 8 PM
SELECT *
FROM orders
WHERE date="2015-02-15" OR STR_TO_DATE(time,"%H:%i:%s")>=MAKETIME(20,0,0);

-- Total quantity of pizzas sold
SELECT 
SUM(quantity) AS "Total Quantity"
FROM order_details;

-- Average pizza price
SELECT
ROUND(AVG(price),2) AS "Average Pizza Price"
FROM pizzas;

-- Total order value per order 
SELECT 
od.order_id,
SUM(od.quantity*p.price) AS "Total Order Value"
FROM order_details od LEFT JOIN pizzas p
ON od.pizza_id=p.pizza_id
GROUP BY od.order_id;

-- Total quantity sold per pizza category
SELECT 
pt.category AS "Pizza Category",
SUM(od.quantity) AS "Total Quantity"
FROM order_details od LEFT JOIN  pizzas p  
ON od.pizza_id=p.pizza_id
INNER JOIN pizza_types pt 
ON p.pizza_type_id=pt.pizza_type_id
GROUP BY pt.category;

-- Categories with more than 5,000 pizzas sold
SELECT 
pt.category AS "Pizza Category",
SUM(od.quantity) AS "Total Quantity"
FROM order_details od LEFT JOIN pizzas p 
ON od.pizza_id=p.pizza_id 
INNER JOIN pizza_types pt 
ON p.pizza_type_id=pt.pizza_type_id
GROUP BY pt.category
HAVING SUM(od.quantity)>5000;

-- Pizzas never ordered
SELECT 
p.pizza_id AS "Pizza ID"
FROM pizzas p LEFT JOIN order_details od
ON p.pizza_id=od.pizza_id
WHERE od.pizza_id IS NULL;

-- Price differences between different sizes of the same pizza
SELECT 
p1.pizza_type_id AS "Pizza Type ID",
p1.size AS "Size 1",
p2.size AS "Size 2",
p1.price AS "Price 1",
p2.price AS "Price 2",
ABS(p1.price - p2.price) AS "Price Difference"
FROM pizzas p1  JOIN pizzas p2 
ON p1.pizza_type_id=p2.pizza_type_id AND p1.size!=p2.size ;



