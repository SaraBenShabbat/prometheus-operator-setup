/**
 * Virtual Private Cloud
 *
 * Each network has its own firewall controlling access to and from the instances.
 * Documentation:         https://www.terraform.io/docs/providers/google/r/compute_firewall.html
 * Getting started page:  https://cloud.google.com/vpc/docs/firewalls
 */

resource "google_compute_firewall" "firewalli-int" {
  name    = "firewall-int"
  network = "${var.vpc_name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "udp"
  }

  source_ranges = ["${var.ip_cidr_range}"]
}

resource "google_compute_firewall" "firewalli-ext" {
  name    = "firewall-ext"
  network = "${var.vpc_name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "6443"]
  }

  source_ranges = ["0.0.0.0/0"]
}
