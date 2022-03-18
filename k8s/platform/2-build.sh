#!/bin/bash

# flags
mysql=0
pg4=1


echo "Please, type project for building."
read -p 'project: ' project


echo "Please, type environment for building example development, UAT, production."
echo "<Warning> - Makesure, You created values-<environment>.yaml in platform application for you build."
echo "<Warning> - After builded, you will create argocd manifest at ./deploy/<environment>"
read -p 'environment: ' env

mkdir -p ./deploy/$project-$env

cp -r ./deploy/script-template/*.sh ./deploy/$project-$env/ 

# --------------------------- build data -------------------------------

if [ "$mysql" == "1" ];then
echo "------------------ Create Database Argocd file ----------------------------------"
echo "cleaning files"

echo "building database"
mkdir -p ./database/mysql/mysql-$project-$env || true
helm template mysql -f ./database/mysql/mysql-template/values-$project-$env.yaml  ./database/mysql/mysql-template/ > ./database/mysql/mysql-$project-$env/application.yaml



cat <<EOF > ./deploy/$project-$env/$project-database-deploy.yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: mysql-$project-$env
  namespace: argocd
  finalizers:
    - resources-finalizer.argocd.argoproj.io
spec:
  destination:
    namespace: $project-$env
    server: https://kubernetes.default.svc
  project: default
  source:
    path: k8s/platform/database/mysql/mysql-$project-$env/
    repoURL: https://github.com/PanupongDeve/application-platform
    targetRevision: HEAD
EOF
echo "------------------ Create Database Argocd file Sucess ----------------------------------"
fi

if [ "$pg4" == "1" ];then
echo "------------------ Create PG Admin 4 Argocd file ----------------------------------"
echo "cleaning files"

echo "building pg-admin"
mkdir -p ./monitoring/pg-admin/pg-admin-$project-$env || true
helm template mysql -f ./monitoring/pg-admin/pg-admin-template/values-$project-$env.yaml  ./monitoring/pg-admin/pg-admin-template/ > ./monitoring/pg-admin/pg-admin-$project-$env/application.yaml


cat <<EOF > ./deploy/$project-$env/$project-pg-admin-deploy.yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: pg-admin-4-$project-$env
  namespace: argocd
  finalizers:
    - resources-finalizer.argocd.argoproj.io
spec:
  destination:
    namespace: $project-$env
    server: https://kubernetes.default.svc
  project: default
  source:
    path: k8s/platform/monitoring/pg-admin/pg-admin-$project-$env
    repoURL: https://github.com/PanupongDeve/application-platform
    targetRevision: HEAD
EOF
echo "------------------ Create PG Admin 4 Argocd file Sucess ----------------------------------"
fi

echo "build finish"
