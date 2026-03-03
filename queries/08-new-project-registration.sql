-- New Project Registration
-- ========================

-- This `INSERT` statement creates a new record in the `Projects` table 
-- for a signed contract. It includes details such as the project type, 
-- client ID, descriptive name, contract number, date, and agreed price.

USE VD_Studio
GO

INSERT INTO Projects
    (
        type_id,
        client_id,
        name,
        contract_number,
        contract_date,
        price
    )
VALUES
    (
        3,
        2,
        'Коледа в семейство Атанасови',
        178,
        '2025-12-15',
        300.00
    )

GO