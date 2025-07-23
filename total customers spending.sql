--and that customer's total spending is above the global average customer spending 
WITH customer_spending AS (
    SELECT 
        customer_id,
        SUM(total_amount) AS total_spent
    FROM orders
    GROUP BY 
        customer_id
),
global_avg AS (
    SELECT AVG(total_spent) AS avg_customer_spending
    FROM customer_spending
)
SELECT cs.customer_id,cs.total_spent,ga.avg_customer_spending
FROM customer_spending cs,global_avg ga
WHERE cs.total_spent > ga.avg_customer_spending;