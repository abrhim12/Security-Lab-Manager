#!/bin/bash

echo WARNING! Need docker and docker compose to work. This script will attempt to isntall and configure it if it doesnt exist. This is for Centos7
read -p "Press enter to continue"

echo Installing docker
yum install curl -y
yum install docker -y
systemctl start docker
systemctl status docker
systemctl enable docker
sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo Opening firewall
firewall-cmd --zone=public --add-port=8080/tcp --permanent
firewall-cmd --zone=public --add-port=8443/tcp --permanent
firewall-cmd --reload

echo Starting docker containers
docker-compose up -d