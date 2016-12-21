#!/bin/sh

printf '#############################################################\n'
printf '# A script to test TeeTimeGroupWebservice#getGroups on      #\n'
printf '# 127.0.0.1:8080/api/teetime/group                          #\n'
printf '# By Martynas Stakė (martynas@idega.is) 2016                #\n'
printf '#############################################################\n'
printf '\n'

curl --insecure \
    --include \
    --request GET \
    --header "Accept: application/json" \
    --header "IsOwner: true" \
    --header "IsMember: true" \
    "127.0.0.1:8080/api/teetime/group?access_token=8bfe3c4f-f1d5-4db8-a29b-7a974dd6ecf9"
