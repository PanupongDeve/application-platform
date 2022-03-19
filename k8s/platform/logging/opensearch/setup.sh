#!/bin/bash

sudo sysctl -w vm.max_map_count=262144
# helm repo add opensearch https://opensearch-project.github.io/helm-charts/
# helm repo update
# helm search repo opensearch

microk8s.helm3 repo add opensearch https://opensearch-project.github.io/helm-charts/
microk8s.helm3 repo update
microk8s.helm3 search repo opensearch