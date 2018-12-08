output "master_version" {
  value       = "${google_container_cluster.new_container_cluster.master_version}"
  description = "The current version of the master in the cluster."
}

output "endpoint" {
  value       = "${google_container_cluster.new_container_cluster.endpoint}"
  description = "The IP address of this cluster's Kubernetes master"
}

output "instance_group_urls" {
  value       = "${google_container_cluster.new_container_cluster.instance_group_urls}"
  description = "List of instance group URLs which have been assigned to the cluster"
}

output "maintenance_window" {
  value       = "${google_container_cluster.new_container_cluster.maintenance_policy.0.daily_maintenance_window.0.duration}"
  description = "Duration of the time window, automatically chosen to be smallest possible in the given scenario. Duration will be in RFC3339 format PTnHnMnS"
}

output "client_key" {
  value       = "${google_container_cluster.new_container_cluster.master_auth.0.client_key}"
  description = "Base64 encoded private key used by clients to authenticate to the cluster endpoint"
}

output "client_certificate" {
  value       = "${google_container_cluster.new_container_cluster.master_auth.0.client_certificate}"
  description = "Base64 encoded public certificate used by clients to authenticate to the cluster endpoint"
}

output "cluster_ca_certificate" {
  value       = "${google_container_cluster.new_container_cluster.master_auth.0.cluster_ca_certificate}"
  description = "Base64 encoded public certificate that is the root of trust for the cluster"
}

output "cluster_name" {
  value       =  "${google_container_cluster.new_container_cluster.name}"
  description =  "The full name of this Kubernetes cluster"
}

output "gcr_url" {
  value       = "${data.google_container_registry_repository.registry.repository_url}"
  description = "This data source fetches the project name, and provides the appropriate URLs to use for container registry for this project"
}
