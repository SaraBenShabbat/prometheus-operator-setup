/**
 * Tiller Service Account
 *
 * Managing Service Account: https://kubernetes.io/docs/reference/access-authn-authz/service-accounts-admin/
 * Helm Tiller:							 https://helm.sh/docs/glossary/#tiller
 */
resource "kubernetes_service_account" "tiller_service_account" {

  metadata {
    name 			= "tiller"
    namespace = "kube-system"
  }
}

