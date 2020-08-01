SELECT tb1.Id
FROM Weather as tb1
INNER JOIN Weather as tb2
ON tb1.Temperature > tb2.Temperature AND DateDiff(tb1.RecordDate,tb2.RecordDate) = 1;