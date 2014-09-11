#!/bin/sh

printf '#############################################################\n'
printf '# A script to test MunicipalityGateway#doDeleteIssue on     #\n'
printf '# 127.0.0.1:8080/municipality/issues/1104                   #\n'  
printf '# By Martynas Stakė (martynas@idega.is) 2014                #\n'
printf '#############################################################\n'
printf '\n'

curl --include \
    --request DELETE \
    --header "userId: 0000000001" \
    --header "municipalityId: 741260f2-9061-47c8-96a3-bf2f412fd4c6" \
    --header "Accept: application/json" \
    127.0.0.1:8080/municipality/issues/1107;