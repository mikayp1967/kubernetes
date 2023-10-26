#!/bin/bash

# Create or delete a load of K8s namespaces for test purposes. 



NS_LIST=(
    "dev1"
    "dev2"
    "dev3"
    "dev4"
    "int1"
    "int2"
    "int3"
    "staging"
    "prod"
)

# I know I can have multiple modes that overwrite each other, just leaving that in for future flexibility to add switches
MODE="help"
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -c|create)
    MODE="create"
    shift
    ;; 
    -d|delete|del)
    MODE="delete"
    shift
    ;; 
    -h|help)
    MODE="help"
    shift
    ;;
    -l|list)
    MODE="list"
    shift
    ;;
esac
done

case $MODE in 
    help)
    printf "\n"
    printf "Help message.\n\nmake-ns.sh [flag]\n"
    printf "    -c|create        Create namespaces\n"
    printf "    -d|delete|del    Delete namespaces\n"
    printf "    -l|list          List namespaces & status\n"
    printf "    -h|help          Help message\n"
    ;;
    create)
    for N_S in "${NS_LIST[@]}"; do
        printf "Creating namespace $N_S \n"
        kubectl create ns $N_S 2>&1 >/dev/null &
    done
    ;;
    delete)
    for N_S in "${NS_LIST[@]}"; do
        printf "Destroying namespace $N_S \n"
        kubectl delete ns $N_S 2>&1 >/dev/null &
    done
    ;;
    list)
    printf "Namespaces managed by this script:\n"
    for N_S in "${NS_LIST[@]}"; do
           STATUS=$(kubectl get ns $N_S -o jsonpath='{.status.phase}' 2>/dev/null )
           if [[ "$STATUS" == "" ]]; then STATUS="* ABSENT *"; fi
        printf "    $N_S \t\t ${STATUS} \n"
    done
    ;;
esac
