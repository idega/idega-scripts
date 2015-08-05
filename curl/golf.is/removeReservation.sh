#!/bin/sh

printf '#####################################################################\n'
printf '# A script to test TeeTimesReservationWebservice#reservationReservation on #\n'
printf '# 127.0.0.1:8080/api/teeTimes/reservation                           #\n'
printf '# By Martynas Stakė (martynas@idega.is) 2015                        #\n'
printf '#####################################################################\n'
printf '\n'

curl --insecure \
    --include \
    --request DELETE \
    --header "Accept: application/json" \
    "127.0.0.1:8080/api/teeTimes/reservation?courseId=33&date=2015-08-01&groupNumber=40"
