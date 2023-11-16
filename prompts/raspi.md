# Common commands I use


## Package installs and management
- `sudo apt-get update`
- `sudo apt-get install <package>`
- `sudo apt upgrade`

- `sudo apt-get update && apt-get upgrade  #update (list), upgrade (install)`
- `sudo apt-get update && apt-get dist-upgrade`

## Get raspi config
- `raspi-config`


## Get OS details
- `cat /etc/os-release`

## Text editor
- `geany`


## Determine if 5G is supported by listing all SSIDs 
- `sudo iwlist wlan0 scan | grep ESSID`

## Get Board and device info
- `cat /proc/cpuinfo`
- `pinout`
- `cat /proc/device-tree/model`
- https://www.raspberrypi-spy.co.uk/2012/09/checking-your-raspberry-pi-board-version/
- https://pinout.xyz/

## Check if crontab is running
systemctl status cron

## Check if apache is running
systemctl status apache2


## Check CPU speed on raspi
- Current clock speed: `cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq`
- Minimum clock speed: `cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq`
- Maximum clock speed: `cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq`
	
## GPIO
- `gpio -v`
- `gpio readall`
-  https://pimylifeup.com/raspberry-pi-gpio/

## Make script executable
- chmod +x <yourscript.py>

##	Shell script header
- `!/bin/sh`
- https://stackoverflow.com/questions/3777301/how-to-call-a-shell-script-from-python-code
	
##	LED Test
- https://www.raspberrypi.org/documentation/usage/gpio/python/README.md
	
##	GPIO Zero
- https://gpiozero.readthedocs.io/en/stable/recipes.html
	

##	Check memory info
- `free -m`
- `free -h`

##	Check CPU info and what version of Raspi do I have
- `cat /proc/cpuinfo`
- or ` cat /proc/cpuinfo | grep 'Revision' | awk '{print $3}' | sed 's/^1000//'`
- Complete list of hardware here: https://elinux.org/RPi_HardwareHistory

| Revision | Release Date | Model | Memory | Notes |
|---|---|---|---|---|
|a020d3 | Q1 2018| 3 Model B+ | 1 GB | Mfg by Sony; alphard and alphacentauri|
|a22082 | Q1 2016| 3 Model B | 1 GB | Mfg by Embest; arcturus|
|9000c1| Q1 2017 | Zero W | 512 MB | Mfg by Sony; altair|
|c03115| Q1 2022| 4 Model B | 4 GB| Mfg by Sony; apollo|


## Check if my Raspi is running 32-bit OS or 64-bit + Kernel version
- [Reference](https://forums.raspberrypi.com/viewtopic.php?t=251721#:~:text=Run%20%22uname%20%2Dm%22%20to,then%20it%20is%2032%20bit.)
- `uname -a` or `uname -m` 
    - returns armv71 then it is **32 bit**
    - aarch64 means it is **64 bit**

## Check version of Debian 
- https://ozzmaker.com/check-raspberry-software-hardware-version-command-line/
- `cat /etc/debian_version`

## Check OS release notes
- `cat /etc/os-release`


##	BME280
- https://learn.adafruit.com/adafruit-bme280-humidity-barometric-pressure-temperature-sensor-breakout/pinouts
- https://www.raspberrypi-spy.co.uk/2016/07/using-bme280-i2c-temperature-pressure-sensor-in-python/
- https://pinout.xyz/pinout/pin5_gpio3
- https://raspberrypi.stackexchange.com/questions/48228/how-to-enable-spi-on-raspberry-pi-3


##	I2C
- `i2cdetect -y 1`
- `lsmod | grep i2c_`
- must return i2c_dev and i2c_bcm2708 } found at cat /etc/modules
- https://www.raspberrypi-spy.co.uk/2014/11/enabling-the-i2c-interface-on-the-raspberry-pi/
-  Log:
		- 20190624 : 	returns address of i2c device; embed that in python script
		- 20190624 :	Cleaned and dusted BME280 off and modified script with update DEVICE I2C address
	
##	VNC and SSH
- https://www.youtube.com/watch?v=Oj_6SMktlso&feature=youtu.be


##	Sound
- install `mpg321`
- execute : `amixer cset numid=3 n` #HDMI output
- execute : `amixer cset numid=3 1` #Connected speaker output
- https://www.raspberrypi-spy.co.uk/2013/06/raspberry-pi-command-line-audio/


##	pip3
- `pip3 verify`
- `pip3 list`
- `pip3 freeze`
- `pip3.8 install rpi.gpio`


##	scp (secure copy)
- `scp pi@192.168.1.22:/home/pi/media/us1.jpg .` (copies file from .22 host to local)
- `scp me.jpg pi@altair.local:/home/pi/media/.`

##	ssh (start remote terminal via commandline)
- `ssh pi@192.168.1.56`
- `ssh pi@altair.local`
- `ssh-keygen -R 192.168.1.22` (if encounter WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!)

##	raspistill
- `raspistill -o filenamehere.jpg -co 35 -br 60 -awb greyworld` (closest I got to natural colors)
- Take pictures


##	ngrok
- `ngrok`
- run https on my Raspi (alphard and alphacentauri)
- `./ngrok http 80`

##	cat /etc/rpi-issue
- `cat /etc/rpi-issue`
- get OS details?

##	Get OS version raspi 
- `cat /etc/os-release`
- get OS details of Raspi
- Debian or Raspi OS? Raspi is based on Debian
	- `cat /etc/apt/sources.list.d/raspi.list`
	- if output = deb http://archive.raspberrypi.org/debian/ bullseye main; then you're running Raspberry Pi OS Bullseye

