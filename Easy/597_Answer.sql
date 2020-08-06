SELECT 
IFNULL(ROUND((SELECT COUNT(DISTINCT requester_id, accepter_id) FROM request_accepted)/(SELECT COUNT(DISTINCT sender_id, send_to_id) FROM friend_request), 2), 0) 
AS accept_rate;