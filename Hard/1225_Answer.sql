select 'failed' as period_state,
       min(fail_date) as start_date,
       max(fail_date) as end_date
from (
    select fail_date,
           dayofyear(fail_date) - row_number() over(order by fail_date) as group_rank
    from Failed
    where fail_date between '2019-01-01' and '2019-12-31'
) f
group by group_rank

union

select 'succeeded' as period_state,
       min(success_date) as start_date,
       max(success_date) as end_date
from (
    select success_date,
           dayofyear(success_date) - row_number() over(order by success_date) as group_rank
    from Succeeded
    where success_date between '2019-01-01' and '2019-12-31'
) s
group by group_rank

order by start_date   