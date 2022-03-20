  microk8s.helm3 install consul hashicorp/consul --values helm-consul-values.yaml --namespace nescafe-dev
  microk8s.helm3 install vault hashicorp/vault --values helm-valt-values.yaml --namespace nescafe-dev


  #helm install consul hashicorp/consul --values helm-consul-values.yaml --namespace nescafe-dev
  #helm install vault hashicorp/vault --values helm-valt-values.yaml  --namespace nescafe-dev

  sleep 10
  #VAULT_UNSEAL_KEY=microk8s.kubectl exec -n nescafe-dev  vault-0  -- vault operator init -key-shares=1 -key-threshold=1 -format=json | cat - | jq -r ".unseal_keys_b64[]" 
  
  #microk8s.kubectl exec -n nescafe-dev vault-0 -- vault operator unseal 
  #microk8s.kubectl exec -n nescafe-dev vault-1 -- vault operator unseal 
  #microk8s.kubectl exec -n nescafe-dev vault-2 -- vault operator unseal 

  #kubectl exec -n nescafe-dev vault-0 -- vault operator unseal 
  #kubectl exec -n nescafe-dev vault-1 -- vault operator unseal 
  #kubectl exec -n nescafe-dev vault-2 -- vault operator unseal 
