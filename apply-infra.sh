#!/bin/bash 

minikube kubectl -- apply --server-side -f infrastructure/kube-prometheus/setup
until minikube kubectl -- get servicemonitors --all-namespaces ; do date; sleep 1; echo ""; done
minikube kubectl -- apply -f infrastructure/kube-prometheus/
minikube kubectl -- apply --filename=infrastructure/db.yml,infrastructure/petclinic.yml,infrastructure/prometheus.yml,infrastructure/postgres-exporter.yml
