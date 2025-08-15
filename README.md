# capstone-database setup

First, pull the official latest mysql image from docker hub
```
docker pull mysql:latest
```

Then create a contianer from that image
```
docker run --name mysql-container -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123 -v mysql-data:/var/lib/mysql/data mysql:latest
```
syntax: 
```
docker run --name [set container name] -p [set the port where it will be served]:[the original port in the docker container] -e MYSQL_ROOT_PASSWORD=[set password] -v [set volume name]:[path where to put it in the docker container] mysql:latest
```
