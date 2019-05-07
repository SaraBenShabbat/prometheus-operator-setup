variable "region" {
  description = "Region of resources"
}

variable "min_master_version" {
  description = "Number of nodes in each GKE cluster zone"
}

variable "node_version" {
  description = "Number of nodes in each GKE cluster zone"
}

variable "vpc_name" {
  description = "vpc name"
}
variable "subnet_name" {
  description = "subnet name"
}

variable "gke_node_machine_type" {
  description = "Machine type of GKE nodes"
}

variable "kubernetes_username" {
  description = "Kubernetes username"
}
variable "kubernetes_password" {
  description = "Kubernetes password"
}
