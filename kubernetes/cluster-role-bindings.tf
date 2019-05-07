resource "kubernetes_cluster_role_binding" "tiller-cluster-role-binding" {

  metadata {
    name = "tiller"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "tiller"
    namespace = "kube-system"
  }
}

resource "kubernetes_cluster_role_binding" "resource_metrics-system-auth_delegator" {
  metadata {
    name = "resource-metrics-system-auth-delegator"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "system:auth-delegator"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "prometheus-adapter"
    namespace = "monitoring"
  }
}

resource "kubernetes_cluster_role_binding" "alertmanagers-cluster-role-binding" {
  metadata {
    name = "alertmanagers"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "prometheus-operator"
    namespace = "monitoring"
  }
}
