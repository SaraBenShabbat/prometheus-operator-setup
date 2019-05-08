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
