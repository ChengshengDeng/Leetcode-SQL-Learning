SELECT gender, 
day, 
SUM(score_points) OVER(PARTITION BY gender ORDER bY day ASC) total 
FROM Scores 