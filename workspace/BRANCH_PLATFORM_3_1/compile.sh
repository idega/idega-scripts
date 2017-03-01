#!/bin/bash
echo "###############################################################\n"
echo "# A script to compile BRANCH_PLATFORM_3_1                     #\n"
echo "# By Martynas Stakė (martynas@idega.is) 2017                  #\n"
echo "###############################################################\n"
echo "\n"

PLATFORM_FOLDER="$HOME/BRANCH_PLATFORM_3_1";
MODULES_FOLDER="$PLATFORM_FOLDER/modules";
APPLICATION_FOLDER="$PLATFORM_FOLDER/etravel";
MAVEN_FOLDER="$PLATFORM_FOLDER/maven";
MAVEN_PATH="$MAVEN_FOLDER/bin/maven";

cd $MODULES_FOLDER;
$MAVEN_PATH multiproject:goal -Dgoal=clean; 
$MAVEN_PATH multiproject:goal -Dgoal=java:compile; 
$MAVEN_PATH multiproject:goal -Dgoal=iw-bundle:install;
for file in com.*; do
	echo $file;
		mkdir -p $file/target/test-classes
done
for file in is.*; do
	echo $file;
		mkdir -p $file/target/test-classes
done
for file in org.*; do
	echo $file;
		mkdir -p $file/target/test-classes
done

cd $APPLICATION_FOLDER;
$MAVEN_PATH clean; 
$MAVEN_PATH iw-bundle:install;
