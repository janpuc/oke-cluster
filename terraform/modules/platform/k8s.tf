locals {
  kubernetes_version = "v1.28.2"
  linux_version      = "8"
  prebaked_img_id = element([for source in data.oci_containerengine_node_pool_option.node_pool_options.sources :
    source.image_id if length(regexall("(${local.linux_version}\\.\\d*)-aarch64-([\\.0-9]+)-\\d-", source.source_name)) > 0 &&
  length(regexall(trim(local.kubernetes_version, "v"), source.source_name)) > 0], 0)
}

resource "oci_containerengine_cluster" "k8s_cluster" {
  compartment_id     = var.compartment_id
  kubernetes_version = local.kubernetes_version
  name               = "k8s-cluster"
  vcn_id             = module.vcn.vcn_id
  endpoint_config {
    is_public_ip_enabled = true
    subnet_id            = module.vcn.public_subnet_id
  }
  options {
    add_ons {
      is_kubernetes_dashboard_enabled = false
      is_tiller_enabled               = false
    }
    kubernetes_network_config {
      pods_cidr     = "10.244.0.0/16"
      services_cidr = "10.96.0.0/16"
    }
    service_lb_subnet_ids = [module.vcn.public_subnet_id]
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
  kubernetes_version = local.kubernetes_version
  name               = "k8s-node-pool"

  node_config_details {
    placement_configs {
      availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
      subnet_id           = module.vcn.private_subnet_id
    }

    placement_configs {
      availability_domain = data.oci_identity_availability_domains.ads.availability_domains[1].name
      subnet_id           = module.vcn.private_subnet_id
    }

    placement_configs {
      availability_domain = data.oci_identity_availability_domains.ads.availability_domains[2].name
      subnet_id           = module.vcn.private_subnet_id
    }

    size = 2
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
    value = "k8s-cluster"
  }
}

data "oci_containerengine_cluster_kube_config" "cluster_kube_config" {
  cluster_id = oci_containerengine_cluster.k8s_cluster.id
}

output "kubeconfig" {
  value = data.oci_containerengine_cluster_kube_config.cluster_kube_config.content
}
