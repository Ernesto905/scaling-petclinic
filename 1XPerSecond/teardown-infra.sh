#!/bin/bash 

minikube kubectl -- delete --ignore-not-found=true -f kube-prometheus/manifests/ -f kube-prometheus/manifests/setup
minikube kubectl -- delete --filename=db.yml,petclinic.yml,prometheus.yml
