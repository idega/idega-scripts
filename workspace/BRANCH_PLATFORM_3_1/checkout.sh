#!/bin/bash
echo "###############################################################\n"
echo "# A script to checkout modules for BRANCH_PLATFORM_3_1        #\n"
echo "# By Aleksandras Sivkovas (aleksandras@idega.is) 2017         #\n"
echo "###############################################################\n"
echo "\n"
path=(	
	com.idega.core 
	com.idega.block.web2.0
	com.idega.faces
	com.idega.webface
	com.idega.block.login
	org.apache.slide
	com.idega.slide
	com.idega.block.rss
	com.idega.content
	com.idega.block.article
	com.idega.builder
	com.idega.block.media
	com.idega.block.banner
	com.idega.block.basket
	com.idega.block.beanshell
	com.idega.block.category
	com.idega.block.image
	org.apache.axis
	com.idega.block.text
	com.idega.block.trade
	com.idega.block.creditcard
	com.idega.block.entity
	com.idega.block.navigation
	com.idega.block.news
	com.idega.block.process
	com.idega.block.process.webservice
	com.idega.user
	com.idega.workspace
	com.idega.developer
	com.idega.dwr
	com.idega.graphics
	com.idega.manager
	com.idega.setup
	is.idega.travel
	org.apache.myfaces
)

mkdir -p $HOME/BRANCH_PLATFORM_3_1/
git clone -b BRANCH_PLATFORM_3_1 git@github.com:idega/etravel $HOME/BRANCH_PLATFORM_3_1/etravel
git clone -b BRANCH_PLATFORM_3_1 https://github.com/idega/eplatform.git $HOME/BRANCH_PLATFORM_3_1/eplatform
for (( i = 0 ; i < ${#path[@]} ; i++ )) do
	echo "---------------------------------"
	echo ${path[$i]}
	echo "---------------------------------"
	git clone -b BRANCH_PLATFORM_3_1 git@github.com:idega/${path[$i]} $HOME/BRANCH_PLATFORM_3_1/${path[$i]}
done
