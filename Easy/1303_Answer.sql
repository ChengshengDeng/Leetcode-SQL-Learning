SELECT employee_id, COUNT(employee_id)
OVER ( Partition BY  team_id) AS team_size 
FROM Employee; 