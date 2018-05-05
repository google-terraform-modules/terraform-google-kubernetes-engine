locals {
  name_prefix = "${var.general["name"]}-${var.general["env"]}"
}

# This data source fetches the project name, and provides the appropriate URLs to use for container registry for this project.
# https://www.terraform.io/docs/providers/google/d/google_container_registry_repository.html
data "google_container_registry_repository" "registry" {}

# Provides access to available Google Container Engine versions in a zone for a given project.
# https://www.terraform.io/docs/providers/google/d/google_container_engine_versions.html
data "google_container_engine_versions" "region" {
  zone = "${var.general["zone"]}"
}

# Manages a Node Pool resource within GKE
# https://www.terraform.io/docs/providers/google/r/container_node_pool.html
resource "google_container_node_pool" "new_container_cluster_node_pool" {
  count      = "${length(var.node_pool)}"
  name       = "${local.name_prefix}-${lookup(var.node_pool[count.index], "zone", "none")}-pool-${count.index}"
  zone       = "${var.general["zone"]}"
  node_count = "${lookup(var.node_pool[count.index], "node_count", 1)}"
  cluster    = "${google_container_cluster.new_container_cluster.name}"

  node_config {
    machine_type    = "${lookup(var.node_pool[count.index], "machine_type", "n1-standard-1")}"
    disk_size_gb    = "${lookup(var.node_pool[count.index], "disk_size_gb", 10)}"
    local_ssd_count = "${lookup(var.node_pool[count.index], "local_ssd_count", 0)}"
    oauth_scopes    = "${split(",", lookup(var.node_pool[count.index], "oauth_scopes", "https://www.googleapis.com/auth/compute,https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring"))}"
  }

  autoscaling {
    min_node_count = "${lookup(var.node_pool[count.index], "min_node_count", 1)}"
    max_node_count = "${lookup(var.node_pool[count.index], "max_node_count", 3)}"
  }

  management {
    auto_repair  = "${lookup(var.node_pool[count.index], "auto_repair", true)}"
    auto_upgrade = "${lookup(var.node_pool[count.index], "auto_upgrade", true)}"
  }
}

# Creates a Google Kubernetes Engine (GKE) cluster
# https://www.terraform.io/docs/providers/google/r/container_cluster.html
resource "google_container_cluster" "new_container_cluster" {
  name = "${local.name_prefix}-${var.general["zone"]}-master"
  zone = "${var.general["zone"]}"

  additional_zones   = ["${var.node_additional_zones}"]
  initial_node_count = 1

  addons_config {
    horizontal_pod_autoscaling {
      disabled = "${lookup(var.master, "disable_horizontal_pod_autoscaling", false)}"
    }

    http_load_balancing {
      disabled = "${lookup(var.master, "disable_http_load_balancing", false)}"
    }

    kubernetes_dashboard {
      disabled = "${lookup(var.master, "disable_kubernetes_dashboard", false)}"
    }

    network_policy_config {
      disabled = "${lookup(var.master, "disable_network_policy_config", false)}"
    }
  }

  # cluster_ipv4_cidr - default 
  description             = "Kubernetes ${var.general["name"]} in ${var.general["zone"]}"
  enable_kubernetes_alpha = "${lookup(var.master, "enable_kubernetes_alpha", false)}"
  enable_legacy_abac      = "${lookup(var.master, "enable_legacy_abac", false)}"
  ip_allocation_policy    = "${var.ip_allocation_policy}"
  logging_service         = "${lookup(var.master, "logging_service", "logging.googleapis.com")}"

  maintenance_policy {
    daily_maintenance_window {
      start_time = "${lookup(var.master, "maintenance_window", "04:30")}"
    }
  }

  master_auth {
    username = "${var.master_auth["username"]}"
    password = "${var.master_auth["password"]}"
  }

  # master_authorized_networks_config - disable (security)
  master_ipv4_cidr_block = "${var.ipv4_cidr_block}"
  min_master_version     = "${lookup(var.general, "version", data.google_container_engine_versions.region.latest_node_version)}"
  monitoring_service     = "${lookup(var.master, "monitoring_service", "none")}"
  network                = "${var.network}"

  node_config {
    disk_size_gb = "${lookup(var.master, "disk_size_gb", 100)}"

    # BUG Provider - recreate loop
    # guest_accelerator {
    #   count = "${lookup(var.master, "gpus_number", 0)}"
    #   type  = "${lookup(var.master, "gpus_type", "nvidia-tesla-k80")}"
    # }
    image_type = "${lookup(var.master, "image", "COS")}"

    local_ssd_count = "${lookup(var.master, "local_ssd_count", 0)}"
    machine_type    = "${lookup(var.master, "machine_type", "n1-standard-1")}"

    # metadata - disable
    # min_cpu_platform - disable (useless)
    oauth_scopes = "${split(",", lookup(var.master, "oauth_scopes", "https://www.googleapis.com/auth/compute,https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring"))}"

    preemptible     = "${lookup(var.general, "preemptible", false)}"
    service_account = "default"
    tags            = "${var.tags}"

    # WARNING BETA
    taint = "${var.taint}"
  }

  node_version = "${lookup(var.general, "version", data.google_container_engine_versions.region.latest_node_version)}"

  pod_security_policy_config {
    # WARNING BETA
    enabled = "${lookup(var.master, "enable_pod_security_policy_config", false)}"
  }

  private_cluster          = "${lookup(var.master, "private", false)}"
  remove_default_node_pool = "${lookup(var.default_node_pool, "remove_default_node_pool", true)}"
  subnetwork               = "${var.subnetwork}"
}
