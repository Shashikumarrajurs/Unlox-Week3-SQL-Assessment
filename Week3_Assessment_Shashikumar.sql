USE flipcart;
-- ============================================
-- WEEK 3 SQL FOUNDATIONS ASSESSMENT
-- Name: Shashikumar
-- Database: flipcart
-- ============================================

USE flipcart;


-- ============================================
-- SECTION A - THEORY
-- ============================================

-- ============================================
-- SECTION A - THEORY
-- ============================================

-- A1. c
-- A2. b
-- A3. b
-- A4. c
-- A5. b
-- A6. c
-- A7. b
-- A8. c

SELECT COUNT(*)
FROM products
WHERE category = 'Electronics';
-- B1. 8
SELECT *
FROM products
WHERE price BETWEEN 1000 AND 3000;

-- B2. 11

SELECT product_name
FROM products
WHERE category = 'Books'
  AND price < 400
ORDER BY price DESC
LIMIT 1;
-- B3. The Silent Patient

SELECT *
FROM products
WHERE avg_rating IS NULL;
-- B4. 3

SELECT MAX(price)
FROM products
WHERE category = 'Books';
-- B5. 499.00

SELECT category, COUNT(*)
FROM products
WHERE is_active = TRUE
GROUP BY category
HAVING COUNT(*) > 4;
-- B6.
-- Electronics: 7
-- Apparel: 6
-- Home: 5

SELECT product_name,
       CASE
           WHEN price < 500 THEN 'Budget'
           WHEN price < 5000 THEN 'Mid'
           ELSE 'Premium'
       END AS tier
FROM products
WHERE category = 'Beauty';

-- B7.
-- Nykaa Matte Lipstick: Mid
-- Lakme Eye Liner: Budget
-- Mamaearth Face Wash: Budget
-- WOW Skin Vitamin C Serum: Mid

SELECT product_name,
       COALESCE(avg_rating, 0) AS rating
FROM products
WHERE stock_quantity = 0;
-- B8.
-- JBL Flip 6 Speaker: 4.30
-- WOW Skin Vitamin C Serum: 4.50


-- c1
SELECT *
FROM products;

-- c2 
SELECT product_name, price
FROM products
WHERE category = 'Books';
 -- c3
 SELECT *
FROM products
WHERE price > 10000
ORDER BY price DESC;

-- c4
SELECT product_name, price
FROM products
WHERE category = 'Electronics'
ORDER BY price DESC
LIMIT 5;

-- c5
SELECT *
FROM products
WHERE category IN ('Electronics', 'Apparel');

-- c6
SELECT *
FROM products
WHERE price BETWEEN 500 AND 2000;

-- c7
SELECT *
FROM products
WHERE product_name LIKE '%Watch%';

-- c8
SELECT *
FROM products
WHERE brand LIKE 'S%';

-- c9
SELECT DISTINCT category
FROM products;

-- c10
SELECT COUNT(*) AS total_products
FROM products;
 
 
 -- c11
 SELECT AVG(price) AS avg_book_price
FROM products
WHERE category = 'Books';

-- c12
SELECT MAX(price) AS max_price, MIN(price) AS min_price
FROM products;

-- c13
SELECT category, COUNT(*) AS product_count
FROM products
GROUP BY category;

-- c14
SELECT category, SUM(stock_quantity) AS total_stock
FROM products
GROUP BY category;

-- c15
SELECT category, AVG(price) AS avg_price
FROM products
GROUP BY category
ORDER BY avg_price DESC;

-- c16
SELECT brand, COUNT(*) AS product_count, AVG(price) AS avg_price
FROM products
GROUP BY brand
HAVING COUNT(*) > 1;

-- c17
SELECT category
FROM products
WHERE is_active = TRUE
GROUP BY category
HAVING COUNT(*) > 4;

-- c18
SELECT *
FROM products
ORDER BY price DESC
LIMIT 3;


-- c19
SELECT category
FROM products
GROUP BY category
HAVING AVG(price) > 2000;

-- c20
SELECT *
FROM products
WHERE avg_rating IS NULL;
-- c21
SELECT product_name, COALESCE(CAST(avg_rating AS CHAR), 'New Launch') AS rating
FROM products;

-- c22
SELECT product_name, price,
  CASE 
    WHEN price < 1000 THEN 'Budget'
    WHEN price < 10000 THEN 'Mid'
    ELSE 'Premium'
  END AS price_tier
FROM products;

-- c23
SELECT category, 
  COUNT(*) AS total_products,
  SUM(CASE WHEN price >= 10000 THEN 1 ELSE 0 END) AS premium_count
FROM products
GROUP BY category;

-- c24
SELECT category,
  COUNT(*) AS total_products,
  SUM(CASE WHEN is_active = TRUE THEN 1 ELSE 0 END) AS active_product_count,
  AVG(price) AS avg_price,
  CASE 
    WHEN AVG(price) < 1500 THEN 'Cheap'
    WHEN AVG(price) < 10000 THEN 'Standard'
    ELSE 'Luxury'
  END AS category_tier
FROM products
GROUP BY category
HAVING COUNT(*) >= 3
ORDER BY avg_price DESC;