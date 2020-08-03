/*  
 本题的重点在于运用RANK function  

 第一个表没什么卵用 
 运用sub query 将seller_id 和rank 写出来 然后提取rank 为 1的seller id 
 
 */ 


 SELECT seller_id 
 FROM 
 (SELECT seller_id , 
 	RANK( ) OVER( ORDER BY SUM(price) DESC ) rnk FROM Sales 
 	GROUP BY seller_id) s
 WHERE s.rnk = 1; 