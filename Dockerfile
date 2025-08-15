FROM mysql:latest

ENV MYSQL_ROOT_PASSWORD=password

COPY ./initializeDB.sql /docker-entrypoint-initdb.d/