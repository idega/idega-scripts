#!/bin/sh

printf '#############################################################\n'
printf '# A script to get OAuth access token on                     #\n'
printf '# 127.0.0.1:8080/oauth/token                                #\n'
printf '# By Martynas Stakė (martynas@idega.is) 2015                #\n'
printf '#############################################################\n'
printf '\n'

curl \
        --insecure \
        --include \
        --request POST \
        --header "Accept: application/json" \
        "http://localhost:8080/authentication/oauth/token?grant_type=refresh_token&client_id=restapp&client_secret=restapp&refresh_token=326b908e-6c4d-4638-b1e3-fe2d1db71600"
