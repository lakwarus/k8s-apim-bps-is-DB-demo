#!/usr/bin/env bash

# ------------------------------------------------------------------------
# Copyright 2017 WSO2, Inc. (http://wso2.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License
# ------------------------------------------------------------------------

# methods
function echoBold () {
    echo $'\e[1m'"${1}"$'\e[0m'
}

set -e

# configuration maps
kubectl create configmap wso2ei-bps-conf --from-file=./confs/bps/repository/conf/
kubectl create configmap wso2ei-bps-conf-axis2 --from-file=./confs/bps/repository/conf/
kubectl create configmap wso2ei-bps-conf-datasources --from-file=./confs/bps/repository/conf/datasources/
kubectl create configmap wso2ei-bps-conf-tomcat --from-file=./confs/bps/repository/conf/tomcat/
kubectl create configmap wso2ei-bps-conf-epr --from-file=./confs/bps/repository/conf/epr/
kubectl create configmap wso2ei-bps-conf-bpmn-explorer --from-file=./confs/bps/repository/deployment/server/jaggeryapps/bpmn-explorer/config/
kubectl create configmap wso2ei-bps-conf-humantask-explorer --from-file=./confs/bps/repository/deployment/server/jaggeryapps/humantask-explorer/config

#
kubectl create -f resources/volumes/persistent-volumes.yaml
sleep 3s
kubectl create -f resources/bps/wso2ei-bps-volume-claim.yaml
sleep 3s
kubectl create -f resources/bps/wso2ei-bps-deployment.yaml
kubectl create -f resources/bps/wso2ei-bps-service.yaml
kubectl create -f resources/bps/wso2ei-bps-ingress.yaml

