# For more details please see the following pages :
# https://www.terraform.io/docs/providers/google/r/container_cluster.html
# https://www.terraform.io/docs/providers/google/r/container_node_pool.html
# https://www.terraform.io/docs/providers/google/d/google_container_engine_versions.html
# https://www.terraform.io/docs/providers/google/d/google_container_registry_repository.html

##########################
###         GKE        ###
##########################

# Parameters authorized:
# name (mandatory)
# zone (mandatory)
# env (mandatory)
variable "general" {
  type        = "map"
  description = "Global parameters"
}

# Parameters authorized:
# username (mandatory)
# password (mandatory)
# network (default: default)
# subnetwork (default: default)
# disable_horizontal_pod_autoscaling (default: false)
# disable_http_load_balancing (default: false)
# disable_kubernetes_dashboard (default: false)
# disable_network_policy_config (default: true)
# enable_kubernetes_alpha (default: false)
# enable_legacy_abac (default: false)
# private (default: false)
# maintenance_window (default: 4:30)
# version (default: Data resource)
# monitoring_service (default: none)
# logging_service (default: logging.googleapis.com)
variable "master" {
  type        = "map"
  description = "Kubernetes master parameters to initialize"
}

# Parameters authorized:
# node_count (default: 2)
# remove (default: false)
# disk_size_gb (default: 10)
# image (default: COS)
# local_ssd_count (default: 0)
# oauth_scopes (default: https://www.googleapis.com/auth/compute,https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring)
# machine_type (default: n1-standard-1)
# preemptible (default: false)
# service_account (default: default)
variable "default_node_pool" {
  type        = "map"
  default     = {}
  description = "Default pool setting"
}

# Parameters authorized:
# node_count (default: 3)
# machine_type (default: n1-standard-1)
# disk_size_gb (default: 10)
# local_ssd_count (default: 0)
# oauth_scopes (default: https://www.googleapis.com/auth/compute,https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring)
# min_node_count (default: 1)
# max_node_count (default: 3)
# auto_repair (default: true)
# auto_upgrade (default: true)
variable "node_pool" {
  type        = "list"
  default     = []
  description = "Node pool setting to create"
}

# https://www.terraform.io/docs/providers/google/r/container_cluster.html#tags
variable "tags" {
  type        = "list"
  default     = []
  description = "The list of instance tags applied to all nodes. Tags are used to identify valid sources or targets for network firewalls"
}

# https://www.terraform.io/docs/providers/google/r/container_cluster.html#labels
variable "labels" {
  description = "The Kubernetes labels (key/value pairs) to be applied to each node"
  type        = "map"
  default     = {}
}

##########################
###      NODE GKE      ###
##########################

# https://www.terraform.io/docs/providers/google/r/container_cluster.html#additional_zones
variable "node_additional_zones" {
  type        = "list"
  default     = []
  description = "The list of additional Google Compute Engine locations in which the cluster's nodes should be located. If additional zones are configured, the number of nodes specified in initial_node_count is created in all specified zones"
}

# https://www.terraform.io/docs/providers/google/r/container_cluster.html#taint
# WARNING BETA
variable "taint" {
  type        = "list"
  default     = []
  description = "List of kubernetes taints to apply to each node"
}

##########################
###  PRIVATE CLUSTER   ###
##########################

# https://www.terraform.io/docs/providers/google/r/container_cluster.html#master_ipv4_cidr_block
variable "ipv4_cidr_block" {
  type        = "string"
  default     = "10.0.0.0/28"
  description = "Specifies a private RFC1918 block for the master's VPC. The master range must not overlap with any subnet in your cluster's VPC. The master and your cluster use VPC peering. Must be specified in CIDR notation and must be /28 subnet."
}

# https://www.terraform.io/docs/providers/google/r/container_cluster.html#ip_allocation_policy
variable "ip_allocation_policy" {
  type        = "list"
  default     = []
  description = "Configuration for cluster IP allocation. As of now, only pre-allocated subnetworks (custom type with secondary ranges) are supported"
}
