select u.user_id as buyer_id, join_date, sum(case when year(order_date)=2019 then 1 else 0 end) orders_in_2019 from 
Users u LEFT join Orders o 
on u.user_id=o.buyer_id
group by 1 