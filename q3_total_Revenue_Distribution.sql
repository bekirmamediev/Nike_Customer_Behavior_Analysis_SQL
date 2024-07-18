-- Question #3: 
-- The Nike Official leadership team is keen to understand what % of the total revenue per state
--is coming from the Nike Official business.

-- Create list that shows the total revenue (aggregate of the sales price) per state, 
--the revenue generated from Nike Official, and the % of the Nike Official revenue compared to the total revenue for every state.

-- Only include orders that have not been cancelled or returned and order the tableto show the state 
--with the highest amount of revenue first, even is there is no information available about the state.

revenue per state 
reneue of nike of
% nike of total 

WITH comon_table AS (
	SELECT * 
  FROM order_items oi
  UNION ALL 
  SELECT * 
  FROM order_items_vintage oiv
), 

 customer_table AS (
   SELECT 
   	*
   	, COALESCE (state, 'Miss Data') AS states
   FROM customers
),

tr_table AS (
SELECT 
	cus.states
  , SUM (ct.sale_price) AS total_revenue
FROM comon_table ct 
INNER JOIN orders ON ct.order_id = orders.order_id  
INNER JOIN customer_table cus ON ct.user_id = cus.customer_id
WHERE orders.status NOT IN ('Cancelled', 'Returned')  
GROUP BY cus.states

), 

nor_table AS ( 
  SELECT 
  	cus.states
  	, SUM (sale_price) AS nor_revenue
  FROM order_items oi
  INNER JOIN orders ON oi.order_id = orders.order_id  
  INNER JOIN customer_table cus ON oi.user_id = cus.customer_id
  WHERE orders.status NOT IN ('Cancelled', 'Returned')
  GROUP BY   cus.states
) 

SELECT 
	tr_table.states
  , tr_table.total_revenue AS Nike_revenue
  , nor_table.nor_revenue AS Nike_Official_revenue
  , (nor_table.nor_revenue/tr_table.total_revenue)*100 AS persent
FROM tr_table 
INNER JOIN nor_table ON tr_table.states = nor_table.states
ORDER BY 2 DESC
