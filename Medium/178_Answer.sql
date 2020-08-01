SELECT Score As score, DENSE_RANK() OVER(
      ORDER BY  Score DESC) AS 'Rank' 
      FROM Scores;   

 /* Be careful wiith Rank () and Dense Rank() 