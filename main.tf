resource "google_container_cluster" "new_container_cluster" {
    name = "${var.name}"
    zone = "${var.zone}"
    initial_node_count = "${var.initial_node_count}"
    additional_zones = "${var.additional_zones}"
    network = "${var.network}"
    subnetwork = "${var.subnetwork}"

    master_auth {
        username = "${var.username}"
        password = "${var.password}"
    }

    node_config {
        machine_type = "${var.machine_type}"
        disk_size_gb = "${var.disk_size_gb}"
        local_ssd_count = "${var.local_ssd_count}"
        oauth_scopes = "${var.oauth_scopes}"
        tags = "${var.tags}"
    }

    addons_config {
        http_load_balancing {
            disabled = "${var.http_load_balancing_disable}"
        }

        horizontal_pod_autoscaling {
            disabled = "${var.horizontal_pod_autoscaling_disable}"
        }
    }
}