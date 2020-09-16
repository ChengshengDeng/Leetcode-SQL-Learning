with t as
(
select *,
lead(id,1) over(order by id) as lead1_id,
lead(id,2) over(order by id) as lead2_id,
lag(id,1) over(order by id) as lag1_id,
lag(id,2) over(order by id) as lag2_id
from (select * from stadium where people>=100) t0
)

select
id, visit_date,people
from t
where (id - lead1_id = -1 and id - lead2_id=-2) or (id-lag1_id=1 and id-lag2_id=2) or (lag1_id - lead1_id = -2)
order by id;