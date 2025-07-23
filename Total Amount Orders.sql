-- find orders where the total amount is greater than the average order total for that customer 
WITH customer_avg AS (
    SELECT customer_id, AVG(total_amount) AS avg_order_total
    FROM orders
    GROUP BY 
        customer_id
)
SELECT 
    o.order_id,
    o.customer_id,
    o.order_date,
    o.total_amount,
    c.avg_order_total
FROM orders o
JOIN customer_avg c ON o.customer_id = c.customer_id
WHERE 
    o.total_amount > c.avg_order_total;



