# Container Engine (GCP)

## Example

```
module "container-cluster" {
  source = "github.com/terraform-modules/module-gcp-gke"
  name = "${var.name}"
  zone = "${var.zone}"
  initial_node_count = "${var.initial_node_count}"
  additional_zones = "${var.additional_zones}"
  username = "${var.username}"
  password = "${var.password}"
  machine_type = "${var.machine_type}"
  disk_size_gb = "${var.disk_size_gb}"
  local_ssd_count = "${var.local_ssd_count}"
  network = "${module.network.name}"
  subnetwork = "${var.subnet_name}"
  oauth_scopes = "${var.oauth_scopes}"
  tags = "${var.tags}"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| additional_zones | If additional zones are configured, the number of nodes specified in initial_node_count is created in all specified zones | list | `<list>` | no |
| disk_size_gb | Size of the disk attached to each node, specified in GB | string | `100` | no |
| horizontal_pod_autoscaling_disable | The status of the Horizontal Pod Autoscaling addon | string | `true` | no |
| http_load_balancing_disable | The status of the HTTP Load Balancing add-on | string | `false` | no |
| initial_node_count | The number of nodes to create in this cluster (not including the Kubernetes master) | string | `2` | no |
| local_ssd_count | The amount of local SSD disks that will be attached to each cluster node | string | `0` | no |
| machine_type | The name of a Google Compute Engine machine type | string | `n1-standard-1` | no |
| name | The name of the cluster, unique within the project and zone | string | - | yes |
| network | The name or self_link of the Google Compute Engine network to which the cluster is connected | string | `default` | no |
| oauth_scopes | The set of Google API scopes to be made available on all of the node VMs under the default service account | list | `<list>` | no |
| password | The password to use for HTTP basic authentication when accessing the Kubernetes master endpoint | string | - | yes |
| subnetwork | Name of the subnet to which to attach the cluster | string | `default` | no |
| tags | The list of instance tags applied to all nodes. Tags are used to identify valid sources or targets for network firewalls. | list | `<list>` | no |
| username | The username to use for HTTP basic authentication when accessing the Kubernetes master endpoint | string | - | yes |
| zone | The zone that the master and the number of nodes specified in initial_node_count should be created in | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| endpoint | The IP address of this cluster's Kubernetes master |
| instance_group_urls | List of instance group URLs which have been assigned to the cluster |
| master_auth | Master auth client (object) |