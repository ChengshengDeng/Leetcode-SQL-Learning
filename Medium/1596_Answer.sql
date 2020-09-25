WITH temp AS ( 
    SELECT customer_id, product_id, COUNT(product_id) AS num
    FROM Orders 
    GROUP BY 1,2 ), 
    
    temp1 AS (SELECT *,
              RANK()OVER(PARTITION BY customer_id ORDER BY num DESC) rnk 
             FROM temp ) 
             
       SELECT t.customer_id, t.product_id, 
              p.product_name 
              FROM temp1 t 
              LEFT JOIN Products p 
              ON t.product_id = p.product_id 
              WHERE t.rnk = 1