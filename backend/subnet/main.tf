/**
 * Virtual Private Cloud
 *
 * Get a subnetwork within GCE from its name and region.
 * Documentation:         https://www.terraform.io/docs/providers/google/d/datasource_compute_subnetwork.html
 * Getting started page:  https://cloud.google.com/vpc/docs/vpc
 */
resource "google_compute_subnetwork" "subnet" {
  name          = "subnet"
  ip_cidr_range = "${var.subnet_cidr}"
  network       = "${var.vpc_name}"
  region        = "${var.region}"
}
