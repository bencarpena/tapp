/*
NAME:       SQL scripts to shrink database files

========================================================================================
CHANGE LOG
@bcarpena   :   20220805    :   Initial draft


ISSUE:
    Could not allocate space for object 'dbo.WORKFILE GROUP large record overflow storage:  
    141039472476160' in database 'tempdb' 
    because the 'PRIMARY' filegroup is full. Create disk space by deleting unneeded files, 
    dropping objects in the filegroup, adding additional files to the filegroup, 
    or setting autogrowth on for existing files in the filegroup.

RESOLUTION:
    Shrink files in tempdb

========================================================================================
*/

use tempdb
Go

-- 1)   ######## CHECK directories ##############
EXEC xp_cmdshell 'dir G:\'


EXEC xp_cmdshell 'fsutil volume diskfree c:'

EXEC xp_cmdshell 'fsutil volume diskfree f:'

EXEC xp_cmdshell 'fsutil volume diskfree g:'

EXEC xp_cmdshell 'dir g:'

EXEC xp_cmdshell 'dir g:\TempDB'


dbcc showfilestats

dbcc checkdb

-- 2   ########### SHRINK! ###########

dbcc shrinkfile (N'tempdev_new_08', 5000) 

-- 3    ######### RESULTS ###########
/*


output
Total # of free bytes        : 10485760 (10.00MB)
Total # of bytes             : 549737922560 (511.98GB)
Total # of avail free bytes  : 10485760 (10.00MB)

------------

output
Total # of free bytes        : 350178902016 (326.13GB)
Total # of bytes             : 549737922560 (511.98GB)
Total # of avail free bytes  : 350178902016 (326.13GB)




*/

