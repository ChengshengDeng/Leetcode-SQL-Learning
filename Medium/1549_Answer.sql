SELECT a.product_name, a.product_id,a.order_id,a.order_date
FROM (SELECT o.order_id order_id, o.order_date order_date, o.product_id product_id,
        p.product_name product_name,
        RANK()OVER(PARTITION BY o.product_id ORDER BY o.order_date DESC) rnk 
        FROM Orders o 
        JOIN Products p 
        ON o.product_id = p.product_id ) a  
WHERE a.rnk = 1 
ORDER BY 1 ASC, 2 ASC, 3 ASC; 