-- Project Cancellation with Transaction
-- =====================================

-- This script performs a cascading deletion of a specific project and 
-- all its associated session and team records. It uses a transaction 
-- (`BEGIN TRANSACTION`) and error handling (`TRY...CATCH`) to ensure 
-- data integrity is maintained even if the deletion process fails.

USE VD_Studio
GO

DECLARE @project_to_delete_id INT
SET @project_to_delete_id = 6

BEGIN TRANSACTION

BEGIN TRY
    DELETE FROM Session_teams
    WHERE session_id IN (
        SELECT session_id
        FROM Sessions
        WHERE project_id = @project_to_delete_id
    )

    DELETE FROM Sessions
    WHERE project_id = @project_to_delete_id

    DELETE FROM Projects
    WHERE project_id = @project_to_delete_id

    COMMIT TRANSACTION
    PRINT 'Deleted successfully!'
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION

    PRINT 'An error occurred!'
    SELECT ERROR_MESSAGE() AS ErrorMessage
END CATCH

GO