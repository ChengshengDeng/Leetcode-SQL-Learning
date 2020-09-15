SELECT Id, Company, Salary
FROM (SELECT * , 
     ROW_NUMBER() OVER(PARTITION BY Company ORDER BY Salary) ranking, 
     COUNT(*) OVER(PARTITION BY Company) maxium_ranking 
     FROM  Employee) temp 
WHERE CASE WHEN maxium_ranking % 2 = 0 THEN ranking = maxium_ranking/2 OR ranking = maxium_ranking / 2 + 1  
           ELSE ranking = (maxium_ranking + 1) /2  END 