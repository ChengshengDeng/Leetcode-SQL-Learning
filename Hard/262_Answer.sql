SELECT t.Request_at AS Day, 
ROUND(SUM(CASE WHEN t.Status !='completed' THEN 1 ELSE 0 END) / COUNT(t.Status),2)  AS `Cancellation Rate`
FROM Trips t 
JOIN (SELECT * FROM Users WHERE Role = 'client') a
ON t.Client_Id = a.Users_Id
JOIN (SELECT * FROM Users WHERE Role = 'driver') b
ON t.Driver_Id = b.Users_Id 
WHERE t.Request_at between '2013-10-01' and '2013-10-03' and a.Banned = 'No' and b.Banned = 'No' 
GROUP BY 1 

