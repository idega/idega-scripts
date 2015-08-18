#!/bin/sh

printf '#####################################################################\n'
printf '# A script to test TeeTimesReservationWebservice#storeStartingtime  #\n'
printf '# http://www.golf.is/api/teeTimes                                   #\n'
printf '# By Martynas Stakė (martynas@idega.is) 2015                        #\n'
printf '#####################################################################\n'
printf '\n'

curl --insecure \
    --include \
    --request POST \
    --header "Accept: application/json" \
    "http://www.golf.is/api/teeTimes?reservationKey=34a939b8-c05e-4e8b-a98f-0c480632e89a"
