#!/bin/sh

printf '#############################################################\n'
printf '# A script to test TournamentServices#getResults on         #\n'
printf '# http://www.golf.is/rest/tournament/results                    #\n'
printf '# By Martynas Stakė (martynas@idega.is) 2015                #\n'
printf '#############################################################\n'
printf '\n'

curl --insecure \
    --include \
    --request GET \
    --header "Accept: application/json" \
    "http://www.golf.is/rest/tournament/results?tourId=20862"