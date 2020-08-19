SELECT DISTINCT a.seat_id 
FROM cinema a, cinema b 
where a.free = True and b.free = True 
AND abs(a.seat_id - b.seat_id) = 1 
ORDER BY a.seat_id ASC ; 