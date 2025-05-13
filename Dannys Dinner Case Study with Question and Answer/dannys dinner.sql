create database dannys_dinner;
use dannys_dinner;
#1. What is the total amount each customer spent at the restaurant?							
 select customer_id,sum(price) as sum_of_price from sales inner join menu using(product_id) group by customer_id;
 #2. How many days has each customer visited the restaurant?						
select customer_id,count(distinct order_date) as D from sales inner join menu using(product_id) group by customer_id order by D DESC; 
#3. What was the first item from the menu purchased by each customer?							
SELECT customer_id, order_date, product_name
FROM (SELECT sales.*, menu.product_name, 
ROW_NUMBER() OVER (PARTITION BY sales.customer_id ORDER BY sales.order_date ASC) AS rn
FROM sales INNER JOIN menu ON sales.product_id = menu.product_id) AS t WHERE rn = 1;
#4. What is the most purchased item on the menu and how many times was it purchased by all customers?														
select * from (select product_name,count(*) as no_of_times,
rank() over(order by count(product_name)desc)as rn  
from sales s inner join menu m
using(product_id) group by product_name)as t where rn=1;
#5. Which item was the most popular for each customer?	
WITH most_popular_items AS (
    SELECT customer_id, product_name, no_of_orders,
           RANK() OVER (PARTITION BY customer_id ORDER BY no_of_orders DESC) AS rnk
    FROM (
        SELECT customer_id, product_name, COUNT(*) AS no_of_orders
        FROM sales s
        INNER JOIN menu m ON s.product_id = m.product_id
        GROUP BY customer_id, product_name
    ) AS t
)
SELECT customer_id, product_name, no_of_orders
FROM most_popular_items
WHERE rnk = 1;
select* from(
select customer_id,product_name,count(*) as no_of_orders,
rank() over(partition by customer_id order by count(*) desc)rnk
from sales s inner join menu m using(product_id)
group by customer_id,product_name)as t where rnk=1;
#6. Which item was purchased first by the customer after they became a member?							
WITH first_purchased AS (
    SELECT 
        s.customer_id,
        s.order_date,
        m.product_name,
        ROW_NUMBER() OVER (PARTITION BY s.customer_id ORDER BY s.order_date ASC) AS rn
    FROM sales s
    INNER JOIN members mb ON s.customer_id = mb.customer_id
    INNER JOIN menu m ON s.product_id = m.product_id
    WHERE s.order_date > mb.join_date
)
SELECT * 
FROM first_purchased 
WHERE rn = 1;
#7. Which item was purchased just before the customer became a member?	
WITH before_membership AS (
    SELECT 
        s.customer_id,
        s.order_date,
        m.product_name,
        ROW_NUMBER() OVER (PARTITION BY s.customer_id ORDER BY s.order_date DESC) AS rn
    FROM sales s
    JOIN members mb ON s.customer_id = mb.customer_id
    JOIN menu m ON s.product_id = m.product_id
    WHERE s.order_date < mb.join_date
)
SELECT customer_id, order_date, product_name
FROM before_membership
WHERE rn = 1;						
#8. What is the total items and amount spent for each member before they became a member?	
select s.customer_id,count(*) as total_items,sum(m.price) as total_spent from sales s inner join members b on s.customer_id =b.customer_id and s.order_date< b.join_date 
inner join menu m using (product_id) group by s.customer_id order by s.customer_id;		
#9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?							
select customer_id,sum(case when product_name = "sushi" then price*20 else price *10 end)
as total_points from sales s inner join menu m using(product_id) group by customer_id;
#10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?*/							
select s.customer_id,sum(case when order_date between join_date and date_add(join_date,interval 7 day) then price * 20 when product_name= "sushi" then price *20 else price*10 end) as
total_points from sales s inner join members mb using(customer_id) inner join menu m using(product_id)
where order_date<="2021-01-31"
group by s.customer_id order by customer_id;
#1. What is the total amount each customer spent at the restaurant?	
select customer_id,sum(price) as total_price from sales s inner join menu m using(product_id)
 group by customer_id order by total_price ;
 #2. How many days has each customer visited the restaurant?
 select customer_id,count(distinct order_date) as different_day from sales s inner join menu m using(product_id)
 group by customer_id order by different_day desc;
