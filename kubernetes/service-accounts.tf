resource "kubernetes_service_account" "tiller_service_account" {
  metadata {
    name 			= "tiller"
    namespace = "kube-system"
  }
}
