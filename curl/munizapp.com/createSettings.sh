#!/bin/sh

printf '#############################################################\n'
printf '# A script to test MunicipalityGateway#doCreateSettings on  #\n'
printf '# 127.0.0.1:8080/municipality/settings                      #\n'  
printf '# By Martynas Stakė (martynas@idega.is) 2014                #\n'
printf '#############################################################\n'
printf '\n'

curl --include \
    --request POST \
    --header "Accept: application/json" \
    --header "Content-Type: application/json" \
    --data @resources/createSettings.json \
    127.0.0.1:8080/municipality/settings;