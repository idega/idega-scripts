#!/bin/bash

echo -e "###########################################################################"
echo -e "# A script to install Oracle XE 11.2.0"
echo -e "# By Martynas Stakė (martynas@idega.is) 2015"
echo -e "# http://docs.oracle.com/cd/E17781_01/install.112/e18802/toc.htm#XEINL101"
echo -e "###########################################################################"
echo -e "\n"

BACKUP_FOLDER="$HOME/backup";
BIN_FOLDER="$BACKUP_FOLDER/bin";
DISK_FOLDER="$BIN_FOLDER/Disk1"

if [ ! -d "$BACKUP_FOLDER" ]; then
    echo -e "# Creating directory: $BACKUP_FOLDER\n";
    mkdir $BACKUP_FOLDER;
fi

if [ ! -d "$BIN_FOLDER" ]; then
    echo -e "# Creating directory: $BIN_FOLDER\n";
    mkdir $BIN_FOLDER;
fi

if command -v s3cmd > /dev/null; then
    s3cmd get s3://idega-backup/bin/oracle-xe-11.2.0-1.0.x86_64.rpm.zip "$BIN_FOLDER/";

    if ! command -v unzip > /dev/null; then
        echo -e "Command 'unzip' not found, installing...\n"; 
        sudo yum -y install unzip; 
    fi

    unzip "$BIN_FOLDER/oracle-xe-11.2.0-1.0.x86_64.rpm.zip" -d "$BIN_FOLDER/";
    if [ -d "$DISK_FOLDER" ]; then
        sudo yum -y install libaio;
        sudo yum -y install bc;
        sudo rpm -ivh "$DISK_FOLDER/oracle-xe-11.2.0-1.0.x86_64.rpm";
        . /u01/app/oracle/product/11.2.0/xe/bin/oracle_env.sh
        sudo /etc/init.d/oracle-xe configure
    else
        echo -e "Folder '$DISK_FOLDER' was not found. Will not continue.\n"; 
    fi
    
else
    echo -e "# Command 's3cmd' not found. Install first. Will not continue.\n"; 
fi
