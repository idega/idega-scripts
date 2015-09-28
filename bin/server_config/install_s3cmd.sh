#!/bin/bash

echo "#########################################################################"
echo "# A script to install Amazon S3cmd                                      #"
echo "# By Martynas Stakė (martynas@idega.is) 2015                            #"
echo "#########################################################################"
echo "\n"

echo "# Enabling s3cmd 1.0.0 repository to CentOS..."
cd /etc/yum.repos.d
sudo wget http://s3tools.org/repo/RHEL_6/s3tools.repo
echo "# Installing s3cmd 1.0.0..."
sudo yum -y install s3cmd
echo "# Done. Don't forget to create $HOME/.s3cfg"