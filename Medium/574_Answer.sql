SELECT r.Name As Name 
FROM (SELECT c.Name, 
     RANK() OVER(ORDER BY COUNT( c.Name) DESC) rtk 
     FROM Candidate c 
     JOIN Vote v 
     ON c.Id = v.CandidateId 
     GROUP BY v.CandidateId) r
WHERE r.rtk = 1; 