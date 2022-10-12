/*



*/

use dCIMS
Go



-- ###################
-- # Method #1
-- ###################

SELECT
(SELECT SUM(CAST(df.size as float)) FROM sys.database_files AS df 
   WHERE df.type in ( 0, 2, 4 ) ) AS [DbSize],
SUM(a.total_pages) AS [SpaceUsed],
(SELECT SUM(CAST(df.size as float)) FROM sys.database_files AS df 
   WHERE df.type in (1, 3)) AS [LogSize]
FROM
sys.partitions p join sys.allocation_units a 
  on p.partition_id = a.container_id 
left join sys.internal_tables it 
  on p.object_id = it.object_id

-- ###################
-- # Method #2
-- ###################

  -- Individual File Sizes and space available for current database
-- (Query 36) (File Sizes and Space)
SELECT f.name AS [File Name] , f.physical_name AS [Physical Name], 
CAST((f.size/128.0) AS DECIMAL(15,2)) AS [Total Size in MB],
CAST(f.size/128.0 - CAST(FILEPROPERTY(f.name, 'SpaceUsed') AS int)/128.0 AS DECIMAL(15,2)) 
AS [Available Space In MB], [file_id], fg.name AS [Filegroup Name]
FROM sys.database_files AS f WITH (NOLOCK) 
LEFT OUTER JOIN sys.data_spaces AS fg WITH (NOLOCK) 
ON f.data_space_id = fg.data_space_id OPTION (RECOMPILE);



-- ###################
--# Method #3
-- ###################

EXEC sp_helpdb 'dCIMS'
Go



-- ###################
--# Method #4
-- ###################

SELECT fg.data_space_id AS FGID,
   (f.file_id) AS File_Id,
   -- As provided by OP, size on disk in bytes.
   REPLACE(CONVERT(VARCHAR,CONVERT(MONEY, CAST(f.size AS FLOAT) * 8.00 * 1024), 1), '.00','') AS Size_On_Disk_Bytes,
   ROUND((CAST(f.size AS FLOAT) * 8.00/1024)/1024,3) AS Actual_File_Size,
   ROUND(CAST((f.size) AS FLOAT)/128,2) AS Reserved_MB,
   ROUND(CAST((FILEPROPERTY(f.name,'SpaceUsed')) AS FLOAT)/128,2) AS Used_MB,
   ROUND((CAST((f.size) AS FLOAT)/128)-(CAST((FILEPROPERTY(f.name,'SpaceUsed'))AS FLOAT)/128),2) AS Free_MB,
   f.name,
   f.physical_name
FROM sys.database_files f 
    LEFT JOIN sys.filegroups fg
    ON f.data_space_id = fg.data_space_id

-- Where are the physical locations?
SELECT DISTINCT dovs.logical_volume_name AS LogicalName,
dovs.volume_mount_point AS Drive,
CONVERT(INT,dovs.available_bytes/1048576.0) AS FreeSpaceInMB
FROM sys.master_files mf
CROSS APPLY sys.dm_os_volume_stats(mf.database_id, mf.FILE_ID) dovs
ORDER BY FreeSpaceInMB ASC