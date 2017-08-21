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
  oauth_scopes = "${var.oauth_scopes}"
  tags = "${var.tags}"
}
```


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| additional_zones | List additional zones | list | `<list>` | no |
| disk_size_gb | Define size disk | string | `100` | no |
| horizontal_pod_autoscaling_disable | Active horizontal pod autoscaling | string | `true` | no |
| http_load_balancing_disable | Active load balancing | string | `false` | no |
| initial_node_count | Node in Cluster | string | `2` | no |
| local_ssd_count | Attach SSD Local | string | `0` | no |
| machine_type | Type machine | string | `n1-standard-1` | no |
| name | Name Cluster | string | - | yes |
| oauth_scopes | List API Scope GCP avalaible | list | `<list>` | no |
| password | Password cluster auth | string | - | yes |
| tags | Add tags | list | `<list>` | no |
| username | Username cluster auth | string | - | yes |
| zone | Default zone | string | - | yes |
