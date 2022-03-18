#!/bin/bash
echo "Please, type project for building."
read -p 'project: ' project


echo "Please, type environment for building example development, UAT, production."
echo "<Warning> - Makesure, You created values-<environment>.yaml in platform application for you build."
echo "<Warning> - After builded, you will create argocd manifest at ./deploy/<environment>"
read -p 'environment: ' env



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