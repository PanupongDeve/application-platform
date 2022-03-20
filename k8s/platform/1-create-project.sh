#!/bin/bash

# flags
mysql=1
pg4=1
opensearch=1
hashivalt=1

echo "Please, type project for building."
read -p 'project: ' project


echo "Please, type environment for building example development, UAT, production."
echo "<Warning> - Makesure, You created values-<environment>.yaml in platform application for you build."
echo "<Warning> - After builded, you will create argocd manifest at ./deploy/<environment>"
read -p 'environment: ' env


echo "------------------------------------ Install Argocd"



if [ "$mysql" == "1" ];then
  echo "------------------ Create Database Value file ----------------------------------"
  cat <<EOF > ./database/mysql/mysql-template/values-$project-$env.yaml
project: $project
environment: $env
config:
  root_password: 
  username: 
  password: 
mysql:
  version: 

networking:
  nodePort: 
  type: 
EOF
  echo "------------------ Create Database Value file success ----------------------------------"

fi

if [ "$pg4" == "1" ];then
  echo "------------------ Create PG-Admin-4 Value file ----------------------------------"
  cat <<EOF > ./monitoring/pg-admin/pg-admin-template/values-$project-$env.yaml
project: $project
environment: $env
config:
  email: pgadmin4@pgadmin.org
  password: admin
pg4:
  version: latest

networking:
  nodePort: 32610
  type: NodePort
EOF
  echo "------------------ Create PG-Admin-4  Value file success ----------------------------------"

fi

if [ "$opensearch" == "1" ];then
echo "------------------ Adding Helm Repo OpenSearch file ----------------------------------"
  ./logging/opensearch/setup.sh
fi

if [ "$hashivalt" == "1" ];then
echo "------------------ Adding Helm Repo OpenSearch file ----------------------------------"
  ./secret-manger/vault/setup.sh
fi