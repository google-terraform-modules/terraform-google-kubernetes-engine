# Google Kubernetes Engine (GKE) cluster

Compatible provider `1.8`

## Example

* 1 cluster, 3 nodes, n1-standard-1

```hcl
module "gke-cluster" {
  source           = "github.com/google-terraform-modules/gke"

  name     = "mycluster"
  env      = "prod"
  zone     = "europe-west1-b"
  username = "admin"
  password = "ZBfEg1lOs|k9T26e"
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
| name | The name of the cluster, unique within the project and zone | string | - | yes |
| env | Type of environnement (prod, staging, dev, int ...) | string | - | yes |
| min_master_version | The minimum version of the master. | string | `false` | no |
| image_type | The image type to use for this node (cos or Ubuntu) | string | `cos` | no |
| network | The name or self_link of the Google Compute Engine network to which the cluster is connected | string | `default` | no|
| zone | The zone that the master and the number of nodes specified in node_count should be created in | string | - | yes |
| subnetwork | Name of the subnet to which to attach the cluster | string | `default` | no |
| enable_legacy_abac | Whether the ABAC authorizer is enabled for this cluster. When enabled, identities in the system, including service accounts, nodes, and controllers, will have statically granted permissions beyond those provided by the RBAC configuration or IAM | string | `true` | no |
| **(DISABLE - BUG PROVIDER)** gpus_number | The number of the guest accelerator cards exposed to this instance | string | `0` | no |
| **(DISABLE - BUG PROVIDER)** gpus_type | The accelerator type resource to expose to this instance | string | `nvidia-tesla-k80` | no |
| additional_zones | If additional zones are configured, the number of nodes specified in node_count is created in all specified zones | list | `<list>` | no |
| cluster_count | The number of nodes to create in this cluster (not including the Kubernetes master) | string | `1` | no |
| node_count | The initial node count for the pool | string | `2` | no |
| machine_type | The name of a Google Compute Engine machine type | string | `n1-standard-1` | no |
| machine_type_node | The name of a Google Compute Engine machine type | string | `n1-standard-1` | no |
| maxNodeCount_node | Maximum number of nodes in the NodePool (Autoscale) | string | `3` | no |
| minNodeCount_node | Minimum number of nodes in the NodePool (Autoscale) | string | `1` | no |
| disk_size_gb | Size of the disk attached to each node, specified in GB | string | `10` | no |
| disk_size_gb_node | Size of the disk attached to each node, specified in GB | string | `10` | no |
| horizontal_pod_autoscaling_disable | The status of the Horizontal Pod Autoscaling addon | string | `true` | no |
| http_load_balancing_disable | The status of the HTTP Load Balancing add-on | string | `false` | no |
| local_ssd_count | The amount of local SSD disks that will be attached to each cluster node | string | `0` | no |
| local_ssd_count_node | The amount of local SSD disks that will be attached to each node pool | string | `0` | no |
| maintenance_window | Time window specified for daily maintenance operations. Specify start_time in RFC3339 format HH:MM”, where HH : [00-23] and MM : [00-59] GMT | string | `04:30` | no |
| oauth_scopes | The set of Google API scopes to be made available on all of the node VMs under the default service account | list| `<list>` | no |
| kubernetes_dashboard | The status of the Kubernetes Dashboard add-on | string | `false` | no |
| username | The username to use for HTTP basic authentication when accessing the Kubernetes master endpoint | string | - | yes |
| password | The password to use for HTTP basic authentication when accessing the Kubernetes master endpoint | string | - | yes |
| kubernetes_alpha | **(WARNING ALPHA)** Whether to enable Kubernetes Alpha features for this cluster. Note that when this option is enabled, the cluster cannot be upgraded and will be automatically deleted after 30 days. | string | `false` | no |
| monitoring_service | The list of instance tags applied to all nodes. Tags are used to identify valid sources or targets for network firewalls | string | `monitoring.googleapis.com` | no |
| logging_service | The logging service that the cluster should write logs to. Available options include logging.googleapis.com and none | string | `logging.googleapis.com` | no |
| preemptible | A boolean that represents whether or not the underlying node VMs are preemptible | string | `false` | no |
| pod_security_policy_config | Enable the PodSecurityPolicy controller for this cluster. If enabled, pods must be valid under a PodSecurityPolicy to be created | string | `false` | no |
| auto_repair | **(WARNING BETA)** Whether the nodes will be automatically repaired | string | `false` | no |
| auto_upgrade | **(WARNING BETA)** Whether the nodes will be automatically upgraded | string | `false` | no |
| tags | The list of instance tags applied to all nodes. Tags are used to identify valid sources or targets for network firewalls.| list | `<list>` | no |

## Outputs

| Name | Description |
|------|-------------|
| client_certificate | Base64 encoded public certificate used by clients to authenticate to the cluster endpoint |
| client_key | Base64 encoded private key used by clients to authenticate to the cluster endpoint |
| cluster_ca_certificate | Base64 encoded public certificate that is the root of trust for the cluster |
| endpoint | The IP address of this cluster's Kubernetes master |
| instance_group_urls | List of instance group URLs which have been assigned to the cluster |
| master_version | The current version of the master in the cluster |