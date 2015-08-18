#!/bin/sh

printf '#####################################################################\n'
printf '# A script to test TeeTimesReservationWebservice#makeReservation on #\n'
printf '# 127.0.0.1:8080/api/teeTimes/reservation                           #\n'
printf '# By Martynas Stakė (martynas@idega.is) 2015                        #\n'
printf '#####################################################################\n'
printf '\n'

curl --insecure \
    --include \
    --request POST \
    --header "Accept: application/json" \
    --header "Content-Type:application/json" \
    --data @resources/reservation.json \
    "http://www.golf.is/api/teeTimes/reservation"
