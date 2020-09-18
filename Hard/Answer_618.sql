with a as ( SELECT name AS America , 
          ROW_NUMBER() OVER(ORDER BY name) rnk 
          FROM student 
          WHERE continent = 'America'), 
    b as (SELECT name AS "Asia", 
         ROW_NUMBER() OVER(ORDER BY name) rnk 
         FROM student 
         WHERE continent = 'Asia'),  
    c AS (SELECT name AS "Europe", 
         ROW_NUMBER() OVER(ORDER BY name) rnk 
         FROM student 
         WHERE continent = 'Europe') 
         
         SELECT a.America, b.Asia,c.Europe 
         FROM a 
         LEFT JOIN b 
         ON a.rnk = b.rnk 
         LEFT JOIN c 
         ON a.rnk = c.rnk  