#!/bin/sh

printf '#############################################################\n'
printf '# A script to test FieldWebservice#getFields on             #\n'
printf '# http://www.golf.is/api/fields                             #\n'
printf '# By Martynas Stakė (martynas@idega.is) 2015                #\n'
printf '#############################################################\n'
printf '\n'

curl --insecure \
    --include \
    --request GET \
    "http://www.golf.is/api/fields?personalID=2903612499&holes=18&name=dalu&unionID=84"
