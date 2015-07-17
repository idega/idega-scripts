#!/bin/sh

printf '#############################################################\n'
printf '# A script to test TeeTimeGolfers#getXMLOrJSON on           #\n'
printf '# http://www.golf.is/rest/teeTimeGolfers                    #\n'
printf '# By Martynas Stakė (martynas@idega.is) 2015                #\n'
printf '#############################################################\n'
printf '\n'

curl --insecure \
    --include \
    --request GET \
    --header "Accept: application/json" \
    "http://www.golf.is/rest/teeTimeGolfers/?courseID=33&date=2015-06-15"