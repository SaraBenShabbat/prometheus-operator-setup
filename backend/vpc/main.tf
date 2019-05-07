/**
 * Virtual Private Cloud
 *
 * Manages a VPC network or legacy network resource on GCP
 * Documentation:         https://www.terraform.io/docs/providers/google/r/compute_network.html
 * Getting started page:  https://cloud.google.com/vpc/docs/vpc
 */
resource "google_compute_network" "vpc" {
  name                    = "vpc"
  auto_create_subnetworks = "false"
}
