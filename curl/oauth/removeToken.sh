#!/bin/sh

printf '#############################################################\n'
printf '# A script to test URI protected by Spring Security on      #\n'
printf '# 127.0.0.1:8080/token/management                          #\n'
printf '# By Martynas Stakė (martynas@idega.is) 2015                #\n'
printf '#############################################################\n'
printf '\n'

curl \
	--insecure \
	--include \
	--request DELETE \
	--header "Accept: application/json" \
	"http://localhost:8082/token/management?access_token=522620b3-b0d5-4ad5-a543-33037945bbc1"