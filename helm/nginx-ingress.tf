/**
 * NGINX Ingress
 *
 * This repository contains the NGINX controller built around the
 * Kubernetes Ingress resource that uses ConfigMap to store the NGINX configuration
 * Ingress resource:          https://kubernetes.io/docs/concepts/services-networking/ingress/
 * NGINX Ingress Controller:  https://github.com/kubernetes/ingress-nginx
 */
resource "helm_release" "nginx_ingress" {

  name       = "nginx-ingress"
  repository = "stable"
  chart      = "nginx-ingress"
  version    = "1.6.0"
  namespace  = "nginx-ingress"
  timeout    = 1200
}
