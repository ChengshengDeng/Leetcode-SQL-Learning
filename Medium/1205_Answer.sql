SELECT
DATE_FORMAT(t1.trans_date, '%Y-%m') AS month,
t1.country AS country,
SUM(IF(t1.state = 'approved', 1, 0)) AS approved_count,
SUM(IF(t1.state = 'approved', t1.amount, 0)) AS approved_amount,
SUM(IF(t1.state = 'chargeback', 1, 0)) AS chargeback_count,
SUM(IF(t1.state = 'chargeback', t1.amount, 0)) AS chargeback_amount
FROM
(
SELECT * FROM Transactions
UNION ALL
SELECT
c1.trans_id AS id, t0.country, 'chargeback' AS state, t0.amount, c1.trans_date
FROM Chargebacks c1
LEFT JOIN Transactions t0 ON c1.trans_id = t0.id
) t1
GROUP BY DATE_FORMAT(t1.trans_date, '%Y-%m'), t1.country
HAVING SUM(IF(t1.state = 'approved', 1, 0)) != 0
OR SUM(IF(t1.state = 'approved', t1.amount, 0)) != 0
OR SUM(IF(t1.state = 'chargeback', 1, 0)) != 0
OR SUM(IF(t1.state = 'chargeback', t1.amount, 0)) != 0
ORDER BY DATE_FORMAT(t1.trans_date, '%Y-%m')  