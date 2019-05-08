/**
 * Kubernetes Namespace
 * Kubernetes supports multiple virtual clusters backed by the same physical
 * cluster. These virtual clusters are called namespaces.
 * Namespaces reference: https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/
 */

/**
 * master environment
 */
resource "kubernetes_namespace" "monitoring" {

  metadata {
    name = "monitoring"
  }
}
