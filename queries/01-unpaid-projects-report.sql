-- Unpaid Projects Report
-- ======================

-- This script retrieves all data from the `Projects` table where the 
-- payment status is marked as unpaid. It is used to track outstanding 
-- financial receivables from clients.

USE VD_Studio
GO

SELECT * FROM Projects
WHERE is_paid = 0
GO