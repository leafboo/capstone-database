# capstone-database setup

First, pull the official latest mysql image from docker hub
```
docker pull mysql:latest
```

Then create a contianer from that image
```
docker run --name [set container name] -p 3306:3306 -e MYSQL_ROOT_PASSWORD=[your password] -v [volume name]:/var/lib/mysql/data mysql:latest
```
