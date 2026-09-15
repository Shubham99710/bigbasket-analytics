
-- 4(a). INNER JOIN: Category aggregation for delivered orders with HAVING filter
SELECT p.category,
       COUNT(o.order_id) AS order_count,
       SUM(o.amount_inr) AS total_revenue,
       AVG(o.amount_inr) AS avg_revenue
FROM orders o
INNER JOIN products p ON o.product_id = p.product_id
WHERE o.status = 'Delivered'
GROUP BY p.category
HAVING total_revenue > 10000;

-- 4(b). LEFT JOIN: Product order count including products with 0 counts
SELECT p.product_id,
       p.product_name,
       COUNT(o.order_id) AS total_orders
FROM products p
LEFT JOIN orders o ON p.product_id = o.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_orders ASC;
