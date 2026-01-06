-- Price Conversion to Euro
-- ========================

-- This update script recalculates the prices of all unpaid projects 
-- by dividing them by the fixed exchange rate (1.95583). This is 
-- intended to transition the studio's financial records to the Euro 
-- as the official currency.

USE VD_Studio
GO

UPDATE Projects
SET price = price / 1.95583
WHERE is_paid = 0
GO