#3. What was the first item from the menu purchased by each customer?							
select customer_id,product_name,order_date from ( select s.*,m.product_name, 
row_number() over(partition by customer_id order by order_date asc)as rn 
from sales s inner join menu m using(product_id)) as s where rn=1;
SELECT customer_id, order_date, product_name
FROM (SELECT sales.*, menu.product_name, 
ROW_NUMBER() OVER (PARTITION BY sales.customer_id ORDER BY sales.order_date ASC) AS rn
FROM sales INNER JOIN menu ON sales.product_id = menu.product_id) AS t WHERE rn = 1;
#4. What is the most purchased item on the menu and how many times was it purchased by all customers?														
select * from(select count(*) as counts,product_name, 
rank() over(order by count(product_name) desc) as rn 
from sales s inner join menu m using(product_id) 
group by product_name)as k where rn=1;
select * from(select count(*) as k,product_name,
rank() over(order by count(product_name) desc) as en from sales s inner join menu m using(product_id)
 group by product_name)as p where en=1;
#5. Which item was the most popular for each customer?
select * from (select customer_id,product_name,count(*) as p,
 rank() over(partition by customer_id order by count(*) desc ) as drnk 
from sales s inner join menu m using(product_id)group by customer_id,product_name)as k where drnk=1; 
select* from(
select customer_id,product_name,count(*) as no_of_orders,
rank() over(partition by customer_id order by count(*) desc)rnk
from sales s inner join menu m using(product_id)
group by customer_id,product_name)as t where rnk=1;
select * from(select customer_id,product_name,count(*),
rank() over(partition by customer_id order by count(product_name))as rn from sales s inner join menu m using(product_id)
group by customer_id,product_name)as k where rn=1;
##6. Which item was purchased first by the customer after they became a member?	
select customer_id,order_date,product_name from(select s.customer_id,s.order_date,mb.product_name,
row_number() over(partition by s.customer_id order by s.order_date)as rnk 
from sales s inner join members m on s.customer_id=m.customer_id and s.order_date > m.join_date inner join
 menu mb on s.product_id=mb.product_id  )as k where rnk=1;
SELECT customer_id, order_date, product_name
FROM (SELECT s.customer_id,s.order_date,mb.product_name,
        ROW_NUMBER() OVER (PARTITION BY s.customer_id ORDER BY s.order_date) AS rnk
    FROM sales s INNER JOIN members m ON s.customer_id = m.customer_id INNER JOIN menu mb ON s.product_id = mb.product_id
    WHERE s.order_date > m.join_date) AS k WHERE rnk = 1;
#7. Which item was purchased just before the customer became a member?
select * from(select s.customer_id,m.product_name,s.order_date,
row_number() over(partition by s.customer_id order by s.order_date desc)as y 
from sales s inner join menu m on s.product_id=m.product_id
 inner join members md on md.customer_id=s.customer_id and s.order_date< md.join_date )as k where y=1;
 ##8. What is the total items and amount spent for each member before they became a member?
select s.customer_id,sum(m.price) as total ,count(*) from sales s inner join menu m on s.product_id=m.product_id
inner join members md on md.customer_id=s.customer_id and s.order_date< md.join_date group by s.customer_id order by s.customer_id;
select s.customer_id,count(*) as total_items,sum(m.price) as total_spent from sales s
 inner join members b on s.customer_id =b.customer_id and s.order_date< b.join_date 
inner join menu m using (product_id) group by s.customer_id order by s.customer_id;	
#	#9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?							
select customer_id,sum(case when product_name="sushi" then price*20 else price *10 end) as total_points from sales s 
inner join menu m using(product_id) group by customer_id;
select customer_id,sum(case when product_name = "sushi" then price*20 else price *10 end)
as total_points from sales s inner join menu m using(product_id) group by customer_id; 
#10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?*/							
SELECT s.customer_id, SUM(CASE WHEN (order_date BETWEEN join_date AND DATE_ADD(join_date, INTERVAL 7 DAY)) OR product_name = 'sushi' THEN price * 20 ELSE price * 10 END) AS total_points
 FROM sales s INNER JOIN members mb USING (customer_id) INNER JOIN menu m USING (product_id) WHERE order_date <= '2021-01-31' GROUP BY s.customer_id ORDER BY s.customer_id;

