FROM ubuntu:18.04
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y mysql-server

RUN sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf
RUN service mysql start
RUN ["/bin/bash", "-c", "CREATE USER 'admin'@'%' IDENTIFIED BY 'my-secret-pw'"]
RUN ["/bin/bash", "-c", "CGRANT ALL PRIVILEGES ON *.* TO 'admin'@'%'"]
RUN ["/bin/bash", "-c", "FLUSH PRIVILEGES"]
RUN ["/bin/bash", "-c", "CREATE DATABASE library"]
