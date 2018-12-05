#!/bin/bash
#
# Download necessary code for ePlatform addons
#
mkdir -p $HOME/source;
cd $HOME/source;
git clone git@github.com:idega/com.idega.block.addon.git --recursive --single-branch -b BRANCH_PLATFORM_5

cd $HOME/source/com.idega.block.addon;
git submodule foreach git checkout BRANCH_PLATFORM_5;
git submodule foreach git pull origin BRANCH_PLATFORM_5;
mvn clean install -DskipTests;
cd $HOME;