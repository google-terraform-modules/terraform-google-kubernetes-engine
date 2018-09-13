# Google Kubernetes Engine (GKE) cluster

Compatible provider `1.16.2 - 1.17.1`

## Examples

* 1 cluster, 1 default node pool (2 nodes (10GB/node) n1-standard-1), latest version of Kubernetes for each node

```hcl
module "gke-cluster" {
  source = "google-terraform-modules/kubernetes-engine/google"
  version = "1.17.0"

  general = {
    name = "mycluster"
    env  = "prod"
    zone = "europe-west1-b"
  }

  master = {
    username = "admin"
    password = "${random_string.password.result}"
  }
}
```

* 1 cluster, 1 default node pool (3 nodes & n1-standard-1), 2 extra node pool & latest version of Kubernetes for each node

```hcl
module "gke-cluster" {
  source = "google-terraform-modules/kubernetes-engine/google"
  version = "1.17.0"

  general = {
    name = "mycluster"
    env  = "prod"
    zone = "europe-west1-b"
  }

  master = {
    username = "admin"
    password = "${random_string.password.result}"
  }

  default_node_pool = {
    node_count = 3
    remove     = false
  }

  # Optional in case we have a default pool
  node_pool = [
    {
      machine_type   = "g1-small"
      disk_size_gb   = 20
      node_count     = 3
      min_node_count = 2
      max_node_count = 4
    },
    {
      disk_size_gb   = 30
      node_count     = 2
      min_node_count = 1
      max_node_count = 3
    },
  ]
}
```

For the password, you can use the [random provider](https://www.terraform.io/docs/providers/random/index.html) :

```hcl
resource "random_string" "password" {
  length  = 16
  special = true
  number  = true
  lower   = true
  upper   = true
}
```


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| default_node_pool | Default pool setting | map | `<map>` | no |
| general | Global parameters | map | - | yes |
| ip_allocation_policy | Configuration for cluster IP allocation. As of now, only pre-allocated subnetworks (custom type with secondary ranges) are supported | list | `<list>` | no |
| ipv4_cidr_block | Specifies a private RFC1918 block for the master's VPC. The master range must not overlap with any subnet in your cluster's VPC. The master and your cluster use VPC peering. Must be specified in CIDR notation and must be /28 subnet. | string | `10.0.0.0/28` | no |
| labels | The Kubernetes labels (key/value pairs) to be applied to each node | map | `<map>` | no |
| master | Kubernetes master parameters to initialize | map | - | yes |
| node_additional_zones | The list of additional Google Compute Engine locations in which the cluster's nodes should be located. If additional zones are configured, the number of nodes specified in initial_node_count is created in all specified zones | list | `<list>` | no |
| node_pool | Node pool setting to create | list | `<list>` | no |
| tags | The list of instance tags applied to all nodes. Tags are used to identify valid sources or targets for network firewalls | list | `<list>` | no |
| taint | List of kubernetes taints to apply to each node | list | `<list>` | no |


## Outputs

| Name | Description |
|------|-------------|
| client_certificate | Base64 encoded public certificate used by clients to authenticate to the cluster endpoint |
| client_key | Base64 encoded private key used by clients to authenticate to the cluster endpoint |
| cluster_ca_certificate | Base64 encoded public certificate that is the root of trust for the cluster |
| cluster_name | The full name of this Kubernetes cluster |
| endpoint | The IP address of this cluster's Kubernetes master |
| gcr_url | This data source fetches the project name, and provides the appropriate URLs to use for container registry for this project |
| instance_group_urls | List of instance group URLs which have been assigned to the cluster |
| maintenance_window | Duration of the time window, automatically chosen to be smallest possible in the given scenario. Duration will be in RFC3339 format PTnHnMnS |
| master_version | The current version of the master in the cluster. |
| password | The password to login on the master Kubernetes |
| username | The username to login on the master Kubernetes |
