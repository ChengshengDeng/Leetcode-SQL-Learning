SELECT c.customer_id , c.customer_name 
FROM Customers c 
WHERE c.customer_id in (SELECT customer_id FROM Orders WHERE product_name = 'A') 
AND 
     c.customer_id in(SELECT customer_id FROM Orders WHERE product_name = 'B') 
AND 
     c.customer_id not in (SELECT customer_id FROM Orders WHERE product_name = 'C')

