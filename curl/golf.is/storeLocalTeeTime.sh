#!/bin/sh

printf '#####################################################################\n'
printf '# A script to test TeeTimesReservationWebservice#storeStartingtime  #\n'
printf '# 127.0.0.1:8080/api/teeTimes                                       #\n'
printf '# By Martynas Stakė (martynas@idega.is) 2015                        #\n'
printf '#####################################################################\n'
printf '\n'

curl --insecure \
    --include \
    --request POST \
    --header "Accept: application/json" \
    --data "personalID=2903612499" \
    --data "courseID=79" \
    --data "date=2015-08-07" \
    --data "groupNumber=66" \
    "127.0.0.1:8080/api/teeTimes"
