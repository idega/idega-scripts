#!/bin/sh

printf '###############################################################\n'
printf '# A script to test                                            #\n'
printf '# MunicipalityGateway#doComment                               #\n'
printf '# on 127.0.0.1:8080/municipality/issues/1105/comment          #\n'  
printf '# By Martynas Stakė (martynas@idega.is) 2014                  #\n'
printf '###############################################################\n'
printf '\n'

curl --include \
    --request POST \
    --header "userId: 0000000001" \
    --header "municipalityId: 741260f2-9061-47c8-96a3-bf2f412fd4c6" \
    --header "Content-Type: application/json" \
    --data @resources/commentForIssue.json \
    127.0.0.1:8080/municipality/issues/1105/comment;