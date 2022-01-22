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
del * /s /q