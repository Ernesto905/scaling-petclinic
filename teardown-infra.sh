#!/bin/bash 

helm uninstall kube-prometheus-stack --namespace monitoring

minikube kubectl -- delete --filename=infrastructure/db.yml,infrastructure/petclinic.yml,infrastructure/postgres-exporter.yml,infrastructure/prometheus.yml
minikube kubectl -- delete configmap jvm-dashboard --namespace=monitoring
minikube kubectl -- delete configmap db-dashboard --namespace=monitoring
minikube kubectl -- delete configmap hikaricp-dashboard --namespace=monitoring
