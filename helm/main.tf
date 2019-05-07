/**
 * A chart repository is a location where packaged charts can be stored and shared
 */

/**
 * Stable charts
 */
data "helm_repository" "stable" {
  name = "stable"
  url  = "https://kubernetes-charts.storage.googleapis.com"
}

/**
 * Incubator charts
 */
data "helm_repository" "incubator" {
  name = "incubator"
  url  = "https://kubernetes-charts-incubator.storage.googleapis.com"
}
