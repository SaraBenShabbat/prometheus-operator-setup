/**
 * Google Container Cluster
 *
 * Manages a Google Kubernetes Engine (GKE) cluster.
 * Official documentation:  https://cloud.google.com/kubernetes-engine/docs/concepts/cluster-architecture
 * API reference:           https://cloud.google.com/kubernetes-engine/docs/reference/rest/v1/projects.locations.clusters
 */
resource "google_container_cluster" "primary" {
  name      = "getup-cluster"
  location  = "${var.region}"

  remove_default_node_pool = true
  initial_node_count = 1

  addons_config {
    http_load_balancing {
      disabled = false
    }

    horizontal_pod_autoscaling {
      disabled = true
    }

    kubernetes_dashboard {
      disabled = false
    }
  }

  master_auth {
    username = "${var.kubernetes_username}"
    password = "${var.kubernetes_password}"
  }
}

/**
 * Primary Preemptible Nodes
 *
 * Manages a node pool in a Google Kubernetes Engine (GKE) cluster separately from the cluster control plane.
 * Official documentation: https://cloud.google.com/kubernetes-engine/docs/node-pools
 * API reference:          https://cloud.google.com/kubernetes-engine/docs/reference/rest/v1/projects.zones.clusters.nodePools
 */
resource "google_container_node_pool" "preemptible_node" {

  name              = "preemptible-node"
  location          = "${google_container_cluster.primary.location}"
  cluster           = "${google_container_cluster.primary.name}"
  version           = "${google_container_cluster.primary.node_version}"
  node_count        = 1

  timeouts {
    create = "30m"
    update = "20m"
  }

  autoscaling {
    min_node_count = 1
    max_node_count = 5
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    preemptible  = true

    metadata {
      disable-legacy-endpoints = "true"
    }

    disk_size_gb = 10
    machine_type = "${var.gke_node_machine_type}"
    tags         = ["gke-node"]
  }
}
