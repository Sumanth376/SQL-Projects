-- Create Schema
CREATE SCHEMA IF NOT EXISTS pizza_runner;


-- Drop and Create Runners Table
DROP TABLE IF EXISTS runners;
CREATE TABLE runners (
    runner_id INTEGER PRIMARY KEY,
    registration_date DATE NOT NULL
);

INSERT INTO runners (runner_id, registration_date) VALUES
(1, '2021-01-01'),
(2, '2021-01-03'),
(3, '2021-01-08'),
(4, '2021-01-15');

-- Drop and Create Customer Orders Table
DROP TABLE IF EXISTS customer_orders;
CREATE TABLE customer_orders (
    order_id INTEGER,
    customer_id INTEGER NOT NULL,
    pizza_id INTEGER NOT NULL,
    exclusions TEXT,
    extras TEXT,
    order_time TIMESTAMP NOT NULL,
    PRIMARY KEY (order_id, customer_id, pizza_id)
);

INSERT INTO customer_orders (order_id, customer_id, pizza_id, exclusions, extras, order_time) VALUES
(1, 101, 1, NULL, NULL, '2020-01-01 18:05:02'),
(2, 101, 1, NULL, NULL, '2020-01-01 19:00:52'),
(3, 102, 1, NULL, NULL, '2020-01-02 23:51:23'),
(3, 102, 2, NULL, NULL, '2020-01-02 23:51:23'),
(4, 103, 1, '4', NULL, '2020-01-04 13:23:46'),
(4, 103, 2, '4', NULL, '2020-01-04 13:23:46'),
(5, 104, 1, NULL, '1', '2020-01-08 21:00:29'),
(6, 101, 2, NULL, NULL, '2020-01-08 21:03:13'),
(7, 105, 2, NULL, '1', '2020-01-08 21:20:29'),
(8, 102, 1, NULL, NULL, '2020-01-09 23:54:33'),
(9, 103, 1, '4', '1, 5', '2020-01-10 11:22:59'),
(10, 104, 1, '2, 6', '1, 4', '2020-01-11 18:34:49');

-- Drop and Create Runner Orders Table
DROP TABLE IF EXISTS runner_orders;
CREATE TABLE runner_orders (
    order_id INTEGER NOT NULL,
    runner_id INTEGER NOT NULL,
    pickup_time TIMESTAMP,
    distance VARCHAR(10),
    duration VARCHAR(15),
    cancellation TEXT,
    PRIMARY KEY (order_id, runner_id)
);

INSERT INTO runner_orders (order_id, runner_id, pickup_time, distance, duration, cancellation) VALUES
(1, 1, '2020-01-01 18:15:34', '20km', '32 minutes', NULL),
(2, 1, '2020-01-01 19:10:54', '20km', '27 minutes', NULL),
(3, 1, '2020-01-03 00:12:37', '13.4km', '20 mins', NULL),
(4, 2, '2020-01-04 13:53:03', '23.4km', '40 mins', NULL),
(5, 3, '2020-01-08 21:10:57', '10km', '15 mins', NULL),
(6, 3, NULL, NULL, NULL, 'Restaurant Cancellation'),
(7, 2, '2020-01-08 21:30:45', '25km', '25 mins', NULL),
(8, 2, '2020-01-10 00:15:02', '23.4km', '15 minutes', NULL),
(9, 2, NULL, NULL, NULL, 'Customer Cancellation'),
(10, 1, '2020-01-11 18:50:20', '10km', '10 minutes', NULL);

-- Drop and Create Pizza Names Table
DROP TABLE IF EXISTS pizza_names;
CREATE TABLE pizza_names (
    pizza_id INTEGER PRIMARY KEY,
    pizza_name TEXT NOT NULL
);

INSERT INTO pizza_names (pizza_id, pizza_name) VALUES
(1, 'Meatlovers'),
(2, 'Vegetarian');

-- Drop and Create Pizza Recipes Table
DROP TABLE IF EXISTS pizza_recipes;
CREATE TABLE pizza_recipes (
    pizza_id INTEGER PRIMARY KEY,
    toppings TEXT NOT NULL
);

INSERT INTO pizza_recipes (pizza_id, toppings) VALUES
(1, '1, 2, 3, 4, 5, 6, 8, 10'),
(2, '4, 6, 7, 9, 11, 12');

