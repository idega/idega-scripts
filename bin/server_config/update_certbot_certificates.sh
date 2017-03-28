#!/bin/bash

echo "#########################################################################"
echo "# A script to install or update certificates for domains                #"
echo "# By Martynas Stakė (martynas@idega.is) 2016                            #"
echo "#########################################################################"
echo "\n"

DIFFIE_HELLMAN_FILE="/etc/ssl/certs/dhparam.pem"
SIGNING_REQUEST_FOLDER="/etc/pki/tls/csr/"
DOMAINS=( idega.is )

echo "Installing OpenSSL if does not exist..."
sudo yum -y install openssl

if [ ! -d "$SIGNING_REQUEST_FOLDER" ]; then
        echo "Creating directory: $SIGNING_REQUEST_FOLDER"
        sudo mkdir -p $SIGNING_REQUEST_FOLDER
fi

if [ ! -f "$DIFFIE_HELLMAN_FILE" ]; then
        echo "Creating file by path: $DIFFIE_HELLMAN_FILE"
        sudo openssl dhparam -out $DIFFIE_HELLMAN_FILE 4096
fi

for NAME in "${DOMAINS[@]}"
do
    CERTIFICATE_FILE="/etc/pki/tls/certs/certbot.$NAME.crt"
    SIGNING_REQUEST_FILE="$SIGNING_REQUEST_FOLDER$NAME.csr"
    PRIVATE_KEY_FILE="/etc/pki/tls/private/$NAME.key"
    DOCUMENT_ROOT="/var/www/html/$NAME"

    if [ ! -f "$SIGNING_REQUEST_FILE" ]; then
        echo "Creating file by path: $SIGNING_REQUEST_FILE";
        sudo openssl req \
            -newkey rsa:4096 \
            -nodes \
            -subj "/C=IS/ST=Reykjavik/L=Reykjavik/O=Idega/CN=$NAME" \
            -keyout $PRIVATE_KEY_FILE \
            -out $SIGNING_REQUEST_FILE
    fi

    if [ -f "$CERTIFICATE_FILE" ]; then
        sudo rm -rf $CERTIFICATE_FILE
    fi

    if [ ! -d "$DOCUMENT_ROOT" ]; then
        echo "Creating directory: $DOCUMENT_ROOT"
        sudo mkdir -p $DOCUMENT_ROOT
    fi

    sudo certbot certonly --noninteractive \
            --webroot -w $DOCUMENT_ROOT \
            --csr $SIGNING_REQUEST_FILE \
            --fullchain-path $CERTIFICATE_FILE
done

sudo service nginx stop
sudo service nginx start
