#!/bin/bash

echo "########################################################################";
echo "# A script to create default idega user (as root)                      #";
echo "# By Martynas Stakė (martynas@idega.is) 2015                           #";
echo "########################################################################";
echo "\n"

USERNAME="idegaweb";
HOME_FOLDER="/home/$USERNAME";
SSH_FOLDER="$HOME_FOLDER/.ssh";
AUTHORIZED_KEYS_FILE="$SSH_FOLDER/authorized_keys";
AUTHORIZED_KEYS2_FILE="$SSH_FOLDER/authorized_keys2";

if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user" 2>&1
  exit 1
else
    echo "# Creating '$USERNAME' user...";
    useradd $USERNAME -m -p '$USERNAME';

    echo "# Creating '$SSH_FOLDER' folder...";
    mkdir $SSH_FOLDER;
    chmod 700 $SSH_FOLDER;

    echo "# Creating '$AUTHORIZED_KEYS_FILE' file...";
    touch $AUTHORIZED_KEYS_FILE;

    echo "# Creating '$AUTHORIZED_KEYS2_FILE' file...";
    touch $AUTHORIZED_KEYS2_FILE;

    echo "# Applying permissions...";
    chmod 600 $AUTHORIZED_KEYS_FILE;
    chmod 600 $AUTHORIZED_KEYS2_FILE;
    chown -R $USERNAME:$USERNAME $SSH_FOLDER;

    echo "# Now copy the public keys to created files and try to login.";
fi

