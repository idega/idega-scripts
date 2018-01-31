#!/bin/bash
OUTPUT_FILE_NAME='result.out';

PATH_SELECTION=( 'api' 'rest' )

SOURCE_FILE_EXPRESSION='localhost_access_log.*.txt';
SOURCE_FILE_NAMES=(`ls $SOURCE_FILE_EXPRESSION`);

for SOURCE_FILE_NAME in "${SOURCE_FILE_NAMES[@]}"
do
        echo "Processing: $SOURCE_FILE_NAME";
        for PATH_VALUE in "${PATH_SELECTION[@]}"
        do
                sed -n '/$PATH_VALUE/p' $SOURCE_FILE_NAME >> $OUTPUT_FILE_NAME;
        done
done