## List files from main including from within subfolders
dir *.pdf /a /b /s

## Delete files from main including from within subfolders
del *.pdf /a /s

## Force delete file
del /f *.pdf /a /s 

## Comments in batchfile
:: This lists files 
dir *.pdf /a /b /s 

## Delete folder and everything in it
rmdir /s FolderName

## List files in tree format
tree /f

## Delete folder and everything in it
:: delete all files first
del * /s /q
:: delete root folder and everything in it; in this case What folder will be deleted and everything in it
rmdir /s /q C:\FolderMain\What

## Display only files in a folder
dir /b /a-d
