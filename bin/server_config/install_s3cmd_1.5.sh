#!/bin/bash

echo "#########################################################################"
echo "# A script to install Amazon S3cmd                                      #"
echo "# By Martynas Stakė (martynas@idega.is) 2015                            #"
echo "#########################################################################"
echo "\n"

echo "# Enabling s3cmd 1.5 repository to CentOS..."
wget http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-9.noarch.rpm
sudo rpm -ivh epel-release-7-9.noarch.rpm
rm -f epel-release-7-9.noarch.rpm

echo "# Installing s3cmd 1.5..."
sudo yum -y install s3cmd

s3cmd --configure