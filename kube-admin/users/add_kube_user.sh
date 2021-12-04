#!/bin/bash
#
# Script to "create user" in kube
# This script is just the user/cert creation step
#
# Run this as root - I won't validate this cos bored of everything being bash scripts...
#   add_kube_user.sh <user_name>

# Gonna do minimal validation cos that really isn't the point here

    CA_LOCATION="/etc/kubernetes/pki/"
    CERT_LOCATION="/var/mycerts/"

    if [ ! -d "${CERT_LOCATION}" ]; then
        mkdir ${CERT_LOCATION}
        chmod 600 ${CERT_LOCATION}
    fi

    USER_ID=$1
    if [ $# -eq 1 ]; then
        printf "Defaulting to 90 day cert"
        CERT_DAYS=90
    else
        CERT_DAYS=$2
    fi

# Generate/sign keys for user
    openssl genrsa -out ${CERT_LOCATION}${USER_ID}.key 2048
    openssl req -new -key ${CERT_LOCATION}${USER_ID}.key -out ${CERT_LOCATION}${USER_ID}.csr -subj "/CN=${USER_ID}/O=Mikayp/L=Barnsley"

    openssl x509 -req -in ${CERT_LOCATION}${USER_ID}.csr -CA ${CA_LOCATION}/ca.crt -CAkey ${CA_LOCATION}/ca.key -CAcreateserial -out ${CERT_LOCATION}${USER_ID}.crt -days ${CERT_DAYS}
