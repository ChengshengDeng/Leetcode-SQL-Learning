SELECT a.customer_id,
    c.name
FROM (SELECT o.customer_id,
             MONTH(o.order_date) AS month,
             SUM(o.quantity * p.price) AS total_order
      FROM Orders o
      JOIN Product p 
        ON o.product_id = p.product_id
      WHERE MONTH(order_date) IN (6,7)
      GROUP BY o.customer_id, 
             month
      HAVING SUM(o.quantity * p.price) >= 100) a
JOIN Customers c
    ON a.customer_id = c.customer_id
GROUP BY a.customer_id
HAVING COUNT(a.month) = 2; 