#!/bin/bash 

minikube kubectl -- delete --filename=infrastructure/db.yml,infrastructure/petclinic.yml,infrastructure/prometheus.yml,infrastructure/postgres-exporter.yml
minikube kubectl -- delete --ignore-not-found=true -f infrastructure/kube-prometheus/ -f infrastructure/kube-prometheus/setup
