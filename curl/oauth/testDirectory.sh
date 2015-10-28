#!/bin/sh

printf '#############################################################\n'
printf '# A script to test URI protected by Spring Security on      #\n'
printf '# 127.0.0.1:8080/api/test                                   #\n'
printf '# By Martynas Stakė (martynas@idega.is) 2015                #\n'
printf '#############################################################\n'
printf '\n'

curl \
	--insecure \
	--include \
	--request GET \
	--header "Accept: application/json" \
	"http://localhost:8080/api/test/?access_token=cdb47deb-ead5-4400-aab4-37de102333fa"
