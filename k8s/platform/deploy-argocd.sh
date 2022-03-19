microk8s.kubectl apply -f ./delivery/argocd/argocd-namespace.yaml
microk8s.kubectl apply -n argocd -f ./delivery/argocd/install.yaml 

# kubectl apply -f ./delivery/argocd/argocd-namespace.yaml
# kubectl apply -n  argocd -f ./delivery/argocd/install.yaml 