#!/bin/sh

printf '#############################################################\n'
printf '# A script to get OAuth access token on                     #\n'
printf '# 127.0.0.1:8080/oauth/token                                #\n'
printf '# By Martynas Stakė (martynas@idega.is) 2015                #\n'
printf '#############################################################\n'
printf '\n'

curl \
	--insecure \
	--include \
	--request POST \
	--header "Accept: application/json" \
	"http://localhost:8080/oauth/token?grant_type=password&client_id=restapp&client_secret=restapp&username=Administrator&password=idega"
