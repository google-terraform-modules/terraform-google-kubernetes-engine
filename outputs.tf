output "endpoint" {
    value = "${google_container_cluster.new_container_cluster.endpoint}"
    description = "The IP address of this cluster's Kubernetes master"
}

output "instance_group_urls" {
    value = "${google_container_cluster.new_container_cluster.instance_group_urls}"
    description = "List of instance group URLs which have been assigned to the cluster"
}

/*
- master_auth.client_certificate
- master_auth.client_key
- master_auth.cluster_ca_certificate
*/
output "master_auth" {
    value = "${google_container_cluster.new_container_cluster.master_auth}"
    description = "Master auth client (object)"
}