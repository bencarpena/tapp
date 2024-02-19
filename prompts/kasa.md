# Manage kasa devices
> Documentation here: https://github.com/python-kasa/python-kasa

## install
> Docs: https://pypi.org/project/python-kasa/

- Install : `pip3 install python-kasa`
    - Error encountered; needed to install Rust : `curl https://sh.rustup.rs -sSf | sh`



## discover
- `kasa discover`

## list all devices and their state
- `kasa state`

## turn on/off
- Turn on bulb : `kasa --host 10.0.0.161 on`
- Turn off bulb : `kasa --host 10.0.0.161 off`

## brightness
- Set brightness to 100% : `kasa --host 10.0.0.161 brightness 100`
- Set brightness to 10% in 5 sec transition : `kasa --host 10.0.0.161 brightness --transition 5000 10`

## color 
- hsv : `tbd`

## socket
- Turn on socket named 'blitzen' : `kasa --host 10.0.0.244 on --name 'blitzen'`
- Turn on socket named 'blitzen' : `kasa --host 10.0.0.244 on --name 'Olaf'`