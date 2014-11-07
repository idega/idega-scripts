#!/bin/sh

printf '###############################################################\n'
printf '# A script to test                                            #\n'
printf '# MunicipalityGateway#doConfirmIssueWasReceivedByMunicipality #\n'
printf '# on 127.0.0.1:8080/municipality/issues/1105/confirm          #\n'  
printf '# By Martynas Stakė (martynas@idega.is) 2014                  #\n'
printf '###############################################################\n'
printf '\n'

curl --insecure \
    --include \
    --request PUT \
    --header "municipalityId: 938742e1-3d9c-4e80-991c-080c487cb2e3" \
    https://munizapp.sidan.is/municipality/issues/1105/confirm;