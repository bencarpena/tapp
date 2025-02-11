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

## Automate Python in Windows
1. Create batch file
2. Embed python call / invocation in batch file
3. Schedule at task scheduler
  - Parameters: 
  - [Program Script] C:\windows\system32\cmd.exe
  - [Arguments] /C D:\BitsAndGitsEHSS\hungrypython\sureview\automation\ds40101-sureview-us.bat


## if exists
if exist "c:\workspace\" (echo folder exists) else (folder does not exist)


## display all files and folders
tree /F

## copy files on another folder if pattern matched
`for /f "tokens=*" %a in ('dir /b /s /a-d "F:\DOCS\*230312.a*" ^| findstr /i /r "\\[^\\]*$"') do copy "%a" "destination\LRMidland\230312\Amendment\" /Y`

## find filenames with 'invest' pattern
`dir /a | findstr /i /r invest`

## find in files 'Copy Deal'
`dir /a/ | findstr /i /r /c:"Copy Deal" *.json`
`findstr /i /r /c:"Copy Deal" *.json`

## create a new blank file
`type null > filename.txt`
`notepad filename.txt`