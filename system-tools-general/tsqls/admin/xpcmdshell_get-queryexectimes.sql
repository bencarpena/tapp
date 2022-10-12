

-- ############## Get execution times and query performance ##############
SET STATISTICS TIME ON
Go

SET STATISTICS IO ON
Go
-- ######################################################################



-- ############## Execute commandlines, prompts ##############
EXEC xp_cmdshell 'dir'

EXEC xp_cmdshell 'dtexec'

-- ######################################################################

-- ############## Execute DTEXEC ##############
-- Only works if the SQL server has the package outlined in the script:
EXEC xp_cmdshell 'dtexec /File "D:\BitsAndGitsEHSS\CIMS\sql\_demo\ChemAuto.dtsx"'

-- Alternate : Execute using batch files
EXEC xp_cmdshell 'D:\BitsAndGitsEHSS\CIMS\sql\_demo\ChemAuto.bat'

-- ######################################################################

-- Get freespace of a drive
-- ###########################
EXEC xp_cmdshell 'fsutil volume diskfree c:'
