#!/bin/bash

apt-get update -y
apt-get upgrade -y
apt-get install -y default-jdk

useradd -m -U -d /opt/tomcat -s /bin/false tomcat

apt-get install -y unzip wget

cd /tmp
wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.78/bin/apache-tomcat-8.5.78.tar.gz

tar -xzvf apache-tomcat-8.5.78.tar.gz
mkdir -p /opt/tomcat
mv apache-tomcat-8.5.78 /opt/tomcat/

ln -s /opt/tomcat/apache-tomcat-8.5.78 /opt/tomcat/latest

chown -R tomcat: /opt/tomcat

sh -c 'chmod +x /opt/tomcat/latest/bin/*.sh'

cp /vagrant/tomcat.service /etc/init.d/tomcat.service
chmod 755 /etc/init.d/tomcat.service
update-rc.d tomcat.service defaults

service tomcat start