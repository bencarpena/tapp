--#1 use Master
CREATE LOGIN dbo_wizowner
WITH PASSWORD ='1supersecret'


--#2 use <target db here>
-- Assign the newly created login
-- db_owner = role; more here https://learn.microsoft.com/en-us/sql/relational-databases/security/authentication-access/database-level-roles?view=sql-server-ver16

CREATE USER dbo_wiz_owner FROM LOGIN dbo_wizowner;


EXEC sp_addrolemember 'db_owner', 'dbo_wiz_owner';


--#3 use the creds to login to SQL DB
user: dbo_wizowner
pwd : '1supersecret'
