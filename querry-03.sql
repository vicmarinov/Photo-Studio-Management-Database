-- Sessions Without Assigned Teams
-- ===============================

-- Using a `LEFT JOIN` between `Sessions` and `Session_teams`, this 
-- script identifies all scheduled photo sessions that do not yet 
-- have an assigned team of employees. This is crucial for personnel 
-- management and ensuring every session is covered.

USE VD_Studio
GO

SELECT s.* FROM Sessions AS s
LEFT JOIN Session_teams AS st ON s.session_id = st.session_id
WHERE st.session_id IS NULL
GO