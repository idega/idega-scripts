#!/bin/sh

printf '#############################################################\n'
printf '# A script to test PlayerFavoriteFieldsWebservice on        #\n'
printf '# http://127.0.0.1:8080/api/fields/favorites                #\n'
printf '# By Martynas Stakė (martynas@idega.is) 2016                #\n'
printf '#############################################################\n'
printf '\n'

curl --insecure \
    --include \
    --request DELETE \
    --header "Accept: application/json" \
    --header "FieldId: 12" \
    "http://127.0.0.1:8080/api/fields/favorite?access_token=8bfe3c4f-f1d5-4db8-a29b-7a974dd6ecf9"
