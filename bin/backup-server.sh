#!/bin/bash

echo "###############################################################\n"
echo "# A script to backup data of test/production server           #\n"
echo "# By Martynas Stakė (martynas@idega.is) 2014                  #\n"
echo "###############################################################\n"
echo "\n"

DOMAIN_NAME="idega.is";

MYSQL_DATABASE_NAME="database";
MYSQL_DATABASE_USERNAME="username";
MYSQL_DATABASE_PASSWORD="password";

REPOSITORY_PATH="$HOME/tomcat/$DOMAIN_NAME";

BUCKET_PATH="s3://idega-default";

FORMATTED_DATE=$(date +%Y-%m-%d);

BACKUP_FOLDER="$HOME/backup/";
DOMAIN_BACKUP_FOLDER="$BACKUP_FOLDER$DOMAIN_NAME/";
FOLDER_NAME="$DOMAIN_BACKUP_FOLDER$FORMATTED_DATE";

DATABASE_DUMP_FILE_NAME="$MYSQL_DATABASE_NAME-UTF8-$FORMATTED_DATE.sql.gz";
REPOSITORY_ARCHIVE_NAME="$DOMAIN_NAME-$FORMATTED_DATE.tar.gz";

DATABASE_DUMP_FILE_PATH="$FOLDER_NAME/$DATABASE_DUMP_FILE_NAME";
REPOSITORY_ARCHIVE_PATH="$FOLDER_NAME/$REPOSITORY_ARCHIVE_NAME";

OLD_FORMATTED_DATE=$(date +%Y-%m-%d -d "7 days ago");
OLD_FOLDER_NAME="$DOMAIN_BACKUP_FOLDER$OLD_FORMATTED_DATE";

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

if [ ! -f "$DATABASE_DUMP_FILE_PATH" ]; then
	echo "Creating dump file by path: $DATABASE_DUMP_FILE_PATH";
	mysqldump \
		-u $MYSQL_DATABASE_USERNAME \
		-h localhost \
		--password=$MYSQL_DATABASE_PASSWORD \
		--default-character-set=utf8 \
		--max_allowed_packet=1024M \
		--skip-extended-insert \
		--single-transaction $MYSQL_DATABASE_NAME | gzip -9 > $DATABASE_DUMP_FILE_PATH;
		if [ -f "$DATABASE_DUMP_FILE_PATH" ]; then
                        echo "Copying database dump to bucket!";
                        s3cmd put $DATABASE_DUMP_FILE_PATH $BUCKET_PATH;
                else
                        echo "Failed to create database dump!";
                fi
else
	echo "Dump by path: $DATABASE_DUMP_FILE_PATH already exist!";
fi

if [ ! -f "$REPOSITORY_ARCHIVE_PATH" ]; then
	if [ -d "$REPOSITORY_PATH" ]; then	
		echo "Creating Tomcat archive by path: $REPOSITORY_ARCHIVE_PATH";
		tar -zcvf $REPOSITORY_ARCHIVE_PATH $REPOSITORY_PATH;
		if [ -f "$REPOSITORY_ARCHIVE_PATH" ]; then
			echo "Copying repository archive to bucket!";
			s3cmd put $REPOSITORY_ARCHIVE_PATH $BUCKET_PATH;
		else
			echo "Failed to create repository archive!";
		fi
	else
		echo "Required repository: $REPOSITORY_PATH does not exist!"
	fi
else
	echo "Archive by path: $REPOSITORY_ARCHIVE_PATH already exist!";
fi

if [ -d "$OLD_FOLDER_NAME" ]; then
	echo "Removing directory: $OLD_FOLDER_NAME";
	rm -rf $OLD_FOLDER_NAME;
	echo "Backup by date: $OLD_FORMATTED_DATE is removed!";
else
        echo "No old backup was found!";
fi

