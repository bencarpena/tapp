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
	
## GPIO
- `gpio -v`
- `gpio readall`
-  https://pimylifeup.com/raspberry-pi-gpio/


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

##	Check CPU info 
- `cat /proc/cpuinfo`

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

##	cat /etc/os-release
- `cat /etc/os-release`
- get OS details of Raspi

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