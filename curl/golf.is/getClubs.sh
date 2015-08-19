#!/bin/sh

printf '#############################################################\n'
printf '# A script to test Clubs#getXMLOrJSON on                    #\n'
printf '# http://www.golf.is/rest/clubs                                 #\n'  
printf '# By Martynas Stakė (martynas@idega.is) 2015                #\n'
printf '#############################################################\n'
printf '\n'

curl --insecure \
    --include \
    --request GET \
    --header "Accept: application/json" \
    "http://www.golf.is/rest/clubs?personalID=2903612499&abbreviation=gkg" > clubs.json
