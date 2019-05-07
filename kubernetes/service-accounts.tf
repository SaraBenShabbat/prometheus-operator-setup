resource "kubernetes_service_account" "tiller_service_account" {
  metadata {
    name 			= "tiller"
    namespace = "kube-system"
  }
}

resource "kubernetes_service_account" "prometheus_operator" {
  metadata {
    name      = "prometheus-operator"
    namespace = "monitoring"
  }
}

resource "kubernetes_service_account" "kube_state_metrics" {
  metadata {
    name      = "kube-state-metrics"
    namespace = "monitoring"
  }
}

resource "kubernetes_service_account" "alertmanager_main" {
  metadata {
    name      = "alertmanager-main"
    namespace = "monitoring"
  }
}

resource "kubernetes_service_account" "node_exporter" {
  metadata {
    name      = "node-exporter"
    namespace = "monitoring"
  }
}

resource "kubernetes_service_account" "grafana" {
  metadata {
    name      = "grafana"
    namespace = "monitoring"
  }
}

resource "kubernetes_service_account" "prometheus_adapter" {
  metadata {
    name      = "prometheus-adapter"
    namespace = "monitoring"
  }
}

resource "kubernetes_service_account" "prometheus_k8s" {
  metadata {
    name      = "prometheus-k8s"
    namespace = "monitoring"
  }
}
