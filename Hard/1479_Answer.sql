WITH temp AS ( 
              SELECT DAYNAME(o.order_date) AS day, o.item_id, SUM(o.quantity) AS quantity, 
                     i.item_category AS Category 
              FROM Orders o 
              RIGHT JOIN Items i 
              ON o.item_id = i.item_id 
              GROUP BY Category, day ) 
        
SELECT Category, 
      SUM( CASE WHEN day = 'Monday' THEN quantity ELSE 0  END )AS 'Monday', 
      SUM(CASE WHEN day = 'Tuesday' THEN quantity ELSE 0 END) AS 'Tuesday', 
      SUM(CASE WHEN day = 'Wednesday' THEN quantity ELSE 0 END) AS'Wednesday', 
      SUM(CASE WHEN day = 'Thursday'THEN quantity ELSE 0 END) AS 'Thursday',
      SUM(CASE WHEN day = 'Friday'THEN quantity ELSE 0 END) AS 'Friday',
    SUM(CASE WHEN day = 'Saturday'THEN quantity ELSE 0 END) AS 'Saturday', 
     SUM(CASE WHEN day = 'Sunday'THEN quantity ELSE 0 END) AS 'Sunday'
     
     FROM temp 
     GROUP BY Category 
     ORDER BY 1 