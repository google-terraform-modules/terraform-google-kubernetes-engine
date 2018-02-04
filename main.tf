locals {
  name_prefix = "${var.name}-${var.env}-${var.zone}"
}

data "google_container_engine_versions" "region" {
  zone = "${var.zone}"
}

resource "google_container_node_pool" "new_container_cluster_node_pool" {
  name    = "${local.name_prefix}-node"
  zone    = "${var.zone}"
  node_count = "${var.node_count}"
  cluster = "${google_container_cluster.new_container_cluster.name}"

  node_config {
    machine_type    = "${var.machine_type_node}"
    disk_size_gb    = "${var.disk_size_gb_node}"
    local_ssd_count = "${var.local_ssd_count_node}"
    oauth_scopes    = "${var.oauth_scopes}"
  }

  # Autoscale
  autoscaling {
    min_node_count = "${var.minNodeCount_node}"
    max_node_count = "${var.maxNodeCount_node}"
  }

  management {
    auto_repair = "${var.auto_repair}"
    auto_upgrade = "${var.auto_upgrade}"
  }
}

resource "google_container_cluster" "new_container_cluster" {
  name               = "${local.name_prefix}-master"
  min_master_version = "${var.min_master_version != "false" ? var.min_master_version : data.google_container_engine_versions.region.latest_node_version}"
  zone               = "${var.zone}"
  initial_node_count = "${var.cluster_count}"
  additional_zones   = "${var.additional_zones}"
  network            = "${var.network}"
  subnetwork         = "${var.subnetwork}"

  master_auth {
    username = "${var.username}"
    password = "${var.password}"
  }

  node_config {
    machine_type    = "${var.machine_type}"
    disk_size_gb    = "${var.disk_size_gb}"
    local_ssd_count = "${var.local_ssd_count}"
    oauth_scopes    = "${var.oauth_scopes}"

    labels {
      environment = "${var.env}"
    }

    tags = ["${local.name_prefix}-master", "${var.env}"]
  }

  addons_config {
    http_load_balancing {
      disabled = "${var.http_load_balancing_disable}"
    }

    horizontal_pod_autoscaling {
      disabled = "${var.horizontal_pod_autoscaling_disable}"
    }

    kubernetes_dashboard {
      disabled = "${var.kubernetes_dashboard}"
    }
  }

  maintenance_policy {
    daily_maintenance_window {
      start_time = "${var.maintenance_window}"
    }
  }
}
