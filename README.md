# prometheus-operator-setup
kubectl -n monitoring port-forward deployment/getup-grafana 3000:3000
kubectl -n monitoring port-forward alertmanager-getup-prometheus-operator-alertmanager-0 9093:9093
kubectl -n monitoring port-forward prometheus-getup-prometheus-operator-prometheus-0 9090:9090