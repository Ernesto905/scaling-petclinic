### Prerequisites 
- Ensure you have Docker installed
- Ensure you have [Minikube](https://minikube.sigs.k8s.io/docs/) installed

### Installation 
Initialize the cluster 
```
./apply-infra.sh
```

Deploy the web app and observability dashboards
```
./start-monitoring.sh
```

You're good to go!

### Tear down
```
./teardown-infra.sh
```

