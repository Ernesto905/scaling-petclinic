#!/bin/bash 
minikube kubectl -- delete -f prometheus-operator.yml
minikube kubectl -- delete --filename=db.yml,petclinic.yml,prometheus.yml
