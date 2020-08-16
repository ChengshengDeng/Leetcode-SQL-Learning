SELECT c.customer_id 
FROM Customer c 
GROUP BY customer_id 
HAVING COUNT(DISTINCT c.product_key) = (SELECT COUNT( product_key) FROM Product) ;
