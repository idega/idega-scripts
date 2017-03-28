#!/bin/bash

echo "#########################################################################"
echo "# A script to set upd firewalld                                         #"
echo "# By Martynas Stakė (martynas@idega.is) 2017                            #"
echo "#########################################################################"
echo "\n"

sudo systemctl restart firewalld.service
sudo firewall-cmd --zone=public --permanent --add-service=http
sudo firewall-cmd --zone=public --permanent --add-service=https
sudo firewall-cmd --reload
sudo firewall-cmd --zone=public --list-services