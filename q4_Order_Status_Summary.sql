-- Question #4: 
-- Create an overview of the orders by state. Summarize for each customer the number of orders that have 
--status of Complete, or Canceled (Returned of Cancelled).

-- Exclude all orders that are still in progress (Processing or Shipped) and only include orders
--for customers that have a state available.


WITH temp_table1 AS (
SELECT 
	cus.state
	, COUNT (ord.order_id) AS orders
FROM customers cus 
INNER JOIN orders ord ON cus.customer_id = ord.user_id
WHERE 1=1 
	AND ord.status NOT IN ('Processing', 'Shipped')
GROUP BY cus.state
),

temp_table2 AS (
SELECT 
	cus.state
	, COUNT (ord.order_id) AS COMPLETED
FROM customers cus 
INNER JOIN orders ord ON cus.customer_id = ord.user_id
WHERE 1=1 
	AND ord.status = 'Complete'
GROUP BY cus.state
), 

temp_table3 AS (
SELECT 
	cus.state
	, COUNT (ord.order_id) AS CANCELLED
FROM customers cus 
INNER JOIN orders ord ON cus.customer_id = ord.user_id
WHERE 1=1 
	AND ord.status IN ('Returned', 'Cancelled')
GROUP BY cus.state
)

SELECT 
	tt1.state
  , tt1.orders
  , tt2.COMPLETED 
  , tt3.CANCELLED
FROM temp_table1 tt1
INNER JOIN temp_table2 tt2 ON tt1.state = tt2.state
INNER JOIN temp_table3 tt3 ON tt1.state = tt3.state