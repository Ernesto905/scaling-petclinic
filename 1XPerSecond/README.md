# 1 Request/Read/Write Per Second

## Prerequisites 
- Ensure you have Docker and Kubernetes installed. I recommend [Minikube](https://minikube.sigs.k8s.io/docs/) for orchestration at this scale.


db.yml  k6.yml  petclinic.yml  prometheus-operator.yml  prometheus.yml  README.md


## Installation 
1. Install the Prometheus operator.
```
kubectl apply --server-side -f prometheus-operator.yml
```
2. Install the rest of the infrastructure.
```
kubectl apply --filename=db.yml,petclinic.yml,prometheus.yml
```
```

