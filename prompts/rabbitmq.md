## My common rabbitmq commands

> Further reading [here](https://www.rabbitmq.com/management-cli.html) 

| # | Command | Notes |
|---|---|---|
|1| rabbitmqadmin list exchanges | list exchanges in platform|
|2| rabbitmqadmin list queues | list all queues |
|3| rabbitmqadmin get queue=hermes requeue=true count=10 | list all messages for a queue but do not destroy messages|
