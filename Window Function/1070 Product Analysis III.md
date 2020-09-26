
## Question 1070 
## Level: Medium 

```
Table: Sales

+-------------+-------+
| Column Name | Type  |
+-------------+-------+
| sale_id     | int   |
| product_id  | int   |
| year        | int   |
| quantity    | int   |
| price       | int   |
+-------------+-------+
sale_id is the primary key of this table.
product_id is a foreign key to Product table.
Note that the price is per unit.
Table: Product

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| product_id   | int     |
| product_name | varchar |
+--------------+---------+
product_id is the primary key of this table.
 

Write an SQL query that selects the product id, year, quantity, and price for the first year of every product sold.

The query result format is in the following example:

Sales table:
+---------+------------+------+----------+-------+
| sale_id | product_id | year | quantity | price |
+---------+------------+------+----------+-------+ 
| 1       | 100        | 2008 | 10       | 5000  |
| 2       | 100        | 2009 | 12       | 5000  |
| 7       | 200        | 2011 | 15       | 9000  |
+---------+------------+------+----------+-------+

Product table:
+------------+--------------+
| product_id | product_name |
+------------+--------------+
| 100        | Nokia        |
| 200        | Apple        |
| 300        | Samsung      |
+------------+--------------+

Result table:
+------------+------------+----------+-------+
| product_id | first_year | quantity | price |
+------------+------------+----------+-------+ 
| 100        | 2008       | 10       | 5000  |
| 200        | 2011       | 15       | 9000  |
+------------+------------+----------+-------+

```
* For this question, we need to use `RANK()` to get the first_year. Then we can select the product sales in first year. 

## Answer. 

```
WITH temp AS ( 
              SELECT product_id, quantity, price, year,
              RANK() OVER(PARTITION BY product_id ORDER BY sales.year ASC) AS rnk
              FROM Sales ) 
    SELECT t.product_id, t.year AS first_year, t.quantity, t.price 
    FROM temp t 
    WHERE rnk = 1 
``` 

* I try to use minium of year `MIN()` to get the first_year but it did not pass when I submited the code. I don't know why. However, `RANK()` is the 100% right way 
 to solve questions like this.