-- Drop and Create Pizza Toppings Table
DROP TABLE IF EXISTS pizza_toppings;
CREATE TABLE pizza_toppings (
    topping_id INTEGER PRIMARY KEY,
    topping_name TEXT NOT NULL
);

INSERT INTO pizza_toppings (topping_id, topping_name) VALUES
(1, 'Bacon'),
(2, 'BBQ Sauce'),
(3, 'Beef'),
(4, 'Cheese'),
(5, 'Chicken'),
(6, 'Mushrooms'),
(7, 'Onions'),
(8, 'Pepperoni'),
(9, 'Peppers'),
(10, 'Salami'),
(11, 'Tomatoes'),
(12, 'Tomato Sauce');
#How many pizzas were ordered?
select count(*) as total_pizza from customer_orders;
#How many unique customer orders were made?
select count(distinct order_id) as ids from customer_orders;
#How many successful orders were delivered by each runner?
SELECT ro.runner_id, count(DISTINCT ro.order_id)  AS successful_orders
FROM runner_orders ro JOIN customer_orders co ON ro.order_id = co.order_id
GROUP BY ro.runner_id ORDER BY ro.runner_id;
select ro.runner_id,count(distinct ro.order_id) as successful_orders from runner_orders ro 
inner join customer_orders as co on ro.order_id=co.order_id group by ro.runner_id order by successful_orders;
#How many of each type of pizza was delivered?
SELECT pn.pizza_name, COUNT(co.pizza_id) AS total_delivered FROM customer_orders co JOIN pizza_names pn ON co.pizza_id = pn.pizza_id 
JOIN runner_orders ro ON co.order_id = ro.order_id GROUP BY pn.pizza_name ORDER BY total_delivered DESC;
#How many Vegetarian and Meatlovers were ordered by each customer?
select customer_id,sum(case when pizza_name="Meatlovers" then 1 else 0 end) as meat_lovers_count,sum(case when pizza_name="Vegetarian" then 1 else 0 end)as veg_lover_count
from customer_orders co inner join pizza_names pn on co.pizza_id=pn.pizza_id group by co.customer_id;
#What was the maximum number of pizzas delivered in a single order?
select order_id,pizza_count from (select co.order_id,count(*) as pizza_count,rank() over(order by count(*) desc) as rnk from customer_orders co inner join runner_orders ro on 
co.order_id=ro.order_id group by co.order_id) k where rnk=1;
SELECT order_id, pizza_count FROM (SELECT co.order_id, COUNT(*) AS pizza_count,RANK() OVER (ORDER BY COUNT(*) DESC) AS rnk FROM customer_orders co
JOIN runner_orders ro ON co.order_id = ro.order_id WHERE ro.cancellation IS NULL GROUP BY co.order_id) ranked_orders WHERE rnk = 1;
#For each customer, how many delivered pizzas had at least 1 change and how many had no changes?
SELECT co.customer_id,SUM(CASE WHEN (co.exclusions IS NOT NULL AND co.exclusions <> '') OR (co.extras IS NOT NULL AND co.extras <> '') THEN 1 ELSE 0 END) AS pizzas_with_changes,
SUM(CASE WHEN (co.exclusions IS NULL OR co.exclusions = '') AND (co.extras IS NULL OR co.extras = '') THEN 1 ELSE 0 END) AS pizzas_without_changes
FROM customer_orders co JOIN runner_orders ro ON co.order_id = ro.order_id WHERE ro.cancellation IS NULL GROUP BY co.customer_id ORDER BY co.customer_id;
#How many pizzas were delivered that had both exclusions and extras?
SELECT COUNT(*) AS pizzas_with_exclusions_and_extras FROM customer_orders co JOIN runner_orders ro ON co.order_id = ro.order_id
WHERE ro.cancellation IS NULL AND co.exclusions IS NOT NULL AND co.exclusions <> '' AND co.extras IS NOT NULL AND co.extras <> '';
#What was the total volume of pizzas ordered for each hour of the day?
SELECT EXTRACT(HOUR FROM order_time) AS order_hour, COUNT(*) AS total_pizzas FROM customer_orders GROUP BY order_hour ORDER BY order_hour;
#What was the volume of orders for each day of the week?
SELECT DAYNAME(order_time) AS order_day, COUNT(*) AS total_orders FROM customer_orders GROUP BY DAYNAME(order_time) ORDER BY total_orders DESC;