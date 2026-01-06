-- Available Employees by Skill and Date
-- =====================================

-- This script searches for active employees with a specific skill 
-- (e.g., "Photography") who are not scheduled for any sessions on a 
-- given date. It is primarily used to find replacement staff during 
-- emergencies or force majeure circumstances.

USE VD_Studio
GO

DECLARE @skill_to_look_for VARCHAR(20)
SET @skill_to_look_for = 'Фотография'

DECLARE @date_to_look_for DATE
SET @date_to_look_for = '2025-12-23'

SELECT e.* FROM Employees AS e
JOIN Employee_skills AS es ON e.employee_id = es.employee_id
JOIN Skills AS s ON es.skill_id = s.skill_id
WHERE
    e.is_active = 1 AND
    s.name = @skill_to_look_for AND
    e.employee_id NOT IN (
        SELECT st.employee_id FROM Sessions AS ssn
        JOIN Session_teams AS st ON ssn.session_id = st.session_id
        WHERE DATEDIFF(DAY, @date_to_look_for, date_and_time) = 0
    )

GO