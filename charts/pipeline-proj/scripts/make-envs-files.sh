#!/bin/bash
# copy template environment file to base file for all environments we are managing. Not exactly serious, just gives us diff values to play with.
# I guess after change any that need changing

PATH=$PATH:scripts
LIST_PORT=9080
ENVS=$(. make_ns.sh list|grep Active|sed 's/Active//;s/ //g')
for THIS_ENV in $ENVS 
do 
    cat environments/values-template.yaml |sed "s/LIST_PORT/${LIST_PORT}/" > environments/${THIS_ENV}-values.yaml
    LIST_PORT=$((LIST_PORT+1))
done
