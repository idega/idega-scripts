#!/bin/bash

echo "###############################################################\n"
echo "# A script to install Amazon S3cmd                            #\n"
echo "# By Martynas Stakė (martynas@idega.is) 2015                  #\n"
echo "###############################################################\n"
echo "\n"

echo "# Enabling s3cmd 1.0.0 repository to CentOS                   #\n"
cd /etc/yum.repos.d
sudo wget http://s3tools.org/repo/RHEL_6/s3tools.repo
echo "# Installing s3cmd 1.0.0                                      #\n"
sudo yum -y install s3cmd
echo "# Done. Don't forget to create $HOME/.s3cfg                   #\n"