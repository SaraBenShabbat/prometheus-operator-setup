/**
 * Google Cloud Provider
 *
 * The Google provider is used to configure your Google Cloud Platform infrastructure.
 * Getting started page: https://www.terraform.io/docs/providers/google/getting_started.html
 */
provider "google" {

  credentials = "${file("credentials/getup.json")}"
  project     = "${var.project_id}"
  region      = "${var.region}"
}

/**
 * Kubernetes Provider
 *
 * The Kubernetes (K8S) provider is used to interact with the resources
 * supported by Kubernetes. The provider needs to be configured with
 * the proper credentials before it can be used.
 * Getting started page: https://www.terraform.io/docs/providers/kubernetes/index.html
 */
provider "kubernetes" {

  host                    = "${module.gke.endpoint}"
  username                = "${module.gke.username}"
  password                = "${module.gke.password}"

  client_certificate      = "${base64decode(module.gke.client_certificate)}"
  client_key              = "${base64decode(module.gke.client_key)}"
  cluster_ca_certificate  = "${base64decode(module.gke.cluster_ca_certificate)}"
}

/**
 * Helm Charts Provider
 *
 * The Helm provider is used to deploy software packages in Kubernetes.
 * The provider needs to be configured with the proper credentials before it can be used.
 * Getting started page: https://www.terraform.io/docs/providers/helm/index.html
 */
provider "helm" {

  install_tiller            = true
  tiller_image              = "gcr.io/kubernetes-helm/tiller:v2.12.1"
  service_account           = "${module.kubernetes.tiller_service_account}"
  namespace                 = "kube-system"

  kubernetes {
    host                    = "${module.gke.endpoint}"
    username                = "${module.gke.username}"
    password                = "${module.gke.password}"

    client_certificate      = "${base64decode(module.gke.client_certificate)}"
    client_key              = "${base64decode(module.gke.client_key)}"
    cluster_ca_certificate  = "${base64decode(module.gke.cluster_ca_certificate)}"
  }
}

/**
 * VPC module
 */
module "vpc" {
  source = "./backend/vpc"
}

/**
 * Subnet module
 */
module "subnet" {
  source      = "./backend/subnet"
  region      = "${var.region}"
  vpc_name    = "${module.vpc.vpc_name}"
  subnet_cidr = "${var.subnet_cidr}"
}

/**
 * Firewall module
 */
module "firewall" {
  source        = "./backend/firewall"
  vpc_name      = "${module.vpc.vpc_name}"
  ip_cidr_range = "${module.subnet.ip_cidr_range}"
}

/**
 * GKE module
 */
module "gke" {
  source                          = "./gke"
  region                          = "${var.region}"
  min_master_version              = "${var.min_master_version}"
  node_version                    = "${var.node_version}"
  vpc_name                        = "${module.vpc.vpc_name}"
  subnet_name                     = "${module.subnet.subnet_name}"
  gke_node_machine_type           = "${var.gke_node_machine_type}"
  kubernetes_username             = "${var.kubernetes_username}"
  kubernetes_password             = "${var.kubernetes_password}"
}

/**
 * Kubernetes module
 */
module "kubernetes" {
  source   = "./kubernetes"
}

/**
 * Helm module
 */
module "helm" {
  source = "./helm"
}
