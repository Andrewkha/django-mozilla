FROM ubuntu:18.04
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y mysql-server

RUN sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf
RUN mysql -uroot <<< "CREATE USER 'admin'@'%' IDENTIFIED BY 'my-secret-pw'"
RUN mysql -uroot <<< "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%'"
RUN mysql -uroot <<< "FLUSH PRIVILEGES"

mysql -uroot <<< "CREATE DATABASE library"