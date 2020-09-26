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
 * `RANK()` 
 * the difference between `PARTITION` and `GROUP BY` 


Following is our Answer

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


