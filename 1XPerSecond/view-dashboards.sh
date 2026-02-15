#!/usr/bin/bash

NAMESPACE="monitoring"
echo "Starting port-forwards in namespace: $NAMESPACE"

minikube kubectl -- --namespace "$NAMESPACE" port-forward svc/prometheus-k8s 9090:9090 &
PROM_PID=$!
minikube kubectl -- --namespace "$NAMESPACE" port-forward svc/grafana 3000:3000 &
GRAFANA_PID=$!
minikube kubectl -- --namespace "$NAMESPACE" port-forward svc/alertmanager-main 9093:9093 &
ALERT_PID=$!

echo ""
echo "Dashboards available:"
echo "  Prometheus   → http://localhost:9090"
echo "  Grafana      → http://localhost:3000 (admin / admin)"
echo "  Alertmanager → http://localhost:9093"
echo ""
echo "Press Ctrl+C to stop all port-forwards."

cleanup() {
  echo ""
  echo "Stopping port-forwards..."
  kill $PROM_PID $GRAFANA_PID $ALERT_PID 2>/dev/null || true
  exit 0
}

trap cleanup SIGINT SIGTERM
wait

