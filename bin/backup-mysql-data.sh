#!/bin/bash
MYSQL_DATABASE_NAME="database";
MYSQL_DATABASE_USERNAME="username";
MYSQL_DATABASE_PASSWORD="password";

DOMAIN_NAME="www.idega.is";
REPOSITORY_PATH="$HOME/tomcat/$DOMAIN_NAME";
FORMATTED_DATE=$(date +%Y-%m-%d);
BACKUP_FOLDER="$HOME/backup/";
DOMAIN_BACKUP_FOLDER="$BACKUP_FOLDER$DOMAIN_NAME/";
FOLDER_NAME="$DOMAIN_BACKUP_FOLDER$FORMATTED_DATE";
DATABASE_DUMP_FILE_NAME="$MYSQL_DATABASE_NAME-UTF8-$FORMATTED_DATE.sql.gz";
DATABASE_DATA_DUMP_FILE_PATH="$FOLDER_NAME/data-$DATABASE_DUMP_FILE_NAME";
DATABASE_TABLES_DUMP_FILE_PATH="$FOLDER_NAME/tables-$DATABASE_DUMP_FILE_NAME";

mkdir -p $FOLDER_NAME;

mysqldump \
                 -u $MYSQL_DATABASE_USERNAME \
                 -h localhost \
                 --password=$MYSQL_DATABASE_PASSWORD \
                 --default-character-set=utf8 \
                 --max_allowed_packet=1024M \
                 --skip-add-drop-table \
                 --skip-add-locks \
                 --skip-comments \
                 --skip-triggers \
                 --no-create-db \
                 --replace \
                 --no-data \
                 --single-transaction $MYSQL_DATABASE_NAME | gzip -9 > $DATABASE_TABLES_DUMP_FILE_PATH;

mysqldump \
                -u $MYSQL_DATABASE_USERNAME \
                -h localhost \
                --password=$MYSQL_DATABASE_PASSWORD \
                --default-character-set=utf8 \
                --max_allowed_packet=1024M \
                --skip-add-drop-table \
                --skip-add-locks \
                --skip-comments \
                --skip-triggers \
                --extended-insert \
                --complete-insert \
                --no-create-db \
                --replace \
                --no-create-info \
                --no-create-info \
                --single-transaction $MYSQL_DATABASE_NAME | gzip -9 > $DATABASE_DATA_DUMP_FILE_PATH;