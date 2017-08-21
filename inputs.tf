variable "name" {
    type = "string"
    description = "The name of the cluster, unique within the project and zone"
}

variable "zone" {
    type = "string"
    description = "The zone that the master and the number of nodes specified in initial_node_count should be created in"
}

variable "initial_node_count" {
    type = "string"
    default = "2"
    description = "The number of nodes to create in this cluster (not including the Kubernetes master)"
}

variable "additional_zones" {
    type = "list"
    default = []
    description = "If additional zones are configured, the number of nodes specified in initial_node_count is created in all specified zones"
}

variable "username" {
    type = "string"
    description = "The username to use for HTTP basic authentication when accessing the Kubernetes master endpoint"
}

variable "password" {
    type = "string"
    description = "The password to use for HTTP basic authentication when accessing the Kubernetes master endpoint"
}

variable "machine_type" {
    type = "string"
    default = "n1-standard-1"
    description = "The name of a Google Compute Engine machine type"
}

variable "disk_size_gb" {
    type = "string"
    default = 100
    description = "Size of the disk attached to each node, specified in GB"
}

variable "local_ssd_count" {
    type = "string"
    default = 0
    description = " The amount of local SSD disks that will be attached to each cluster node"
}

variable "oauth_scopes" {
    type = "list"
    default = [
        "https://www.googleapis.com/auth/compute",
        "https://www.googleapis.com/auth/devstorage.read_only",
        "https://www.googleapis.com/auth/logging.write",
        "https://www.googleapis.com/auth/monitoring",
    ]
    description = "The set of Google API scopes to be made available on all of the node VMs under the default service account"
}
  
variable "tags" {
    type = "list"
    default = []
    description = "The list of instance tags applied to all nodes. Tags are used to identify valid sources or targets for network firewalls."
}

variable "http_load_balancing_disable" {
    type = "string"
    default = false
    description = "The status of the HTTP Load Balancing add-on"
}

variable "horizontal_pod_autoscaling_disable" {
    type = "string"
    default = true
    description = "The status of the Horizontal Pod Autoscaling addon"
}

variable "network" {
    type = "string"
    default = "default"
    description = "The name or self_link of the Google Compute Engine network to which the cluster is connected"
}

variable "subnetwork" {
    type = "string"
    default = "default"
    description = "Name of the subnet to which to attach the cluster"
}