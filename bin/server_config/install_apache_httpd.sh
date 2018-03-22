#!/bin/bash

echo "#########################################################################"
echo "# A script to install Apache HTTP server                                #"
echo "# By Martynas Stakė (martynas@idega.is) 2015                            #"
echo "#########################################################################"
echo "\n"

echo "# Installing web server..."
sudo yum -y groupinstall 'Web Server'

echo "# Opening HTTP port in iptables..."
# sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT

echo "# Opening HTTPS port in iptables..."
# sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT

echo "# Installing web server devel packages..."
sudo yum -y install httpd-devel

echo "# Extracting modjk plugin..."
wget http://apache.mirror.serveriai.lt/tomcat/tomcat-connectors/jk/tomcat-connectors-1.2.43-src.tar.gz
tar -xvf tomcat-connectors-1.2.43-src.tar.gz

echo "# Configuring modjk plugin..."
cd tomcat-connectors-1.2.43-src/native/
./configure --with-apxs=/usr/bin/apxs --enable-api-compatibility
sudo make
sudo make install
sudo libtool --finish /usr/lib64/httpd/modules
cd ../../

echo "# Removing source files..."
sudo rm -rf tomcat-connectors*

sudo touch /etc/httpd/conf/workers.properties
sudo chown -R root:root /etc/httpd/conf/workers.properties
sudo chcon system_u:object_r:httpd_config_t:s0 /etc/httpd/conf/workers.properties
