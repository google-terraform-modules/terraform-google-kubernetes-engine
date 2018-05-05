##########################
###         GKE        ###
##########################

variable "general" {
  type        = "map"
  description = "Global parameters"
}

variable "master" {
  type        = "map"
  default     = {}
  description = "Kubernetes master parameters to initialize"
}

variable "default_node_pool" {
  type        = "map"
  default     = {}
  description = "Default pool setting"
}

variable "node_pool" {
  type        = "list"
  default     = []
  description = "Node pool setting to create"
}

# https://www.terraform.io/docs/providers/google/r/container_cluster.html#tags
variable "tags" {
  type        = "list"
  default     = []
  description = "The list of instance tags applied to all nodes. Tags are used to identify valid sources or targets for network firewalls."
}

##########################
###    AUTH API K8S    ###
##########################

# https://www.terraform.io/docs/providers/google/r/container_cluster.html#username
variable "master_auth" {
  type        = "map"
  description = "The username & password to use for HTTP basic authentication when accessing the Kubernetes master endpoint"
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
  description = "List of kubernetes taints to apply to each node. Structure is documented below."
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

##########################
###       NETWORK      ###
##########################

# https://www.terraform.io/docs/providers/google/r/container_cluster.html#network
variable "network" {
  type        = "string"
  default     = "default"
  description = "The name or self_link of the Google Compute Engine network to which the cluster is connected"
}

# https://www.terraform.io/docs/providers/google/r/container_cluster.html#subnetwork
variable "subnetwork" {
  type        = "string"
  default     = "default"
  description = "Name of the subnet to which to attach the cluster"
}
