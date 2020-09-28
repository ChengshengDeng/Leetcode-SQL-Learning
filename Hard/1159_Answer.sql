WITH temp AS ( 
              SELECT 
                    item_id, 
                    seller_id, 
                    order_date, 
                    RANK()OVER(PARTITION BY seller_id ORDER BY order_date ASC) rnk
               FROM Orders ) ,
               
     temp1 AS ( 
               SELECT u.user_id, 
                      u.favorite_brand, 
                      IFNULL(t.item_id,0) AS item_id,
                      IFNULL(t.order_date, 0) AS order_date,
                      IFNULL(t.rnk,0) AS rnk 
               FROM Users u 
               LEFT JOIN temp t 
               ON u.user_id = t.seller_id ),
    
   
   
   temp2 AS(SELECT user_id, favorite_brand, item_id, order_date FROM temp1 WHERE rnk = 2 ) ,
  
  
     temp3 AS(    SELECT t.user_id AS seller_id, 
           CASE WHEN t.favorite_brand = i.item_brand THEN 'yes' ELSE 'no' END AS 2nd_item_fav_brand 
    FROM temp2 t 
    LEFT OUTER JOIN Items i 
    ON t.item_id = i.item_id ) 
    
    SELECT u.user_id AS seller_id, IFNULL(t.2nd_item_fav_brand,'no') AS 2nd_item_fav_brand  
    FROM Users u 
    LEFT JOIN temp3 t 
    ON t.seller_id = u.user_id