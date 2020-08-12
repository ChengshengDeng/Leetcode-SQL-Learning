SELECT DISTINCT a.Num AS ConsecutiveNums FROM Logs a, Logs b, Logs c
WHERE a.Num-b.Num=0
AND b.Num-c.Num = 0
AND c.Id-b.Id = 1
AND b.Id-a.Id = 1 ;