select Department, Employee, Salary
from
(select d.name as Department,
e.name as Employee,
e.salary as Salary,
rank() over (partition by d.Name order by e.salary desc) as seq
from employee e
join department d
on e.departmentid = d.id) sub
where seq=1 ; 