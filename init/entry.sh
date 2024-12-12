#!/bin/sh

openssl genpkey -algorithm RSA -out /certs/client.key  -pkeyopt rsa_keygen_bits:2048

openssl req -new -key /certs/client.key -out /certs/client.csr -config /mnt/openssl.cnf

openssl x509 -req -days 365 \
  -in /certs/client.csr \
  -signkey /certs/client.key \
  -out /certs/client.pem \
  -extensions v3_req \
  -extfile /mnt/openssl.cnf