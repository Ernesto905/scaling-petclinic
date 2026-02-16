#!/bin/bash 

minikube kubectl -- apply --server-side -f kube-prometheus/setup
until minikube kubectl -- get servicemonitors --all-namespaces ; do date; sleep 1; echo ""; done
minikube kubectl -- apply -f kube-prometheus/
minikube kubectl -- apply --filename=db.yml,petclinic.yml,prometheus.yml
