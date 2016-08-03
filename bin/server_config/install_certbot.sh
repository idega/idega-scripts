#!/bin/bash

echo "#########################################################################";
echo "# A script to install certbot                                           #";
echo "# By Martynas Stakė (martynas@idega.is) 2016                            #";
echo "#########################################################################";
echo "\n"

echo "# Installing certbot repository...";
sudo yum -y install epel-release;

echo "# Installing certbot...";
sudo yum -y install certbot;

echo "# Configuring certbot...";
sudo certbot certonly;
