#!/bin/sh

printf '#############################################################\n'
printf '# A script to test MunicipalityGateway#getIssue on          #\n'
printf '# 127.0.0.1:8080/municipality/issues/1105                   #\n'  
printf '# By Martynas Stakė (martynas@idega.is) 2014                #\n'
printf '#############################################################\n'
printf '\n'

curl --insecure \
    --include \
    --request GET \
    --header "userId: 0000000001" \
    --header "municipalityId: 938742e1-3d9c-4e80-991c-080c487cb2e3" \
    --header "Accept: application/json" \
    https://munizapp.sidan.is/municipality/issues/1105;