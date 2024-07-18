-- Question #1: 
-- What are the top customers by the total amount of revenue 
--(aggregate of the sales price) for the Nike Official and Nike Vintage business units combined?
-- Include the customer id, the total revenue, and the number of order items each customer has purchased. 
-- Only include orders that have not been cancelled or returned.

customers total_revenue  number_oforder_item


WITH comon_table AS (
	SELECT * 
  FROM order_items
  UNION ALL 
  SELECT * 
  FROM order_items_vintage
),  

rev_user_table AS (
SELECT 
	user_id
  , COUNT (order_item_id) AS total_orders
  , SUM (sale_price) AS total_revenue 
FROM comon_table
GROUP BY user_id
)

SELECT 
	rut.user_id
  , rut.total_orders
  , rut.total_revenue
FROM rev_user_table rut 
INNER JOIN orders od
ON rut.user_id = od.user_id
WHERE od.status NOT IN ('Cancelled', 'Returned')
ORDER BY 3 DESC