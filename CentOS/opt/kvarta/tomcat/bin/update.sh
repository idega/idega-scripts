#!/bin/bash
#
# Script finds new WAR files and moves it to Tomcat
#
WAR_FILE_OWNER=kvarta
SFTP_FOLDER=/var/local/sftp/$WAR_FILE_OWNER/wars

if [ -z "$(ls -A $SFTP_FOLDER)" ]; then
        echo "No WAR file found. No updates required."
else
        for WAR_FILE_PATH in $SFTP_FOLDER/*.war; do
                WAR_FILE_NAME="$(basename "$WAR_FILE_PATH" .war)"
                echo "Processing update for $WAR_FILE_NAME ...";

                echo "Removing old WAR... "
                rm -rf ../webapps/$WAR_FILE_NAME*

                echo "Extracting $WAR_FILE_PATH file..."
                unzip $WAR_FILE_PATH -d ../webapps/$WAR_FILE_NAME

                echo "Touching files..."
                find ../webapps/$WAR_FILE_NAME ! -name . -prune -type d -exec touch {} +

                echo "Restoring reading rights..."
                chown -R $WAR_FILE_OWNER:$WAR_FILE_OWNER ../webapps/$WAR_FILE_NAME
                restorecon -F -R ../webapps/$WAR_FILE_NAME

                echo "Removing $WAR_FILE_PATH file..."
                rm -f $WAR_FILE_PATH
        done
fi

echo "Starting server..."
./startup.sh
