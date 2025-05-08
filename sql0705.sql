USE PTBPABD;

-- Questão 1
CREATE USER User_A WITH PASSWORD = 'senhaA123';
CREATE USER User_B WITH PASSWORD = 'senhaB123';
CREATE USER User_C WITH PASSWORD = 'senhaC123';
CREATE USER User_D WITH PASSWORD = 'senhaD123';
CREATE USER User_E WITH PASSWORD = 'senhaE123';

-- Questão 2
GRANT SELECT, UPDATE ON dbo.advisor    TO User_A WITH GRANT OPTION;
GRANT SELECT, UPDATE ON dbo.course     TO User_A WITH GRANT OPTION;
GRANT SELECT, UPDATE ON dbo.department TO User_A WITH GRANT OPTION;
GRANT SELECT, UPDATE ON dbo.endereco    TO User_A WITH GRANT OPTION;
GRANT SELECT, UPDATE ON dbo.instructor TO User_A WITH GRANT OPTION;
GRANT SELECT, UPDATE ON dbo.pessoa     TO User_A WITH GRANT OPTION;
GRANT SELECT, UPDATE ON dbo.prereq     TO User_A WITH GRANT OPTION;
GRANT SELECT, UPDATE ON dbo.section    TO User_A WITH GRANT OPTION;
GRANT SELECT, UPDATE ON dbo.student    TO User_A WITH GRANT OPTION;
GRANT SELECT, UPDATE ON dbo.takes      TO User_A WITH GRANT OPTION;
GRANT SELECT, UPDATE ON dbo.teaches    TO User_A WITH GRANT OPTION;
GRANT SELECT, UPDATE ON dbo.time_slot  TO User_A WITH GRANT OPTION;

-- Questão 3
SELECT  
    princ.name,
    perm.permission_name,
    perm.state_desc,
    OBJECT_NAME(perm.major_id) AS Tabela
FROM sys.database_principals AS princ
JOIN sys.database_permissions AS perm
    ON perm.grantee_principal_id = princ.principal_id
WHERE princ.name = 'User_A';
