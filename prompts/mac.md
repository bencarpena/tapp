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
|sysctl -a "|" grep machdep.cpu |- Retrieve kernel state|
|top -F -n0 -s3 "|" grep "CPU usage" |	- CPU Usage |
|system_profiler SPSoftwareDataType|- Get OS details|



3	sw_vers	- OS ver
4	- Ps aux	- Process report
	- Top
	
5	uname -a	- Display quick info on M1
6	ps -ef 	
7	cat /proc/cpuinfo	- Works only for Raspi
8	ifconfig -a | grep inet | grep cast	
9	sysctl -n machdep.cpu.brand_string	- Get simplified Processor info
	
10	sysctl -a | grep machdep.cpu	- Retrieve kernel statex
		- Get CPU info detail
		- 
11	top -F -n0 -s3 | grep "CPU usage"	- CPU Usage
12	system_profiler	- system_profiler SPSoftwareDataType
		
		
		
