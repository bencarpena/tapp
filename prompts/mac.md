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
|ifconfig -a | grep inet | grep cast|- Get IP Address|
|sysctl -n machdep.cpu.brand_string|- Get simplified Processor info|
|```sysctl -a | grep machdep.cpu``` |- Retrieve kernel state|
|```top -F -n0 -s3 | grep "CPU usage"``` |	- CPU Usage |
|system_profiler SPSoftwareDataType|- Get OS details|




		
		
		
