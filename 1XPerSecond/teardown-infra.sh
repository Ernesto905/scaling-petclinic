#!/bin/bash 

minikube kubectl -- delete --filename=db.yml,petclinic.yml,prometheus.yml,postgres-exporter.yml
minikube kubectl -- delete --ignore-not-found=true -f kube-prometheus/ -f kube-prometheus/setup
