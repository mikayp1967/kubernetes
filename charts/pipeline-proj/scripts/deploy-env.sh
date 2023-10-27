#!/bin/bash -e

# Deploy a helm chart to a given environment


NAMESPACE=""; ENVIRON=""
MODE="help"

while [[ $# -gt 0 ]]
do
key="$1"
printf "Key: ${key}\n"

case $key in
    -e|--env)
    ENVIRON=$2
    printf "Deploying to environment: ${ENVIRON}\n"
    shift ; shift
    ;; 
    -n|--namespace)
    NAMESPACE=$2
    printf "Deploying to namespace: ${NAMESPACE}\n"
    shift ; shift
    ;; 
    -h|help)
    MODE="help"
    shift
    ;;
    *)
    printf "Error\n"
    MODE="error"
    shift 
    ;;
esac
done


if [[ $ENVIRON = "" ]]; then
    printf "\nEnvironment MUST be specified\n"
    MODE="help"
    exit 1
fi    

if [[ $MODE = "error" ]]; then
    exit 1
fi

printf "Deploying....\n\n"

if [[ $NAMESPACE = "" ]]; then
	NAMESPACE=$ENVIRON
fi


printf "helm upgrade --install \"${ENVIRON}-weather\" --namespace ${NAMESPACE} --values \"environments/${ENVIRON}-values.yaml\" .\n"
helm upgrade --install "${ENVIRON}-weather" --namespace ${NAMESPACE} --values "environments/${ENVIRON}-values.yaml" .
