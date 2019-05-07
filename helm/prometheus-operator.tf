/**
 * Prometheus operator
 *
 * This chart bootstraps a prometheus-operator deployment on a Kubernetes cluster using the Helm package manager
 * Documentation: https://github.com/coreos/prometheus-operator
 * Chart:         https://github.com/helm/charts/tree/master/stable/prometheus-operator
 */
resource "helm_release" "prometheus_operator" {

  depends_on = ["null_resource.crds"]

  name       = "prometheus-operator"
  repository = "stable"
  chart      = "prometheus-operator"
  version    = "5.5.1"
  namespace  = "monitoring"
  timeout    = 1200

  set {
    name  = "prometheusOperator.createCustomResource"
    value = "false"
  }
}

resource "null_resource" "crds" {

  provisioner "local-exec" {
    command = <<EOT
      kubectl apply -n monitoring -f https://raw.githubusercontent.com/coreos/prometheus-operator/master/example/prometheus-operator-crd/alertmanager.crd.yaml;
      kubectl apply -n monitoring -f https://raw.githubusercontent.com/coreos/prometheus-operator/master/example/prometheus-operator-crd/prometheus.crd.yaml;
      kubectl apply -n monitoring -f https://raw.githubusercontent.com/coreos/prometheus-operator/master/example/prometheus-operator-crd/prometheusrule.crd.yaml;
      kubectl apply -n monitoring -f https://raw.githubusercontent.com/coreos/prometheus-operator/master/example/prometheus-operator-crd/servicemonitor.crd.yaml
    EOT
  }
}
