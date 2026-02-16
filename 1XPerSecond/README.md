# 1 Request/Read/Write Per Second

## Prerequisites 
- Ensure you have Docker and Kubernetes installed. I recommend [Minikube](https://minikube.sigs.k8s.io/docs/) for orchestration at this scale.


db.yml  k6.yml  petclinic.yml  prometheus-operator.yml  prometheus.yml  README.md


## Installation 
1. Initialize the cluster 
```
# authorize execution 
chmod +x apply-infra.sh

./apply-infra.sh
```


2. deploy the webapp and dashboards
```
# authorize execution 
chmod +x start-monitoring.sh

./start-monitoring.sh
```

You're good to go!

## Load testing 
```
minikube kubectl -- apply -f k6.yml
```

## Tear down
```
# authorize execution
chmod +x teardown-infra.sh

./teardown-infra.sh
```

