select
team_id, team_name, sum(points) as num_points
from(
    select
    guest.team_id team_id,
    guest.team_name,
    CASE WHEN M.guest_goals = M.host_goals THEN 1
    WHEN M.guest_goals > M.host_goals THEN 3
    ELSE 0 end as points
    from Matches as M
    right join Teams guest ON guest.team_id = M.guest_team

    UNION ALL

    select
    host.team_id team_id,
    host.team_name,
    CASE WHEN M.guest_goals = M.host_goals THEN 1
    WHEN M.host_goals > M.guest_goals THEN 3
    ELSE 0 end as points
    from Matches as M
    right join Teams host ON host.team_id = M.host_team
)TT
group by team_id
order by num_points desc, team_id