#!/bin/sh

printf '#############################################################\n'
printf '# A script to test TeeTimeGroupPlayersWebservice#add on     #\n'
printf '# 127.0.0.1:8080/api/teetime/group/players                  #\n'
printf '# By Martynas Stakė (martynas@idega.is) 2016                #\n'
printf '#############################################################\n'
printf '\n'

curl --insecure \
    --include \
    --request POST \
    --header "Accept: application/json" \
    --header "GroupId: 1" \
    --header "PersonalId: 2108487119" \
    "127.0.0.1:8080/api/teetime/group/players?access_token=8bfe3c4f-f1d5-4db8-a29b-7a974dd6ecf9"
