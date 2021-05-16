#!/bin/bash

echo "* Add hosts ..."
echo "192.168.7.23 centos.host.home centos" >> /etc/hosts

echo "* Add Docker repository ..."
dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

echo "* Add the missing dependency ..."
dnf install -y https://download.docker.com/linux/centos/7/x86_64/stable/Packages/containerd.io-1.2.13-3.1.el7.x86_64.rpm

echo "* Install Docker ..."
dnf install -y docker-ce docker-ce-cli

echo "* Enable Docker auto-start..."
systemctl enable docker

echo "* Add vagrant user to docker group ..."
usermod -aG docker vagrant

echo "* Firewall - open port 8080 ..."
firewall-cmd --add-port=8080/tcp --permanent

echo "* Firewall - reload rules ..."
firewall-cmd --reload

echo "* Start Docker"
systemctl start docker

echo "* Build docker image ..."
cd /web/
docker image build -t apache-1 .

echo "* Run Docker Container ..."
docker container run -d -p 8080:80 --name apache-web apache-1
