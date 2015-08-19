#!/bin/sh

printf '#############################################################\n'
printf '# A script to test TeeTimeBooking#getAvailableTimes on      #\n'
printf '# http://www.golf.is/rest/teeTimeBooking                    #\n'  
printf '# By Martynas Stakė (martynas@idega.is) 2015                #\n'
printf '#############################################################\n'
printf '\n'

curl --insecure \
    --include \
    --request GET \
    --header "Accept: application/json" \
    http://www.golf.is/rest/teeTimeBooking/?courseID=33 > teeTimeBookings.json
