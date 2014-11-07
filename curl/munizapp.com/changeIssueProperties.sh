#!/bin/sh

printf '###############################################################\n'
printf '# A script to test                                            #\n'
printf '# MunicipalityGateway#doChangeIssueProperties                 #\n'
printf '# on 127.0.0.1:8080/municipality/issues/1105/properties       #\n'  
printf '# By Martynas Stakė (martynas@idega.is) 2014                  #\n'
printf '###############################################################\n'
printf '\n'

curl --insecure \
    --include \
    --request POST \
    --header "municipalityId: 938742e1-3d9c-4e80-991c-080c487cb2e3" \
    --header "Content-Type: application/json" \
    --data @resources/changeIssueProperties.json \
    https://munizapp.sidan.is/municipality/issues/1105/properties;