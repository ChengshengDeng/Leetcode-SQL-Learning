SELECT b.book_id,
    b.name
FROM Books b
LEFT JOIN Orders o
    ON b.book_id = o.book_id
WHERE DATEDIFF( '2019-06-23', b.available_from) > 30
GROUP BY b.book_id
HAVING SUM(CASE WHEN dispatch_date > '2018-06-23' 
           THEN o.quantity
           ELSE 0
           END) < 10 
        OR SUM(o.quantity) IS NULL;