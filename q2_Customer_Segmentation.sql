-- Question #2: 
-- Combine the order item data from Nike Official and Nike Vintage, and segment customers into three segments.
-- (1) Customers that only purchased a single product; 
-- (2) Customers that purchased more than 1 product; 
-- (3) “Missing Data” (if none of these conditions match)

-- How many customers and how much revenue (aggregate of the sales price) falls in each segment?

-- Only include orders that have not been cancelled or returned.
-- To make you think: what type of data could fall under the third bucket?

WITH comon_table AS (
	SELECT * 
  FROM order_items oi
  UNION ALL 
  SELECT * 
  FROM order_items_vintage oiv
),

temp_product AS (
SELECT ct.user_id
  , SUM (ct.sale_price) AS total_revenue
	, COUNT (ct.product_id) AS products
  , CASE WHEN COUNT (ct.product_id) = 1 THEN 'single'
  		 WHEN COUNT (ct.product_id) > 1 THEN 'more than 1'
       ELSE 'missing data'
  END AS purchases 
FROM comon_table ct
INNER JOIN orders ord ON ct.order_id = ord.order_id
  WHERE ord.status NOT IN ('Cancelled', 'Returned')
GROUP BY ct.user_id
) 

SELECT 
	purchases
	, COUNT (user_id) AS users 
  , SUM (total_revenue) as all_revenue
FROM temp_product 
GROUP BY purchases
