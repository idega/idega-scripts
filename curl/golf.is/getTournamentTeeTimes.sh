#!/bin/sh

printf '#############################################################\n'
printf '# A script to test TeeTimes#getXMLOrJSON on                 #\n'
printf '# http://www.golf.is/api/tournamentTeeTimes                 #\n'
printf '# By Martynas Stakė (martynas@idega.is) 2015                #\n'
printf '#############################################################\n'
printf '\n'

curl --insecure \
    --include \
    --request GET \
    --header "Accept: application/json" \
    "http://www.golf.is/api/tournamentTeeTimes?tournamentID=20862" > tournamentTeeTimes.json
