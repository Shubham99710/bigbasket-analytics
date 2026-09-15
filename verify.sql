-- VERIFICATION RESULTS
-- products count: 31
-- customers count: 50
-- orders count: 500
-- category_targets count: 6
-- Status Breakdown: Cancelled (42), Delivered (434), Pending (24)

SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM category_targets;

SELECT status, COUNT(*) AS status_count
FROM orders
GROUP BY status;
