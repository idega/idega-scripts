#!/bin/sh

printf '#############################################################\n'
printf '# A script to test Areas#getAreas on                        #\n'
printf '# 127.0.0.1:8080/rest/areas                                 #\n'  
printf '# By Martynas Stakė (martynas@idega.is) 2015                #\n'
printf '#############################################################\n'
printf '\n'

curl --insecure \
    --include \
    --request GET \
    127.0.0.1:8080/rest/areas