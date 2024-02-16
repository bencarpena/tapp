#	Mac Terminal comms
| Command      | Notes |
| ----------- | ----------- |
| powermetrics      | - Get details on hardware       |
| grep -nr "string" *   | - Reads files and looks for specific string        |
|sw_vers|- OS version details|
|ps aux|- Process report|
|top|- Get top running processes|
|uname -a|- Display quick info on M1|
|ps -ef |- My Go-To move to get process details|
|cat /proc/cpuinfo|- Works only for Raspi /Linux|
|cat /etc/os-release|- Get OS version; Works only for Raspi /Linux|
|ifconfig -a | grep inet | grep cast|- Get IP Address|
|sysctl -n machdep.cpu.brand_string|- Get simplified Processor info|
|```sysctl -a | grep machdep.cpu``` |- Retrieve kernel state|
|```top -F -n0 -s3 | grep "CPU usage"``` |	- CPU Usage |
|system_profiler SPSoftwareDataType|- Get OS details|
|Spotlight Search keyboard shortcut|command + space|
|Lock Mac|Ctrl+Shift+Power|
|Zooming in/out| Command+Option 8 or + or -|
|csc hash.cs | compile C# code and create .exe|
|mono hash.exe | run .exe from terminal|
|less +123 -N filename.txt | read specific line numbers from terminal|
|cd ~/.Trash | list all files that are deleted|
|diskutil list | list SSD usage|
|cp -R foldername dest | copy folder and contents|
|get folder size | du -sh <path to folder>|
|execute python script in background | nohup python /path/to/test.py & |
|execute python script in background | python3 /pathtopython/this.py > /dev/null & |
|execute python script in background with log file; ignore stdout and stderr| nohup python /path/to/test.py > output.log > 2>&1 & |
|copy folder and files | `rsync -a /Users/bcarpena/_Projects/AQI.01/ /Users/bcarpena/_Projects/AQI`|
|get cpu info| cat /proc/cpuinfo|
|get memory info | free -h|
|check who ran sudo| sudo cat /var/log/auth.log|
|check service status via `systemctl`| systemctl status cron|
|check service status via `service`|sudo service smbd status|
|restart service via `service`|sudo service smbd restart|
|read line number 28| sed '28!d' df_output.csv|
| find string in multiple files | find . -type f -name "*" -exec grep 'Realm' {} \; |
| create dynamic link | ln -s /Users/benjcarpena/Library/CloudStorage/OneDrive-Personal OneDrive |
| fix cron issues at mac | issue: cron not working, fix is to Go to System Settings > Privacy & Security > Full Disk Access: Click on the (+) icon to add an item to the list. Press command+shift+G, type /usr/sbin/cron and press enter:|
| open crontab in mac using nano | `env EDITOR=nano crontab -e`|
| open file with line numbers | `nl filename.txt` |
| remove multiple folders | `find . -name "F:BARGE*" -print0 | xargs -0 rm -rf`|
| execute in background | python3 /path/gopaperless.py >> output.log & | 
| get disk size | df -kh |
| copy to remote server all directories; remove -r for files | scp -r foldername pi@172.202.77.37:/home/. |
| zip  and compress folder | `zip -r zippedfilename.zip foldertozip/`|
		
		
		
