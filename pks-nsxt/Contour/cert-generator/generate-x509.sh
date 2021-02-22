#!/bin/bash

#Required
domain=$1
commonname=$domain


if [ -z "$domain" ]
then
    echo "Argument not present."
    echo "Useage $0 [common name]"

    exit 99
fi

echo "Generating key request for $domain"





passwd=dummypasswd
country=CH
state=Bern
locality=Oberscherli
organization=CNCF
organizationalunit=CNA
email=atozcareer@gmail.com


openssl genrsa -aes256 -passout pass:$passwd -out ${domain}_ca.key 4096
openssl req -passin pass:$passwd  -key ${domain}_ca.key -new -x509 -days 365 -sha256 -extensions v3_ca -out ${domain}_ca.crt -subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"
openssl req --new -passin pass:$passwd  -out ${domain}_server.csr -new -newkey rsa:2048 -nodes -keyout ${domain}_server.key -subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"
openssl x509 -req -days 360 -in ${domain}_server.csr -CA ${domain}_ca.crt -CAkey ${domain}_ca.key -CAcreateserial  -out ${domain}_server.crt -sha256 -passin pass:$passwd



echo "---------------------------"
echo "-----Below is your CSR-----"
echo "---------------------------"
echo
cat  ${domain}_server.csr

echo
echo "---------------------------"
echo "-----Below is your Key-----"
echo "---------------------------"
echo
cat  ${domain}_server.key

echo "Creating kubernetes secret"
echo "kubectl create secret tls ${domain}-secret --key ${domain}_server.key --cert ${domain}_server.crt"
kubectl create secret tls ${domain}-secret --key ${domain}_server.key --cert ${domain}_server.crt


