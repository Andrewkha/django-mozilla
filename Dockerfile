FROM ubuntu:18.04
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y mysql-server
