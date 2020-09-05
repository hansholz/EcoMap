#!/bin/bash

yum -y update
amazon-linux-extras -y install epel
yum -y install git python2-pip python-devel httpd mod_wsgi mysql-devel gcc MySQL-python memcached libxslt-devel libxml2-devel
pip install --upgrade setuptools
pip install --upgrade pip
pip install --ignore-installed -r requirements.txt

cp ./httpd_configs/httpd.conf /etc/httpd/conf/httpd.conf
cp ./httpd_configs/ecomap.conf /etc/httpd/conf.d/ecomap.conf
chown -R apache /home/ec2-user/
chown -R apache:apache /home/ec2-user/EcoMap/
service httpd start
