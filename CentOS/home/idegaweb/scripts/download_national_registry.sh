#!/bin/sh
HOST='1.2.4.4';
USER='username';
PASSWORD='password';
FILE='filename';

ftp -nAd $HOST <<END_SCRIPT
quote USER $USER
quote PASS $PASSWORD
get $FILE
quit
END_SCRIPT
exit 0
