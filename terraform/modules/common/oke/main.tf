locals {
  prebaked_img_id = element([for source in data.oci_containerengine_node_pool_option.node_pool_options.sources :
    source.image_id if length(regexall("(${var.oke_node_linux_version}\\.\\d*)-aarch64-([\\.0-9]+)-\\d-", source.source_name)) > 0 &&
  length(regexall(trim(var.oke_cluster_version, "v"), source.source_name)) > 0], 0)
}

resource "oci_containerengine_cluster" "k8s_cluster" {
  compartment_id     = var.compartment_id
  kubernetes_version = var.oke_cluster_version
  name               = var.oke_cluster_name
  vcn_id             = var.vcn_id
  endpoint_config {
    is_public_ip_enabled = true
    subnet_id            = var.vcn_public_subnet_id
  }
  options {
    add_ons {
      is_kubernetes_dashboard_enabled = false
      is_tiller_enabled               = false
    }
    kubernetes_network_config {
      pods_cidr     = var.oke_pods_cidr
      services_cidr = var.oke_services_cidr
    }
    service_lb_subnet_ids = [var.vcn_public_subnet_id]
  }
}

data "oci_identity_availability_domains" "ads" {
  compartment_id = var.compartment_id
}

data "oci_containerengine_node_pool_option" "node_pool_options" {
  compartment_id      = var.compartment_id
  node_pool_option_id = oci_containerengine_cluster.k8s_cluster.id
}

resource "oci_containerengine_node_pool" "k8s_node_pool" {
  cluster_id         = oci_containerengine_cluster.k8s_cluster.id
  compartment_id     = var.compartment_id
  kubernetes_version = var.oke_cluster_version
  name               = var.oke_node_pool_name

  node_config_details {
    placement_configs {
      availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
      subnet_id           = var.vcn_private_subnet_id
    }

    placement_configs {
      availability_domain = data.oci_identity_availability_domains.ads.availability_domains[1].name
      subnet_id           = var.vcn_private_subnet_id
    }

    placement_configs {
      availability_domain = data.oci_identity_availability_domains.ads.availability_domains[2].name
      subnet_id           = var.vcn_private_subnet_id
    }

    size = var.oke_node_pool_size
  }

  node_shape = "VM.Standard.A1.Flex"

  node_shape_config {
    memory_in_gbs = 12
    ocpus         = 2
  }
  node_source_details {
    image_id    = local.prebaked_img_id
    source_type = "image"

    boot_volume_size_in_gbs = 100
  }
  initial_node_labels {
    key   = "name"
    value = var.oke_cluster_name
  }
}

data "oci_containerengine_cluster_kube_config" "cluster_kube_config" {
  cluster_id = oci_containerengine_cluster.k8s_cluster.id
}
