#!/bin/bash

cp ./httpd_configs/httpd.conf /etc/httpd/conf/httpd.conf
cp ./httpd_configs/ecomap.conf /etc/httpd/conf.d/ecomap.conf
chown -R apache /home/ec2-user/
chown -R apache:apache /home/ec2-user/EcoMap/
service httpd start
