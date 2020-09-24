WITH sq 
     AS (SELECT first_player     player, 
                Sum(first_score) score 
         FROM   matches 
         GROUP  BY first_player 
         UNION ALL 
         SELECT second_player     player, 
                Sum(second_score) score 
         FROM   matches 
         GROUP  BY second_player), 
     sq1 
     AS (SELECT player_id, 
                group_id, 
                Ifnull(Sum(score), 0) score 
         FROM   players p 
                JOIN sq 
                       ON p.player_id = sq.player 
         GROUP  BY player_id 
         ORDER  BY group_id, 
                   score DESC, 

                            player_id ASC) 

SELECT group_id, 
       player_id player_id 
FROM   (SELECT *, 
               Dense_rank() 
                 OVER( 
                   partition BY group_id 
                   ORDER BY score DESC) r 
        FROM   sq1) q 
WHERE  r = 1 
GROUP  BY q.group_id 