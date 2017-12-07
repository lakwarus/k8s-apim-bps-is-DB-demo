#!/bin/bash

kubectl create namespace wso2

kubectl create serviceaccount wso2svcacct -n wso2
kubectl config set-context $(kubectl config current-context) --namespace=wso2

kubectl create -f nfs-server-gce-pv.yaml
sleep 3
kubectl create -f nfs-server-rc.yaml 
sleep 3
kubectl create -f nfs-server-service.yaml
