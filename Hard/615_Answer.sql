with t1 as ( 
            SELECT DATE_FORMAT(pay_date,'%Y-%m') AS pay_time, 
                   AVG(amount) ave 
            FROM salary 
            GROUP BY 1), 
    
    t2 as ( 
            SELECT DATE_FORMAT(s.pay_date,'%Y-%m') AS pay_month, 
                   AVG(s.amount) AS av, 
                   e.department_id  AS department_id
             FROM salary s 
            LEFT JOIN employee e
             ON s.employee_id = e.employee_id 
             GROUP BY 1, 3
             ) 
             
SELECT t1.pay_time AS pay_month, 
       t2.department_id AS department_id, 
       CASE WHEN t2.av > t1.ave THEN 'higher' 
            WHEN t2.av < t1.ave THEN 'lower' 
            ELSE 'same' END AS comparison 
    FROM t1 
   LEFT JOIN t2 
    ON t1.pay_time = t2.pay_month 

