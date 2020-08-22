SELECT a.id , 
CASE WHEN a.id % 2 = 0 THEN (SELECT student FROM seat WHERE id = a.id -1) 
ELSE IFNULL((SELECT student FROM seat WHERE id = a.id + 1), a.student) 
END student 
FROM seat a ;
