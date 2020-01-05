FROM ubuntu:18.04
RUN sudo apt-get update && sudo apt-get upgrade -y && sudo apt get-install -y python3 mysql-server
