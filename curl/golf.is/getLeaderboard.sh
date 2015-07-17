#!/bin/sh

printf '#############################################################\n'
printf '# A script to test Leaderboard#getXMLOrJSON on              #\n'
printf '# http://www.golf.is/rest/leaderboard                           #\n'  
printf '# By Martynas Stakė (martynas@idega.is) 2015                #\n'
printf '#############################################################\n'
printf '\n'

curl --insecure \
    --include \
    --request GET \
    http://www.golf.is/rest/leaderboard/?tournamentID=20862