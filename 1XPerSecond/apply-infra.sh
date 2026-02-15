#!/bin/bash 
kubectl apply --server-side -f prometheus-operator.yml
kubectl apply --filename=db.yml,petclinic.yml,prometheus.yml
