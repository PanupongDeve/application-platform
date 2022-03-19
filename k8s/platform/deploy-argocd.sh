microk8s.kubectl apply -f ./delivery/argocd/argocd-namespace.yaml
microk8s.kubectl apply -n argocd -f ./delivery/argocd/install.yaml 

# kubectl apply -f ./delivery/argocd/argocd-namespace.yaml
# kubectl apply -n  argocd -f ./delivery/argocd/install.yaml 
cat <<EOF
# username: admin
# password: kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
EOF



