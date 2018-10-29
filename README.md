# Google Kubernetes Engine (GKE) cluster

Compatible provider `1.19.1` (**stable**)

## Examples

* 1 cluster, 1 default node pool (2 nodes (10GB/node) n1-standard-1), latest version of Kubernetes for each node,
* Default Google network (`default`).

```hcl
module "gke-cluster" {
  source = "google-terraform-modules/kubernetes-engine/google"
  version = "1.19.1"

  general = {
    name = "mycluster"
    env  = "prod"
    zone = "europe-west1-b"
  }

  master = {}
}
```

* 1 cluster, 1 default node pool (3 nodes & n1-standard-1), 2 extra node pool & latest version of Kubernetes for each node,
* Custom Google network.

```hcl
module "gke-cluster" {
  source = "google-terraform-modules/kubernetes-engine/google"
  version = "1.19.1"

  general = {
    name = "mycluster"
    env  = "prod"
    zone = "europe-west1-b"
  }

  master = {
    network    = "${google_compute_network.vpc.self_link}"
    subnetwork = "${google_compute_subnetwork.subnetwork-tools.self_link}"
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


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| default_node_pool | Default pool setting | map | `<map>` | no |
| general | Global parameters | map | - | yes |
| ip_allocation_policy | Configuration for cluster IP allocation. As of now, only pre-allocated subnetworks (custom type with secondary ranges) are supported | list | `<list>` | no |
| labels | The Kubernetes labels (key/value pairs) to be applied to each node | map | `<map>` | no |
| master | Kubernetes master parameters to initialize | map | - | yes |
| node_additional_zones | The list of additional Google Compute Engine locations in which the cluster's nodes should be located. If additional zones are configured, the number of nodes specified in initial_node_count is created in all specified zones | list | `<list>` | no |
| node_pool | Node pool setting to create | list | `<list>` | no |
| tags | The list of instance tags applied to all nodes. Tags are used to identify valid sources or targets for network firewalls | list | `<list>` | no |


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
