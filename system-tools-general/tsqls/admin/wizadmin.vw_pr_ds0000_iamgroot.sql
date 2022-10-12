ALTER VIEW wizadmin.vw_pr_ds0000_iamgroot

WITH ENCRYPTION

AS


SELECT 
    databases.name [Database Name], 
	materfiles.type_desc AS [File Type],
    CAST(
         (materfiles.Size * 8
         ) / 1024.0 AS DECIMAL(18, 1)) AS         [Initial Size (MB)], 
     'By '+IIF(
             materfiles.is_percent_growth = 1, CAST(materfiles.growth AS VARCHAR(10))+'%', CONVERT(VARCHAR(30), CAST(
         (materfiles.growth * 8
         ) / 1024.0 AS DECIMAL(18, 1)))+' MB') AS [Autogrowth], 
     IIF(materfiles.max_size = 0, 'No growth is allowed', IIF(materfiles.max_size = -1, 'Unlimited', CAST(
         (
                 CAST(materfiles.max_size AS BIGINT) * 8
         ) / 1024 AS VARCHAR(30))+' MB')) AS      [MaximumSize]
 FROM	sys.master_files AS materfiles
 
 INNER JOIN sys.databases AS databases ON
 databases.database_id = materfiles.database_id
 
 WHERE	databases.name = 'dSecurity'