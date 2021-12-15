#!/bin/bash
# Bacup etcd

# Super messy code alert! Not making assumptions other than ETCD is on this host but there has to be a better way!

CERT=$(ps -C etcd -o 'cmd:400' |sed 's/ --/\
 --/g'|grep -- "--cert-file"|sed 's/.*=//')
EP=$(ps -C etcd -o 'cmd:400' |sed 's/ --/\
 --/g'|grep -- "--advertise-client"|sed 's/.*https...//')
KEY=$(ps -C etcd -o 'cmd:400' |sed 's/ --/\
 --/g'|grep -- "--key-file"|sed 's/.*=//')

export ETCDCTL_API=3
etcdctl snapshot save --cacert=/etc/kubernetes/pki/etcd/ca.crt \
    --cert=${CERT} \
    --endpoints=${EP} \
    --key=${KEY} /var/backups/etcd-backup

# Lets pretend I copy it to an S3 bucket or something
# Also the version that gets installed (3.2.26) STILL has the bug where if you do a status on
# the snapshot it corrupts it. Nice............

# Might make this run off an ansible playbook sometime...