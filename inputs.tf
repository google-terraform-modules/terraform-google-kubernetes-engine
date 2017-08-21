variable "name" {
    type = "string"
    description = "Name Cluster"
}

variable "zone" {
    type = "string"
    description = "Default zone"
}

variable "initial_node_count" {
    type = "string"
    default = "2"
    description = "Node in Cluster"
}

variable "additional_zones" {
    type = "list"
    default = []
    description = "List additional zones"
}

variable "username" {
    type = "string"
    description = "Username cluster auth"
}

variable "password" {
    type = "string"
    description = "Password cluster auth"
}

variable "machine_type" {
    type = "string"
    default = "n1-standard-1"
    description = "Type machine"
}

variable "disk_size_gb" {
    type = "string"
    default = 100
    description = "Define size disk"
}

variable "local_ssd_count" {
    type = "string"
    default = 0
    description = "Attach SSD Local"
}

variable "oauth_scopes" {
    type = "list"
    default = [
        "https://www.googleapis.com/auth/compute",
        "https://www.googleapis.com/auth/devstorage.read_only",
        "https://www.googleapis.com/auth/logging.write",
        "https://www.googleapis.com/auth/monitoring",
    ]
    description = "List API Scope GCP avalaible"
}
  
variable "tags" {
    type = "list"
    default = []
    description = "Add tags"
}

variable "http_load_balancing_disable" {
    type = "string"
    default = false
    description = "Active load balancing"
}

variable "horizontal_pod_autoscaling_disable" {
    type = "string"
    default = true
    description = "Active horizontal pod autoscaling"
}