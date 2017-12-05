#!/bin/bash

kubectl delete -f nfs-server-service.yaml
sleep 3
kubectl delete -f nfs-server-rc.yaml 
sleep 3
kubectl delete -f nfs-server-gce-pv.yaml
