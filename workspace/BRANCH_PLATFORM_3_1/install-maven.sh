#!/bin/bash
echo "###############################################################\n"
echo "# A script to install Maven for BRANCH_PLATFORM_3_1           #\n"
echo "# By Martynas Stakė (martynas@idega.is) 2017                  #\n"
echo "###############################################################\n"
echo "\n"

PLATFORM_FOLDER="$HOME/BRANCH_PLATFORM_3_1";
MAVEN_FOLDER="$PLATFORM_FOLDER/maven";

MAVEN_ARCHIVE="maven-1.1.tar.gz";
MAVEN_ARCHIVE_PATH="$PLATFORM_FOLDER/$MAVEN_ARCHIVE";

wget http://archive.apache.org/dist/maven/binaries/$MAVEN_ARCHIVE -P $PLATFORM_FOLDER; 

mkdir -p $MAVEN_FOLDER;
tar -xf $MAVEN_ARCHIVE_PATH --directory $MAVEN_FOLDER --strip-components=1;
rm -rf $MAVEN_ARCHIVE_PATH;