
SELECT seller_name
FROM Seller 
WHERE seller_id NOT IN (SELECT DISTINCT seller_id 
               FROM Orders 
               WHERE sale_date > '2020-01-01' ) 
ORDER BY 1 