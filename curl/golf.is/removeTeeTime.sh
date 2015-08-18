#!/bin/sh

printf '#############################################################\n'
printf '# A script to test TournamentList#getXMLOrJSON on           #\n'
printf '# http://www.golf.is/api/teeTimeBooking                     #\n'  
printf '# By Martynas Stakė (martynas@idega.is) 2015                #\n'
printf '#############################################################\n'
printf '\n'

curl --insecure \
    --include \
    --request DELETE \
    --header "Accept: application/json" \
    "http://www.golf.is/api/teeTimeBooking?personalID=2903612499&courseID=33&date=2015-07-10&groupNumber=34"
