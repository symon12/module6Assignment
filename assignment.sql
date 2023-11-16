-- Active: 1698982999376@@127.0.0.1@3306
SELECT customers.customer_id, customers.name, customers.email, customers.location, COUNT(orders.order_id) AS total_order FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id
ORDER BY total_order DESC;

SELECT products.product_id, orders.order_id, products.name,order_items.unit_price, order_items.qty, (order_items.unit_price*order_items.qty) AS orderItemsTotal FROM order_items
JOIN products ON products.product_id = order_items.product_id
JOIN orders ON order_items.order_id = orders.order_id
GROUP BY order_items.product_id
ORDER BY orders.order_id;

SELECT categories.name AS category_name,order_items.unit_price,order_items.qty, SUM(order_items.qty * order_items.unit_price) AS Total_Revenue 
FROM Categories 
JOIN Products ON categories.category_id = products.category_id 
JOIN order_items ON products.product_id = order_items.product_id 
GROUP BY categories.name 
ORDER BY `Total_Revenue` DESC;


SELECT customers.name AS customer_name, SUM(order_items.qty * order_items.unit_price) AS Highest_purchase_amount 
FROM Customers 
JOIN Orders ON customers.customer_id = orders.customer_id 
JOIN order_items ON orders.order_id = order_items.order_id 
GROUP BY customers.name 
ORDER BY Highest_purchase_amount 
DESC LIMIT 5;