-- Total Monthly Income for the Current Year
-- =========================================

-- This script calculates the sum of project prices grouped by month 
-- for the current calendar year. The results are ordered chronologically 
-- to provide financial insights to the studio's management.

USE VD_Studio
GO

SELECT
    MONTH(contract_date) AS 'Month',
    SUM(price) AS 'Total income'
FROM Projects
WHERE YEAR(contract_date) = YEAR(GETDATE())
GROUP BY MONTH(contract_date)
ORDER BY Month
GO