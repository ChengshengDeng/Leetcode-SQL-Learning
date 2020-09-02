select e2.employee_id as EMPLOYEE_ID 
from Employees as e2 
where e2.manager_id in (
    select e1.employee_id from Employees as e1 where e1.manager_id in (
        select employee_id from Employees where manager_id =1)) 
and e2.employee_id != 1 
