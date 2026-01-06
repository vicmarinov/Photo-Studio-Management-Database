-- Average Revenue by Project Type
-- ===============================

-- This script calculates the average price of projects for the current 
-- year, grouped by their specific type (e.g., Wedding, Product, or 
-- Family photography). It helps identify the most profitable areas of 
-- operation by sorting them in descending order of average revenue.

USE VD_Studio
GO

SELECT
    pt.name AS 'Type',
    AVG(price) AS 'Average price'
FROM Project_types AS pt
JOIN Projects AS p ON pt.type_id = p.type_id
WHERE YEAR(p.contract_date) = YEAR(GETDATE())
GROUP BY pt.name
ORDER BY AVG(price) DESC
GO