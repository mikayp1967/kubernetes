#!/bin/bash
#
# Script to assign role to user in kube
# Inputs will be a user name. role (from a few options), namespace
# For multiple namespaces run this in each one
# I prob should add a revoke option - nah :)
# 


    CA_LOCATION="/etc/kubernetes/pki/"
    CERT_LOCATION="/var/mycerts/"

    

    if [ $# -lt 2 ]; then
        printf "Format is \n\tbind_user.sh <username> <role> [namespace]"
        exit 1
    fi
    
    USER_ID=$1
    USER_ROLE=$2
    if [ $# -eq 2 ]; then
        NS="default"
    else
        NS=$3
    fi        

printf "Setting up rolebinding for ${USER_ID} to role ${USER_ROLE} in NS ${NS}\n"

# Since when do I make such concessions to readability. Only had 1 coffee so far - that must be it
    cat user-rolebinding.tmpl | \
        sed "s/{{ NAME }}/user-role-binding-${USER_ID}/" | \
        sed "s/{{ NS }}/${NS}/" | \
        sed "s/{{ USER }}/${USER_ID}/" | \
        sed "s/{{ ROLE }}/${USER_ROLE}/" > user-rolebinding.yaml
    kubectl apply -f user-rolebinding.yaml

cat user-rolebinding.yaml
