#!/usr/bin/env bash

# install openssl if it is not
sudo apt install openssl -y

DIR='./certificates/'

# lets create the certificate directory
mkdir -p $DIR

# generate cert authority priv key
openssl genrsa -out $DIR/localhost_priv.pem

# generate cert signing request
openssl req \
-nodes -newkey rsa:2048 \
-key $DIR/localhost_priv.pem \
-out $DIR/localhost.csr \
-subj "/C=GB/ST=London/L=London/O=Grundstein/OU=Applied Wizardry./CN=localhost"

# generate actual x509 certificate
openssl x509 -req \
-in $DIR/localhost.csr \
-signkey $DIR/localhost_priv.pem \
-out $DIR/localhost.pem
