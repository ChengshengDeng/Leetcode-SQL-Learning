/* 
	We need to select the buyer_id in this question 
	很明显要用 Join Function 连接两表。 
	连接完两表后，我们可以筛选出买了S8 的用户。 
	buyer_id = 3 买了iPhone 和 S8 我们只要用not in 语句 排除掉就好。 */ 

SELECT DISTINCT b.buyer_id 
FROM Sales AS b 
JOIN Product AS a 
ON a.product_id = b.product_id 
WHERE a.product_name = 'S8' AND b.buyer_id NOT IN (SELECT  b.buyer_id 
FROM Sales AS b 
JOIN Product AS a 
ON a.product_id = b.product_id 
WHERE a.product_name = 'iPhone' ) ;