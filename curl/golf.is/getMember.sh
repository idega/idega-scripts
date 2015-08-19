#!/bin/sh

printf '#############################################################\n'
printf '# A script to test GolferSearch#getXMLOrJSON on             #\n'
printf '# http://www.golf.is/rest/golferSearch                          #\n'  
printf '# By Martynas Stakė (martynas@idega.is) 2015                #\n'
printf '#############################################################\n'
printf '\n'

curl --insecure \
    --include \
    --request GET \
    --header "Accept: application/json" \
    http://www.golf.is/rest/golferSearch/?personalID=2903612499 > member.json
