SELECT DISTINCT v.viewer_id as id 
FROM Views v 
JOIN Views a 
ON v.view_date = a.view_date and v.viewer_id = a.viewer_id and v.article_id !=a.article_id 
ORDER BY id ASC ; 