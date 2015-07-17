#!/bin/sh

printf '#############################################################\n'
printf '# A script to test TeeTimeInfo#getXMLOrJSON on              #\n'
printf '# http://www.golf.is/rest/teeTimeInfo                       #\n'
printf '# By Martynas Stakė (martynas@idega.is) 2015                #\n'
printf '#############################################################\n'
printf '\n'

curl --insecure \
    --include \
    --request GET \
    --header "Accept: application/json" \
    "http://www.golf.is/rest/teeTimeInfo?personalID=2903612499&clubID=84&courseID=33&date=2015-07-05"
