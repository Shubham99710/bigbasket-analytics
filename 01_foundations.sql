
-- 1. Orders in Bengaluru
SELECT o.*
FROM orders o
JOIN customers c ON o.customre_id = c.customer_id
WHERE c.city = 'Bengaluru';

-- 2. List all unique categories
SELECT DISTINCT category
FROM products;

-- 3. Top 5 highest value orders
SELECT *
FROM orders
ORDER BY amount_inr DESC
LIMIT 5;

-- 4. Total Order count aliased
SELECT COUNT(*) AS total_orders
FROM orders;

-- 5. Orders paid by UPI or Credit Card
SELECT *
FROM orders
WHERE payment_method IN ("UPI", "Credit Card");

-- 6. Orders with amount between 100 and 500 inr
SELECT *
FROM orders
WHERE amount_inr BETWEEN 100 AND 500;

--7. Orders with amount outside 100 and 500 inr
SELECT *
FROM orders
WHERE amount_inr NOT BETWEEN 100 AND 500;

-- 8. Orders with no rating (Cancelled or Pending)
SELECT *
FROM orders
WHERE rating IS NULL;

-- 9. Orders with rating greater than 3(TEST ONLY)
SELECT *
FROM orders
WHERE rating > 3;
