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
    http://www.golf.is/rest/clubs