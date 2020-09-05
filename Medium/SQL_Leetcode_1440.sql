SELECT e.*, CASE WHEN (operator = ">" AND v1.value > v2.value) THEN "true"
                 WHEN (operator = "=" AND v1.value = v2.value) THEN "true"
                 WHEN (operator = "<" AND v1.value < v2.value) THEN "true"
                 ELSE "false"
                 END AS value
FROM Expressions e
JOIN Variables v1
ON v1.name = left_operand
JOIN Variables v2
ON v2.name = right_operand