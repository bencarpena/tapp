# Installation

## RabbitMQ on Raspberry Pi
### Install
sudo apt-get install rabbitmq-server
### Start on boot
sudo systemctl enable rabbitmq-server

### Start now
sudo systemctl start rabbitmq-server

### Install web-based management interface
sudo rabbitmq-plugins enable rabbitmq_management

### Create a new administrator account
rabbitmqctl add_user newadmin s0m3p4ssw0rd
rabbitmqctl set_user_tags newadmin administrator
rabbitmqctl set_permissions -p / newadmin ".*" ".*" ".*"


rabbitmqctl add_user rogeradmin h0endervangers
rabbitmqctl set_user_tags rogeradmin administrator
rabbitmqctl set_permissions -p / rogeradmin ".*" ".*" ".*"


### Visit web interface
http://raspberrypi:15672/
http://192.168.0.20:15672/

Recommend you delete the ‘guest’ account.

- Reference: http://pont.ist/rabbit-mq/