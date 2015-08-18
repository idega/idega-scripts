#!/bin/sh

printf '#####################################################################\n'
printf '# A script to test TeeTimesReservationWebservice#reservationReservation on #\n'
printf '# http://www.golf.is/api/teeTimes/reservation                       #\n'
printf '# By Martynas Stakė (martynas@idega.is) 2015                        #\n'
printf '#####################################################################\n'
printf '\n'

curl --insecure \
    --include \
    --request DELETE \
    --header "Accept: application/json" \
    "http://www.golf.is/api/teeTimes/reservation?reservationKey=34a939b8-c05e-4e8b-a98f-0c480632e89a"
