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
| sed (stream editor)| `sed 's/C:\\TEMP\\scripting\\destination\\//g' amendments-transfer-report.txt`|
| go to specific line sed (faster)| `sed -n '7543p' file.csv |
| go to specific line grep | grep -n '' file.csv | grep "^7543:" |
| go to specific line awk | awk 'NR==7543' file.csv |
| grep two strings | grep -nra -e "HFUB219" -e "1010054715" *.csv --with-filename >> ../anomaly4-ownervaluenull.csv |

## Get memory size

- `vm_stat`
- `sysctl hw.memsize | awk '{printf "%.2f GB\n", $2/1073741824}'`
- `sysctl hw.memsize`
		
		
## list only directories

- `ls -l | grep '^d'`


## ----------------------------------------
## macOS Memory Monitoring Cheat Sheet
## ----------------------------------------


## Memory & System Commands
> `top -l 1 | grep PhysMem`

| Purpose | Command | Description |
|---------|---------|-------------|
| Quick memory summary | `top -l 1 \| grep PhysMem` | Shows RAM used, wired, compressed, and unused memory. |
| Installed RAM | `sysctl -n hw.memsize` | Displays total installed RAM in bytes. |
| Installed RAM (GB) | `echo "$(($(sysctl -n hw.memsize)/1024/1024/1024)) GB"` | Displays installed RAM in gigabytes. |
| Virtual memory statistics | `vm_stat` | Displays page-level virtual memory statistics. |
| Memory pressure | `memory_pressure` | Reports current memory pressure and compression activity. |
| Swap usage | `sysctl vm.swapusage` | Shows total, used, and free swap space. |
| Live system monitor | `top` | Interactive system monitor. Press **q** to quit. |
| Sort live processes by memory | `top -o mem` | Interactive process list sorted by memory usage. |
| One-time memory snapshot | `top -l 1 -o mem` | Takes a single snapshot sorted by memory usage. |
| Memory snapshot (custom columns) | `top -l 1 -o mem -stats pid,command,mem,cpu` | Displays PID, command, memory, and CPU usage. |

---

## Process Analysis

| Purpose | Command | Description |
|---------|---------|-------------|
| Top 20 processes by RSS | `ps -axo pid,comm,rss \| sort -nrk3 \| head -20` | Shows the largest resident memory consumers. |
| Top 30 processes by % Memory | `ps -axo pid,%mem,rss,command \| sort -nrk2 \| head -30` | Displays memory percentage, RSS, and full command. |
| Top processes (ps aux) | `ps aux \| sort -nrk4 \| head -20` | Lists processes sorted by memory usage. |
| Search for a process | `ps aux \| grep <process>` | Find running processes by name. |
| Count running processes | `ps -A \| wc -l` | Displays total number of running processes. |

---

## CPU & Load

| Purpose | Command | Description |
|---------|---------|-------------|
| System load averages | `uptime` | Displays uptime and CPU load averages. |
| Top CPU consumers | `ps aux \| sort -nrk3 \| head -20` | Lists processes using the most CPU. |

---

## Hardware Information

| Purpose | Command | Description |
|---------|---------|-------------|
| Hardware summary | `system_profiler SPHardwareDataType` | Displays hardware information. |
| Memory hardware details | `system_profiler SPMemoryDataType` | Shows installed memory modules. |
| macOS version | `sw_vers` | Displays macOS version information. |

---

## Disk & Swap

| Purpose | Command | Description |
|---------|---------|-------------|
| Filesystem usage | `df -h` | Displays disk usage in human-readable format. |
| Largest directories | `du -sh * \| sort -h` | Lists directories sorted by size. |

---

## Process Management

| Purpose | Command | Description |
|---------|---------|-------------|
| Open Activity Monitor | `open -a "Activity Monitor"` | Launches Activity Monitor. |
| View open files for a PID | `lsof -p <PID>` | Displays files opened by a process. |
| Gracefully terminate a process | `kill <PID>` | Sends SIGTERM to a process. |
| Force terminate a process | `kill -9 <PID>` | Sends SIGKILL to a process. |

---

# Interpreting Memory Metrics

| Metric | Healthy | Moderate | High Pressure |
|--------|---------|----------|---------------|
| Unused RAM | Several GB | 1–2 GB | Less than 1 GB |
| Compressed Memory | < 5 GB | 5–10 GB | > 10 GB |
| Swap Usage | 0 GB | 1–3 GB | > 5 GB |
| Memory Pressure | Green | Yellow | Red |

---

# Recommended Diagnostic Workflow

| Step | Command | Purpose |
|------|---------|---------|
| 1 | `top -l 1 \| grep PhysMem` | Check current memory usage. |
| 2 | `sysctl vm.swapusage` | Determine swap usage. |
| 3 | `memory_pressure` | Check memory pressure. |
| 4 | `ps -axo pid,%mem,rss,command \| sort -nrk2 \| head -30` | Identify top memory consumers. |
| 5 | `uptime` | Check CPU load averages. |
| 6 | `echo "$(($(sysctl -n hw.memsize)/1024/1024/1024)) GB"` | Verify installed RAM. |