#!/bin/bash

echo "###############################################################\n"
echo "# A script to backup data of test/production server           #\n"
echo "# By Martynas Stakė (martynas@idega.is) 2014                  #\n"
echo "###############################################################\n"
echo "\n"

# . /u01/app/oracle/product/11.2.0/xe/bin/oracle_env.sh

DOMAIN_NAME="idega.is";

ORACLE_DATABASE_SID="sid";
ORACLE_DATABASE_USERNAME="username";
ORACLE_DATABASE_PASSWORD="password";
ORACLE_DATABASE_HOST="database_host";
ORACLE_CONNECTION_CONFIGURATION="(DESCRIPTION\=(ADDRESS_LIST\=(ADDRESS\=(PROTOCOL\=TCP)(HOST\=$ORACLE_DATABASE_HOST)(PORT\=1521)))(CONNECT_DATA\=(SID\=$ORACLE_DATABASE_SID)))";

REPOSITORY_PATH="$HOME/tomcat/$DOMAIN_NAME";
REPOSITORY_PATH_BIN="$REPOSITORY_PATH/bin";
REPOSITORY_PATH_CONF="$REPOSITORY_PATH/conf";
REPOSITORY_PATH_FOCAL="$REPOSITORY_PATH/focal";
REPOSITORY_PATH_JCR="$REPOSITORY_PATH/jcr_store";
REPOSITORY_PATH_LIB="$REPOSITORY_PATH/lib";
REPOSITORY_PATH_LUCENE="$REPOSITORY_PATH/lucene";
REPOSITORY_PATH_WEBAPPS="$REPOSITORY_PATH/webapps";

FORMATTED_DATE=$(date +%Y-%m-%d);

BACKUP_FOLDER="$HOME/backup/";
DOMAIN_BACKUP_FOLDER="$BACKUP_FOLDER$DOMAIN_NAME/";
FOLDER_NAME="$DOMAIN_BACKUP_FOLDER$FORMATTED_DATE";

DATABASE_DUMP_FILE_NAME="$ORACLE_DATABASE_USERNAME-UTF8-$FORMATTED_DATE.dmp";
REPOSITORY_ARCHIVE_NAME="$DOMAIN_NAME-$FORMATTED_DATE.tar.gz";

DATABASE_DUMP_FILE_PATH="$FOLDER_NAME/$DATABASE_DUMP_FILE_NAME";
REPOSITORY_ARCHIVE_PATH="$FOLDER_NAME/$REPOSITORY_ARCHIVE_NAME";

REMOTE_HOME_FOLDER="idegaweb@leonard.idega.is:/home/idegaweb";
REMOTE_BACKUP_FOLDER="$REMOTE_HOME_FOLDER/backup";
REMOTE_DOMAIN_BACKUP_FOLDER="$REMOTE_BACKUP_FOLDER/$DOMAIN_NAME";
REMOTE_FINAL_BACKUP_FOLDER_NAME="$REMOTE_DOMAIN_BACKUP_FOLDER/$FORMATTED_DATE";

ORACLE_LOG="$FOLDER_NAME/export.log";
ORACLE_OUTPUT="$FOLDER_NAME/output.log";


echo "Creating backup for: $DOMAIN_NAME on: $FORMATTED_DATE";

echo "Backup will be saved in directory: $FOLDER_NAME";

if [ ! -d "$BACKUP_FOLDER" ]; then
        echo "Creating directory: $BACKUP_FOLDER";
        mkdir $BACKUP_FOLDER;
fi

if [ ! -d "$DOMAIN_BACKUP_FOLDER" ]; then
        echo "Creating directory: $DOMAIN_BACKUP_FOLDER";
        mkdir $DOMAIN_BACKUP_FOLDER;
fi

if [ ! -d "$FOLDER_NAME" ]; then
        echo "Creating directory: $FOLDER_NAME";
        mkdir $FOLDER_NAME;
fi

# DATABASE DUMP
if [ ! -f "$DATABASE_DUMP_FILE_PATH" ]; then
        echo "Creating dump file by path: $DATABASE_DUMP_FILE_PATH";
        exp $ORACLE_DATABASE_USERNAME/$ORACLE_DATABASE_PASSWORD@"$ORACLE_CONNECTION_CONFIGURATION" \
               file="$DATABASE_DUMP_FILE_PATH" \
               log=$ORACLE_LOG \
               2>$ORACLE_OUTPUT;
        if [ -f "$DATABASE_DUMP_FILE_PATH" ]; then
                echo "Copying database dump to $REMOTE_FINAL_BACKUP_FOLDER_NAME!";
                scp $DATABASE_DUMP_FILE_PATH $REMOTE_FINAL_BACKUP_FOLDER_NAME;
                rm -f $DATABASE_DUMP_FILE_PATH;
        else
                echo "Failed to create database dump!";
        fi
else
        echo "Dump by path: $DATABASE_DUMP_FILE_PATH already exist!";
fi

# REPOSITORY BACKUP
if [ ! -f "$REPOSITORY_ARCHIVE_PATH" ]; then
        if [ -d "$REPOSITORY_PATH" ]; then
                echo "Creating Tomcat archive by path: $REPOSITORY_ARCHIVE_PATH";
                tar -zcf $REPOSITORY_ARCHIVE_PATH \
                        $REPOSITORY_PATH_BIN \
                        $REPOSITORY_PATH_CONF \
                        $REPOSITORY_PATH_FOCAL \
                        $REPOSITORY_PATH_JCR \
                        $REPOSITORY_PATH_LIB \
                        $REPOSITORY_PATH_LUCENE \
                        $REPOSITORY_PATH_WEBAPPS;
                if [ -f "$REPOSITORY_ARCHIVE_PATH" ]; then
                        echo "Copying repository archive to $REMOTE_FINAL_BACKUP_FOLDER_NAME!";
                        scp $REPOSITORY_ARCHIVE_PATH $REMOTE_FINAL_BACKUP_FOLDER_NAME;
                        rm -f $REPOSITORY_ARCHIVE_PATH;
                else
                        echo "Failed to create repository archive!";
                fi
        else
                echo "Required repository: $REPOSITORY_PATH does not exist!"
        fi
else
        echo "Archive by path: $REPOSITORY_ARCHIVE_PATH already exist!";
fi