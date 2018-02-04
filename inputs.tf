##########################
###     MASTER GKE     ###
##########################

variable "name" {
  type        = "string"
  description = "The name of the cluster, unique within the project and zone"
}

variable "env" {
  type        = "string"
  description = "Type of environnement (prod, staging, dev, int ...)"
}

# https://www.terraform.io/docs/providers/google/r/container_cluster.html#min_master_version
variable "min_master_version" {
  type        = "string"
  default     = "false"
  description = "The minimum version of the master."
}

variable "image_type" {
  type        = "string"
  default     = "cos"
  description = "The image type to use for this node (cos or Ubuntu)"
}

variable "zone" {
  type        = "string"
  description = "The zone that the master and the number of nodes specified in initial_node_count should be created in"
}

variable "cluster_count" {
  type        = "string"
  default     = 1
  description = "The number of nodes to create in this cluster (not including the Kubernetes master)"
}

variable "additional_zones" {
  type        = "list"
  default     = []
  description = "If additional zones are configured, the number of nodes specified in initial_node_count is created in all specified zones"
}

variable "machine_type" {
  type        = "string"
  default     = "n1-standard-1"
  description = "The name of a Google Compute Engine machine type"
}

variable "disk_size_gb" {
  type        = "string"
  default     = 10
  description = "Size of the disk attached to each node, specified in GB"
}

variable "local_ssd_count" {
  type        = "string"
  default     = 0
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

# https://www.terraform.io/docs/providers/google/r/container_cluster.html#daily_maintenance_window
variable "maintenance_window" {
  type        = "string"
  default     = "04:30"
  description = "Time window specified for daily maintenance operations. Specify start_time in RFC3339 format HH:MM”, where HH : [00-23] and MM : [00-59] GMT"
}

variable "tags" {
  type        = "list"
  default     = []
  description = "The list of instance tags applied to all nodes. Tags are used to identify valid sources or targets for network firewalls."
}

##########################
###    AUTH API K8S    ###
##########################

variable "username" {
  type        = "string"
  description = "The username to use for HTTP basic authentication when accessing the Kubernetes master endpoint"
}

variable "password" {
  type        = "string"
  description = "The password to use for HTTP basic authentication when accessing the Kubernetes master endpoint"
}

variable "kubernetes_dashboard" {
  type        = "string"
  default     = false
  description = "The status of the Kubernetes Dashboard add-on"
}

##########################
###      NODE GKE      ###
##########################

variable "node_count" {
  type        = "string"
  default     = 2
  description = "The initial node count for the pool"
}

variable "machine_type_node" {
  type        = "string"
  default     = "n1-standard-1"
  description = "The name of a Google Compute Engine machine type"
}

variable "disk_size_gb_node" {
  type        = "string"
  default     = 10
  description = "Size of the disk attached to each node, specified in GB"
}

variable "local_ssd_count_node" {
  type        = "string"
  default     = 0
  description = "The amount of local SSD disks that will be attached to each node pool"
}

# WARNING BETA
variable "auto_repair" {
  type        = "string"
  default     = "false"
  description = "Whether the nodes will be automatically repaired"
}

# WARNING BETA
variable "auto_upgrade" {
  type        = "string"
  default     = "false"
  description = " Whether the nodes will be automatically upgraded"
}

##########################
###  AUTOSCALING NODE  ###
##########################

variable "minNodeCount_node" {
  type        = "string"
  default     = 1
  description = "Minimum number of nodes in the NodePool"
}

variable "maxNodeCount_node" {
  type        = "string"
  default     = 3
  description = "Maximum number of nodes in the NodePool"
}

##########################
###   AUTOSCALING K8S  ###
##########################

variable "http_load_balancing_disable" {
  type        = "string"
  default     = false
  description = "The status of the HTTP Load Balancing add-on"
}

variable "horizontal_pod_autoscaling_disable" {
  type        = "string"
  default     = true
  description = "The status of the Horizontal Pod Autoscaling addon"
}

##########################
###       NETWORK      ###
##########################

variable "network" {
  type        = "string"
  default     = "default"
  description = "The name or self_link of the Google Compute Engine network to which the cluster is connected"
}

variable "subnetwork" {
  type        = "string"
  default     = "default"
  description = "Name of the subnet to which to attach the cluster"
}
