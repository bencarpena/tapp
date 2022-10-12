Rem ======================================================================
Rem This batch file commits files and merges them to main branch at Github
Rem ======================================================================

Rem This is for Linux systemsdt=$(date '+%Y%m%d_%H%M%S');

set day=%date:~7,2%
set month=%date:~4,2%
set year=%date:~10,4%

set today=%year%%month%%day% 

echo "=================================="
echo "Commit tag: " %today% 
echo "=================================="

git add .
git commit -m " %today% %time% "
git push origin main

pause