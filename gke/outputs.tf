output "endpoint" {
  value       = "${google_container_cluster.primary.endpoint}"
  description = "Endpoint for accessing the master node"
}

output "username" {
  value       = "${google_container_cluster.primary.master_auth.0.username}"
  description = "Username of master node"
}

output "password" {
  value       = "${google_container_cluster.primary.master_auth.0.password}"
  description = "Password of master node"
}

output "client_certificate" {
  value       = "${google_container_cluster.primary.master_auth.0.client_certificate}"
  description = "Certificate to client"
}

output "client_key" {
  value       = "${google_container_cluster.primary.master_auth.0.client_key}"
  description = "Key to client"
}

output "cluster_ca_certificate" {
  value       = "${google_container_cluster.primary.master_auth.0.cluster_ca_certificate}"
  description = "Cluster root certificate"
}
