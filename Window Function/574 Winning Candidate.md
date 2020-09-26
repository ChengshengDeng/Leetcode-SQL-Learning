## Question 574 
## Level: Medium 

```
Table: Candidate

+-----+---------+
| id  | Name    |
+-----+---------+
| 1   | A       |
| 2   | B       |
| 3   | C       |
| 4   | D       |
| 5   | E       |
+-----+---------+  
Table: Vote

+-----+--------------+
| id  | CandidateId  |
+-----+--------------+
| 1   |     2        |
| 2   |     4        |
| 3   |     3        |
| 4   |     2        |
| 5   |     5        |
+-----+--------------+
id is the auto-increment primary key,
CandidateId is the id appeared in Candidate table.
Write a sql to find the name of the winning candidate, the above example will return the winner B.

+------+
| Name |
+------+
| B    |
+------+
Notes:

You may assume there is no tie, in other words there will be only one winning candidate.
``` 

In this question, the points we need to know:
 * `JOIN()` 
 * `RANK()` OR `COUNT()` You can choose any of function to solve the problem
 * the difference between `PARTITION BY ` and `GROUP BY` 



Following is our Answer:

### Solution 1

```     
WITH temp AS ( 
    SELECT id, CandidateId, 
          RANK() OVER(ORDER BY COUNT(CandidateId) DESC) rnk 
             FROM Vote 
    GROUP BY CandidateId
             ) 
             
     SELECT c.Name 
        FROM Candidate c 
        JOIN temp t 
        ON c.id = t.CandidateId
        WHERE t.rnk = 1

````  

### Solution 2

```
WITH temp AS ( 
    SELECT id, CandidateId, 
          COUNT(CandidateId) OVER(PARTITION BY CandidateId ORDER BY CandidateId ) rnk 
             FROM Vote 
  ) 
  
SELECT c.Name
FROM Candidate c
JOIN temp t 
ON c.id = t.CandidateId 
ORDER BY t.rnk DESC
LIMIT 1
```
You can also solve this question without using window function. 

### Solution 3

```
WITH temp AS ( SELECT CandidateId, COUNT(id) AS num 
             FROM Vote 
             GROUP BY CandidateId 
             ORDER BY 2 DESC
             LIMIT 1 )
        
        SELECT c.Name 
        FROM temp t 
        JOIN Candidate c 
        ON t.CandidateId = c.id 

```




