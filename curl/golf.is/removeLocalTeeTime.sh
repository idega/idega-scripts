#!/bin/sh

printf '#############################################################\n'
printf '# A script to test TournamentList#getXMLOrJSON on           #\n'
printf '# 127.0.0.1:8080/rest/teeTimeBooking                        #\n'  
printf '# By Martynas Stakė (martynas@idega.is) 2015                #\n'
printf '#############################################################\n'
printf '\n'

curl --insecure \
    --include \
    --request DELETE \
    --header "Accept: application/json" \
    "127.0.0.1:8080/rest/teeTimeBooking?personalID=2903612499&courseID=33&date=2015-07-10&groupNumber=34"