##	ifconfig -a | grep inet | grep cast
- `ifconfig -a | grep inet | grep cast`
- get IP Address 


##	iwgetid
- `iwgetid`
- return SSID my Raspi is connected to

##	Get Performance of Raspi
- `vcgencmd get_throttled`
- >Notes:
	0: under-voltage
	1: arm frequency capped
	2: currently throttled 
	16: under-voltage has occurred
	17: arm frequency capped has occurred
	18: throttling has occurred
	under-voltage occurs when voltage drops below 4.63V. The Pi is throttled
	arm frequency capped occurs with temp > 80'C
	over-temperature occurs with temp > 85'C. The Pi is throttled

## Install and run MySQL on Raspi
- Reference: https://pimylifeup.com/raspberry-pi-mysql/
- sudo mysql -u root -p


## List all installed packages on Raspi
- apt-cache pkgnames
- dpkg-query -l

## RabbitMQ
- Installed at alphard
  - http://192.168.0.20:15672/
- Install notes: http://pont.ist/rabbit-mq/
  

## Connect Raspi to WiFi
- Config @ altair --> /etc/wpa_supplicant/wpa_supplicant.conf
- More notes: https://weworkweplay.com/play/automatically-connect-a-raspberry-pi-to-a-wifi-network/
  - Start here: https://www.youtube.com/watch?v=yn59qX-Td3E
  - https://aallan.medium.com/setting-up-a-headless-raspberry-pi-zero-3ded0b83f274
  - https://raspberrypi.stackexchange.com/questions/11631/how-to-setup-multiple-wifi-networks 

```
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
country=US

network={
	ssid="alphacentauri24"
	psk="yerpwdhere"
	key_mgmt=WPA-PSK
	priority=1
}

network={
	ssid="tesla-guest"
	key_mgmt=NONE
	id_str="tesla-guest"
	priority=2
}

network={
	ssid="Tesla Guest"
	key_mgmt=NONE
	id_str="Tesla Guest"
	priority=3
}

network={
	ssid="MobileAP"
	key_mgmt=WPA-PSK
	proto=RSN
	psk="yersuperpwdhere"
	pairwise=CCMP
	group=CCMP
	auth_alg=OPEN
	priority=5
}
```

## Allow only root to read and edit a file
>File is /Users/benjcarpena/OneDrive/_Projects/Projects/hashes/hash4df/keyvault/darkhold.conf
- Execute `chmod 600 darkhold.conf`
- Then change ownership `chown root darkhold.conf`
- NOTE : ugo 421

## Run C# code in raspi
- Install mono
- `sudo apt update && sudo apt upgrade`
- `sudo apt install mono-complete`
- Compile your C# code:
  - `csc mycode.cs`
  - Now run it : `mono mycode.exe`

  ## sudoers
  - Run `compgen -u` to list all users in the server; can also do `cat /etc/passwd`
  - List all sudoers `grep '^sudo:.*$' /etc/group | cut -d: -f4`
  - Find if a user has sudo privileges `sudo -l -U bcarpena`
    - Sample output:
	```
	Matching Defaults entries for bcarpena on sjc04p1ihsap001:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin
	User bcarpena may run the following commands on sjc04p1ihsap001:
    (ALL) ALL
	```

## Run task in background
sudo nohup python3 /home/wizards/thegoods/BitsAndGitsEHSS/hungrypython/sureview/hungrypythonsureview.us.py &

## Install mono : execute .exe
sudo apt update && sudo apt upgrade
sudo apt install mono-complete
mono


## Setup apollo for analytics workload
> Must be Python 3.9++
- Install the following:
     1. pip3 install scikit-learn
     2. pip3 install slackclient
     3. pip3 install seaborn
     4. [install mono] sudo apt install mono-complete
     5. Install pyodbc
          - sudo apt-get install unixodbc-dev
          - pip3 install pyodbc
     6. pip3 install sqlalchemy


## Setup FreeTDS on apollo
https://stackoverflow.com/questions/44969924/querying-mssql-server-2012-from-a-raspberry-pi-3-using-python-freetds-and-pyodb

sudo apt-get install unixodbc
sudo apt-get install unixodbc-dev
sudo apt-get install freetds-dev
sudo apt-get install tdsodbc
sudo apt-get install freetds-bin 

> Change freeTDS.conf like this

sudo nano /etc/freetds/freetds.conf

Add a block like this :

[sqlserver]
      host = 182.172.2.2    # Remote Sql Server's IP addr
      port = 1433           # this is default
      tds version = 7.0     # this is by the time i post this
      instance = Test1      # your Database name 


> Then set up the /etc/odbcinst.ini file as follows:

[FreeTDS]
Description = FreeTDS unixODBC Driver
Driver = /usr/lib/arm-linux-gnueabihf/odbc/libtdsodbc.so
Setup = /usr/lib/arm-linux-gnueabihf/odbc/libtdsodbc.so
UsageCount = 1

> Then setup the /etc/odbc.ini file as follows:

[NAME1]
Driver = /usr/lib/arm-linux-gnueabihf/odbc/libtdsodbc.so
Description = MSSQL Server
Trace = No
Server = Server2      # IP or host name of the Sql Server
Database = Test1      # DataBase Name
Port = 1433           # This is default
TDS_Version = 7.4

> Now test the connection with this commands (with second one you should get command line access to Sql server

tsql -S sqlserver -U username

Finally if nothing worked try this :

sudo dpkg-reconfigure tdsodbc