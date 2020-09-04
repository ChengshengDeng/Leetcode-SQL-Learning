
SELECT  i.invoice_id, 
        c1.customer_name, 
        i.price, 
        COUNT(c2.user_id) AS contacts_cnt,
        SUM(IF (c2.contact_name in (SELECT customer_name from Customers), 1,0)) AS  trusted_contacts_cnt 
FROM Invoices i 
JOIN Customers c1 
ON i.user_id = c1.customer_id 
LEFT JOIN Contacts c2 
ON c1.customer_id = c2.user_id 
GROUP BY 1
ORDER BY 1 ASC 