resource "kubernetes_role_binding" "resource_metrics_system_auth_delegator" {
  metadata {
    name      = "resource-metrics-system-auth-delegator"
    namespace = "kube-system"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "prometheus-adapter"
    namespace = "monitoring"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = "extension-apiserver-authentication-reader"
  }
}
