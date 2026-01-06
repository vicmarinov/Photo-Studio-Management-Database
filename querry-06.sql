-- Top Clients for Loyalty Program
-- ===============================

-- This complex script identifies "Top Clients" who have generated 
-- total revenue higher than the average revenue across all clients 
-- for the current year. It returns client IDs, names, locations, and 
-- total spending to support the studio's strategic loyalty program.

USE VD_Studio
GO

SELECT
    c.client_id AS 'Client ID',
    c.name AS 'Name',
    c.town AS 'Town',
    SUM(p.price) AS 'Total revenue'
FROM Clients AS c
JOIN Projects AS p ON c.client_id = p.client_id
WHERE DATEDIFF(YEAR, p.contract_date, GETDATE()) = 0
GROUP BY c.client_id, c.name, c.town
HAVING SUM(p.price) > (
    SELECT AVG(client_total_revenue) AS client_average_revenue
    FROM (
        SELECT c.client_id, SUM(p.price) AS client_total_revenue
        FROM Clients AS c
        JOIN Projects AS p ON c.client_id = p.client_id
        WHERE DATEDIFF(YEAR, p.contract_date, GETDATE()) = 0
        GROUP BY c.client_id
    ) AS sum_calculation
)
ORDER BY SUM(p.price) DESC
GO