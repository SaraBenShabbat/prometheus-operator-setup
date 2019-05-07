output "tiller_service_account" {
  description = "Tiller service account"
  value       = "${kubernetes_service_account.tiller_service_account.metadata.0.name}"
}
