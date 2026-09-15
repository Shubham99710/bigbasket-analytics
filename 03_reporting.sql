
-- 5(a). Product tiering based on total delivered revenue
SELECT p.product_name,
       SUM(o.amount_inr) AS total_revenue,
       CASE
           WHEN SUM(o.amount_inr) >= 3000 THEN 'High'
           WHEN SUM(o.amount_inr) >= 1000 THEN 'Medium'
           ELSE 'Low'
       END AS revenue_tier
FROM products p
LEFT JOIN orders o ON p.product_id = o.product_id
WHERE o.status = 'Delivered'
GROUP BY p.product_name;

-- 5(b). Monthly Category Revenue Business Report
SELECT 
    p.category,
    strftime('%Y-%m', o.order_date) AS month,
    COUNT(o.order_id) AS order_count,
    SUM(o.amount_inr) AS total_revenue,
    AVG(o.amount_inr) AS avg_revenue
FROM orders o
INNER JOIN products p ON o.product_id = p.product_id
WHERE o.status = 'Delivered'
GROUP BY p.category, month
ORDER BY p.category, month;

-- 5(c) Category Target Variance Query
WITH category_revenue AS (
    SELECT 
        p.category,
        SUM(o.amount_inr) AS total_revenue
    FROM orders o
    INNER JOIN products p ON o.product_id = p.product_id
    WHERE o.status = 'Delivered'
    GROUP BY p.category
)
SELECT 
    t.category,
    COALESCE(r.total_revenue, 0) AS total_revenue,
    t.target_revenue_inr,
    (t.target_revenue_inr - COALESCE(r.total_revenue, 0)) AS variance,
    ((COALESCE(r.total_revenue, 0) - t.target_revenue_inr) * 100.0) / t.target_revenue_inr AS percentage_variance,
    CASE 
        WHEN COALESCE(r.total_revenue, 0) >= t.target_revenue_inr THEN 'Above Target'
        WHEN ((t.target_revenue_inr - COALESCE(r.total_revenue, 0)) * 100.0) / t.target_revenue_inr <= 15.0 THEN 'Below Target - Watch'
        ELSE 'Below Target - Critical'
    END AS performance_tag
FROM category_targets t
LEFT JOIN category_revenue r ON t.category = r.category;
