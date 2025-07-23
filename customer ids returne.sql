-- Retrieve the customer details for all the customer ids returned in the query above.(updated query)
WITH customer_spending AS (
    SELECT customer_id, 
    	SUM(total_amount) AS total_spent
    FROM orders
    GROUP BY customer_id
),
top_customers AS (
    SELECT customer_id, total_spent
    FROM customer_spending
    ORDER BY total_spent DESC
    LIMIT 3
)
SELECT 
    c.customer_id, c.name, tc.total_spent
from customers c
JOIN top_customers tc ON c.customer_id = tc.customer_id
ORDER BY tc.total_spent DESC;