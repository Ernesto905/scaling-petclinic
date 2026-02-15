#!/bin/bash 

minikube kubectl -- apply --server-side -f kube-prometheus/manifests/setup
until minikube kubectl -- get servicemonitors --all-namespaces ; do date; sleep 1; echo ""; done
minikube kubectl -- apply -f kube-prometheus/manifests/
minikube kubectl -- apply --filename=db.yml,petclinic.yml,prometheus.yml
