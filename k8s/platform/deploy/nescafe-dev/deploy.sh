#./deploy.sh .

microk8s.kubectl apply -n argocd -f $1
#kubectl apply -n argocd -f .
