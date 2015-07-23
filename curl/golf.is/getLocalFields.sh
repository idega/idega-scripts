#!/bin/sh

printf '#############################################################\n'
printf '# A script to test FieldWebservice#getFields on             #\n'
printf '# 127.0.0.1:8080/api/fields                                 #\n'
printf '# By Martynas Stakė (martynas@idega.is) 2015                #\n'
printf '#############################################################\n'
printf '\n'

curl --insecure \
    --include \
    --request GET \
    "127.0.0.1:8080/api/fields?personalID=2903612499&holes=18&name=dalu&unionID=84"
