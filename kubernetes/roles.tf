resource "kubernetes_role" "kube_state_metrics" {
  metadata {
    name      = "kube-state-metrics"
    namespace = "monitoring"
  }

  rule {
    verbs      = ["get"]
    api_groups = [""]
    resources  = ["pods"]
  }

  rule {
    verbs          = ["get", "update"]
    api_groups     = ["extensions"]
    resources      = ["deployments"]
    resource_names = ["kube-state-metrics"]
  }

  rule {
    verbs          = ["get", "update"]
    api_groups     = ["apps"]
    resources      = ["deployments"]
    resource_names = ["kube-state-metrics"]
  }
}

resource "kubernetes_role" "prometheus_k8s_config" {
  metadata {
    name      = "prometheus-k8s-config"
    namespace = "monitoring"
  }

  rule {
    verbs      = ["get"]
    api_groups = [""]
    resources  = ["configmaps"]
  }
}

resource "kubernetes_role" "prometheus_k8s_default" {
  metadata {
    name      = "prometheus-k8s"
    namespace = "default"
  }

  rule {
    verbs      = ["get", "list", "watch"]
    api_groups = [""]
    resources  = ["services", "endpoints", "pods"]
  }
}

resource "kubernetes_role" "prometheus_k8s_kube-system" {
  metadata {
    name      = "prometheus-k8s"
    namespace = "kube-system"
  }

  rule {
    verbs      = ["get", "list", "watch"]
    api_groups = [""]
    resources  = ["services", "endpoints", "pods"]
  }
}

resource "kubernetes_role" "prometheus_k8s_prometheus-k8s" {
  metadata {
    name      = "prometheus-k8s"
    namespace = "monitoring"
  }

  rule {
    verbs      = ["get", "list", "watch"]
    api_groups = [""]
    resources  = ["services", "endpoints", "pods"]
  }
}

