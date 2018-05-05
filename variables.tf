##########################
###     MASTER GKE     ###
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

variable "node_additional_zones" {
  type        = "list"
  default     = []
  description = ""
}

# https://www.terraform.io/docs/providers/google/r/container_cluster.html#taint
# WARNING BETA
variable "taint" {
  type        = "list"
  default     = []
  description = "List of kubernetes taints to apply to each node. Structure is documented below."
}

##########################
###       NETWORK      ###
##########################

variable "ip_allocation_policy" {
  type        = "list"
  default     = []
  description = ""
}

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
