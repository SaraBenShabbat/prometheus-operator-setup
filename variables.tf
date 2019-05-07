/**
 * Project variables
 */
variable "region" {
  description = "Region of resources"
  default     = "us-central1"
}

variable "project_id" {
  description = "The project ID to host the cluster"
  default     = "getup-239903"
}

/**
 * Network variables
 */
variable "subnet_cidr" {
  description = "Subnet range"
  default = "10.10.0.0/24"
}

/**
 * GKE variables
 */
variable "min_master_version" {
  description = "Minimal version of kubernetes on GKE"
  default     = "1.12.6-gke.10"
}

variable "node_version" {
  description = "Number of nodes in each GKE cluster zone"
  default     = "1.12.6-gke.10"
}

variable "gke_master_user" {
  default     = "k8s_admin"
  description = "Username to authenticate with the k8s master"
}

variable "gke_node_machine_type" {
  default     = "n1-standard-1"
  description = "Machine type of GKE nodes"
}

/**
 * Kubernetes variables
 */
variable "kubernetes_username" {
  default     = "getup-admin"
  description = "Cluster admin username"
}

variable "kubernetes_password" {
  default     = "SDePcEFueEK6nshf"
  description = "Cluster admin password"
}
