#!/bin/sh

printf '#############################################################\n'
printf '# A script to test MunicipalityGateway#doEditSettings on    #\n'
printf '# 127.0.0.1:8080/municipality/settings                      #\n'  
printf '# By Martynas Stakė (martynas@idega.is) 2014                #\n'
printf '#############################################################\n'
printf '\n'

curl --insecure \
    --include \
    --request PUT \
    --header "Accept: application/json" \
    --header "Content-Type: application/json" \
    --data @resources/editSettings.json \
    https://munizapp.sidan.is/municipality/settings;