#!/usr/bin/bash

MONITORING_NAMESPACE="monitoring"
echo "Deploying dashboard in namespace: $MONITORING_NAMESPACE"

minikube kubectl -- port-forward svc/petclinic 8080:80 &
SPRING_CLINIC_PID=$!
minikube kubectl -- port-forward svc/prometheus-k8s --namespace "$MONITORING_NAMESPACE" 9090:9090 &
PROM_PID=$!
minikube kubectl -- port-forward svc/grafana --namespace "$MONITORING_NAMESPACE" 3000:3000 &
GRAFANA_PID=$!
minikube kubectl -- port-forward svc/alertmanager-main --namespace "$MONITORING_NAMESPACE" 9093:9093 &
ALERT_PID=$!

echo ""
echo "Urls available:"
echo "  Petclinic    → http://localhost:8080"
echo "  Prometheus   → http://localhost:9090"
echo "  Grafana      → http://localhost:3000 (username: admin / password: admin)"
echo "  Alertmanager → http://localhost:9093"
echo ""
echo "Press Ctrl+C to stop all port-forwards."

cleanup() {
  echo ""
  echo "Stopping port-forwards..."
  kill $SPRING_CLINIC_PID $PROM_PID $GRAFANA_PID $ALERT_PID 2>/dev/null || true
  exit 0
}

trap cleanup SIGINT SIGTERM
wait
