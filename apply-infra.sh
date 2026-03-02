#!/bin/bash

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm upgrade --install kube-prometheus-stack prometheus-community/kube-prometheus-stack \
  --namespace monitoring \
  --create-namespace \
  -f infrastructure/monitoring-values.yml

until minikube kubectl -- get servicemonitors --all-namespaces ; do date; sleep 1; echo ""; done
minikube kubectl -- apply --filename=infrastructure/db.yml,infrastructure/petclinic.yml,infrastructure/postgres-exporter.yml,infrastructure/prometheus.yml 

minikube kubectl -- create configmap jvm-dashboard --from-file=dashboards/grafana.json --namespace=monitoring
minikube kubectl -- create configmap db-dashboard --from-file=dashboards/db.json --namespace=monitoring
minikube kubectl -- create configmap hikaricp-dashboard --from-file=dashboards/hikari.json --namespace=monitoring

minikube kubectl -- label configmaps jvm-dashboard grafana_dashboard=1 --namespace=monitoring
minikube kubectl -- label configmaps db-dashboard grafana_dashboard=1 --namespace=monitoring
minikube kubectl -- label configmaps hikaricp-dashboard grafana_dashboard=1 --namespace=monitoring
