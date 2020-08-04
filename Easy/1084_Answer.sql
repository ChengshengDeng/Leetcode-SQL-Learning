/* 
	解析 ： 
	本题要求抓取只在2019-01-01 到 2019-03-31 之间销售的商品。 
	需要注意的点是既在这个时间段内销售的，又在之后销售的商品不需要抓取。 

     本题会用到的function  

     between and  

      在from 之后在写一个 query ，这个query 是用于提取出不在春季销售的产品的id
      （product_id) 
      后面再加 WHERE 条件限定  */ 


SELECT product_id, 
product_name 
FROM Product 
WHERE product_id NOT IN (SELECT product_id FROM Sales 
                          WHERE sale_date NOT between '2019-01-01' AND 
                          '2019-03-31') ; 