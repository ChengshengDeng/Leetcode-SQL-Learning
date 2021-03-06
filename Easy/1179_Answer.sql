select id,
min(case when month = 'Jan' then Revenue end) as Jan_Revenue,
min(case when month = 'Feb' then Revenue end) as Feb_Revenue,
min(case when month = 'Mar' then Revenue end) as Mar_Revenue,
min(case when month = 'Apr' then Revenue end) as Apr_Revenue,
min(case when month = 'May' then Revenue end) as May_Revenue,
min(case when month = 'Jun' then Revenue end) as Jun_Revenue,
min(case when month = 'Jul' then Revenue end) as Jul_Revenue,
min(case when month = 'Aug' then Revenue end) as Aug_Revenue,
min(case when month = 'Sep' then Revenue end) as Sep_Revenue,
min(case when month = 'Oct' then Revenue end) as Oct_Revenue,
min(case when month = 'Nov' then Revenue end) as Nov_Revenue,
min(case when month = 'Dec' then Revenue end) as Dec_Revenue
from Department
group by id;