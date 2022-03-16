argocd app create pg-admin-4 \
 --repo https://github.com/PanupongDeve/application-platform \
 --path ./k8s/development/platform/monitoring/pg-admin/pg-admin-application/ \
 --dest-server https://kubernetes.default.svc \
 --dest-namespace pg-admin-development