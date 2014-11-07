#!/bin/sh

printf '#############################################################\n'
printf '# A script to test MunicipalityGateway#doCreateIssue on     #\n'
printf '# 127.0.0.1:8080/municipality/issues                        #\n'  
printf '# By Martynas Stakė (martynas@idega.is) 2014                #\n'
printf '#############################################################\n'
printf '\n'

curl --insecure \
    --include \
    --request POST \
    --header "municipalityId: 938742e1-3d9c-4e80-991c-080c487cb2e3" \
    --header "Accept: application/json" \
    --header "Content-Type: application/json" \
    --data @resources/createIssue.json \
    https://munizapp.sidan.is/municipality/issues;