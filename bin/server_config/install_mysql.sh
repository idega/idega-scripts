#!/bin/bash

echo "#########################################################################"
echo "# A script to install MySQL database                                    #"
echo "# By Martynas Stakė (martynas@idega.is) 2015                            #"
echo "#########################################################################"
echo "\n"

echo "# Installing mysql repository..."
s3cmd get s3://idega-backup/rpm/mysql-community-release-el7-5.noarch.rpm
sudo rpm -Uvh mysql-community-release-el7-5.noarch.rpm
rm -f mysql-community-release-el7-5.noarch.rpm

echo "# Installing mysql-community-server..."
sudo yum -y install mysql-community-server

echo "# Starting mysql-community-server..."
sudo systemctl start mysqld

echo "# Configuring mysql-community-server..."
mysql_secure_installation