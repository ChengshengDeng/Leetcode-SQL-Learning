## Question 1164 
## Level: Medium 


```
Table: Products

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| new_price     | int     |
| change_date   | date    |
+---------------+---------+
(product_id, change_date) is the primary key of this table.
Each row of this table indicates that the price of some product was changed to a new price at some date.
 

Write an SQL query to find the prices of all products on 2019-08-16. Assume the price of all products before any change is 10.

The query result format is in the following example:

Products table:
+------------+-----------+-------------+
| product_id | new_price | change_date |
+------------+-----------+-------------+
| 1          | 20        | 2019-08-14  |
| 2          | 50        | 2019-08-14  |
| 1          | 30        | 2019-08-15  |
| 1          | 35        | 2019-08-16  |
| 2          | 65        | 2019-08-17  |
| 3          | 20        | 2019-08-18  |
+------------+-----------+-------------+

Result table:
+------------+-------+
| product_id | price |
+------------+-------+
| 2          | 50    |
| 1          | 35    |
| 3          | 10    |
+------------+-------+
``` 

For this question, we need to do following steps to solve the problems. 
* What is the most recent `new_price` when the `change_date` <= '2019-08-16` 
* Use Self- `LEFT JOIN()` to show the price when `change_date` > '2019-08-16`


## Answer 

``` 
WITH temp AS(
    SELECT *, RANK()OVER(PARTITION BY product_id ORDER BY change_date DESC ) rnk         FROM Products WHERE change_date <='2019-08-16')
   

SELECT p.product_id,IFNULL(t.new_price,10) AS price 
FROM (SELECT DISTINCT product_id FROM Products) p 
LEFT JOIN (SELECT product_id, new_price FROM temp WHERE rnk = 1) t 
ON t.product_id = p.product_id  

```




