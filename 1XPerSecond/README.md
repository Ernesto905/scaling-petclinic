# One Request/Read/Write Per Second

## Prerequisites 
- Ensure you have Docker 
- Ensure you have [Minikube](https://minikube.sigs.k8s.io/docs/) installed


## Installation 
Initialize the cluster 
```
# authorize execution 
chmod +x apply-infra.sh

./apply-infra.sh
```


Deploy the web app and observability dashboards
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

