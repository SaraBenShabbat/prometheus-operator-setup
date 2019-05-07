/**
 * Tiller Cluster Role Binding
 *
 * Using RBAC Authorization: https://kubernetes.io/docs/reference/access-authn-authz/rbac/
 */
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

