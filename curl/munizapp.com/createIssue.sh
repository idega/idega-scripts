#!/bin/sh

printf '#############################################################\n'
printf '# A script to test MunicipalityGateway#doCreateIssue on     #\n'
printf '# 127.0.0.1:8080/municipality/issues                        #\n'  
printf '# By Martynas Stakė (martynas@idega.is) 2014                #\n'
printf '#############################################################\n'
printf '\n'

curl --include \
    --request POST \
    --header "municipalityId: 741260f2-9061-47c8-96a3-bf2f412fd4c6" \
    --header "Accept: application/json" \
    --header "Content-Type: application/json" \
    --data @resources/createIssue.json \
    127.0.0.1:8080/municipality/issues;