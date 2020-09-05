SELECT company_id, 
employee_id, 
employee_name, 
ROUND(CASE WHEN MAX(salary) OVER(PARTITION BY company_id) >10000 THEN salary -salary *0.49 
     WHEN MAX(salary) OVER(PARTITION BY company_id)>=1000 THEN salary - salary *0.24 
     ELSE salary END,0) AS salary 
     FROM Salaries  