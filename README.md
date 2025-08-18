# Setting up the mysql docker container
Create an image from the Dockerfile
```
docker build -t mysql-image:1.0 .
```

Then create a contianer from that image
```
docker run --name mysql-container -p 3333:3306 -v mysql-data:/var/lib/mysql/data mysql:latest mysql-image:1.0
```

# Making commands in the mysql docker container 
When the docker container is running, execute this command to go inside the mysql client
```
docker exec -it [container name/id] /bin/bash
```

# mysqldump
When the database tables/data have been changed, do this to make a .sql file with the updated database. <br><br>
(you need to be in the directory of where you want to put the .sql file)
```
mysqldump -u root -p -d capstone > capstoneDatabase.sql
```

