FROM ubuntu:18.04
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y mysql-server

RUN sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf

COPY setup.sql /docker-entrypoint-initdb.d/

EXPOSE 3306 33060

ENTRYPOINT ["service", "mysql", "start"]
RUN mysql < /docker-entrypoint-initdb.d/setup.sql
