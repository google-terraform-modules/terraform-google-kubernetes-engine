##########################
###     MASTER GKE     ###
##########################

variable "name" {
  type        = "string"
  description = "The name of the cluster, unique within the project and zone"
}

variable "env" {
  type        = "string"
  default     = "dev"
  description = "Type of environnement (prod, staging, dev, int ...)"
}

variable "preemptible" {
  type        = "string"
  default     = false
  description = "A boolean that represents whether or not the underlying node VMs are preemptible"
}

# WARNING ALPHA
variable "kubernetes_alpha" {
  type        = "string"
  default     = false
  description = "Whether to enable Kubernetes Alpha features for this cluster. Note that when this option is enabled, the cluster cannot be upgraded and will be automatically deleted after 30 days."
}

# https://www.terraform.io/docs/providers/google/r/container_cluster.html#min_master_version
variable "min_master_version" {
  type        = "string"
  default     = "false"
  description = "The minimum version of the master."
}

# https://cloud.google.com/kubernetes-engine/docs/concepts/node-images
variable "image_type" {
  type        = "string"
  default     = "COS"
  description = "The image type to use for this node (COS or Ubuntu)"
}

variable "zone" {
  type        = "string"
  default     = "us-central1-a"
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

variable "enable_legacy_abac" {
  type        = "string"
  default     = true
  description = "Whether the ABAC authorizer is enabled for this cluster. When enabled, identities in the system, including service accounts, nodes, and controllers, will have statically granted permissions beyond those provided by the RBAC configuration or IAM"
}

variable "monitoring_service" {
  type        = "string"
  default     = "monitoring.googleapis.com"
  description = "The list of instance tags applied to all nodes. Tags are used to identify valid sources or targets for network firewalls"
}

variable "logging_service" {
  type        = "string"
  default     = "logging.googleapis.com"
  description = "The logging service that the cluster should write logs to. Available options include logging.googleapis.com and none"
}

# https://www.terraform.io/docs/providers/google/r/container_cluster.html#daily_maintenance_window
variable "maintenance_window" {
  type        = "string"
  default     = "04:30"
  description = "The monitoring service that the cluster should write metrics to. Automatically send metrics from pods in the cluster to the Google Cloud Monitoring API"
}

variable "tags" {
  type        = "list"
  default     = []
  description = "The list of instance tags applied to all nodes. Tags are used to identify valid sources or targets for network firewalls."
}

##########################
###        PODS        ###
##########################

variable "pod_security_policy_config" {
  type        = "string"
  default     = false
  description = "Enable the PodSecurityPolicy controller for this cluster. If enabled, pods must be valid under a PodSecurityPolicy to be created"
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

# WARNING : the occurrence name is "disabled"
variable "kubernetes_dashboard_disable" {
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

# WARNING : the occurrence name is "disabled"
variable "http_load_balancing_disable" {
  type        = "string"
  default     = false
  description = "The status of the HTTP Load Balancing add-on"
}

# WARNING : the occurrence name is "disabled"
variable "horizontal_pod_autoscaling_disable" {
  type        = "string"
  default     = true
  description = "The status of the Horizontal Pod Autoscaling addon"
}

variable "master_authorized_networks_config" {
  type        = "list"
  default     = []
  description = "The desired configuration options for master authorized networks. Omit the nested cidr_blocks attribute to disallow external access (except the cluster node IPs, which GKE automatically whitelists)"
}

##########################
###   GPUS (ONLY 1.9)  ###
##########################

variable "gpus_number" {
  type        = "string"
  default     = 0
  description = "The number of the guest accelerator cards exposed to this instance"
}

variable "gpus_type" {
  type        = "string"
  default     = "nvidia-tesla-k80"
  description = "The accelerator type resource to expose to this instance"
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

variable "network_policy_config_disable" {
  type        = "string"
  default     = true
  description = "Whether we should enable the network policy addon for the master"
}
