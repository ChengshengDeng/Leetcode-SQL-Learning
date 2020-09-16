with cum_sum as (select Number,
    Frequency, 
    sum(Frequency) over (order by Number asc) as sum_freq,
        sum(Frequency) over () as cnt
from Numbers)

select AVG(Number) as median
from cum_sum
where cnt/2 <= sum_freq
and cnt/2 >= (sum_freq - Frequency);