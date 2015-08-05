#!/bin/sh

printf '#############################################################\n'
printf '# A script to test TeeTimeGolfers#getXMLOrJSON on           #\n'
printf '# 127.0.0.1:8080/api/teeTimeGolfers                         #\n'
printf '# By Martynas Stakė (martynas@idega.is) 2015                #\n'
printf '#############################################################\n'
printf '\n'

curl --insecure \
    --include \
    --request GET \
    --header "Accept: application/json" \
    "127.0.0.1:8080/api/teeTimeGolfers/?courseID=33&date=2015-06-15&time=13:00"
