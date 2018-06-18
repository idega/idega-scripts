#!/bin/bash

echo "#########################################################################"
echo "# A script to install Java Developement Kit 8                           #"
echo "# By Martynas Stakė (martynas@idega.is) 2015                            #"
echo "#########################################################################"
echo "\n"

echo "# Installing Java Developement Kit 8..."
s3cmd get s3://idega-backup/rpm/jdk-8u171-linux-x64.rpm
sudo rpm -i jdk-8u171-linux-x64.rpm
rm -rf jdk-8u171-linux-x64.rpm
