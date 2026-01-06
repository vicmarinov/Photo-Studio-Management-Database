-- Projects Filtered by Type
-- =========================

-- This script joins the `Projects` and `Project_types` tables to 
-- filter and display all projects belonging to a specific category. 
-- It assists management in planning the studio's workload for 
-- specific service types.

USE VD_Studio
GO

DECLARE @type_to_filter VARCHAR(50)
SET @type_to_filter = 'Абитуриентски албуми'

SELECT p.* FROM Projects AS p
JOIN Project_types AS pt ON p.type_id = pt.type_id
WHERE pt.name = @type_to_filter
GO