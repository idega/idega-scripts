#!/bin/sh

printf '#############################################################\n'
printf '# A script to test TournamentTourList#getXMLOrJSON on       #\n'
printf '# 127.0.0.1:8080/rest/tournamentTourList                #\n'  
printf '# By Martynas Stakė (martynas@idega.is) 2015                #\n'
printf '#############################################################\n'
printf '\n'

curl --insecure \
    --include \
    --request GET \
    --header "Accept: application/json" \
    127.0.0.1:8080/rest/tournamentTourList