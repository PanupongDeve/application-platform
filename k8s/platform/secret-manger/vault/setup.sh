#!/bin/bash

sudo sysctl -w vm.max_map_count=262144
#helm repo add hashicorp https://helm.releases.hashicorp.com
#helm repo update
#helm search repo hashicorp

microk8s.helm3 repo add hashicorp https://helm.releases.hashicorp.com
microk8s.helm3 repo update
microk8s.helm3 search repo hashicorp