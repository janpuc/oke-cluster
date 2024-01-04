module "vcn" {
  source = "../common/vcn"

  compartment_id = var.compartment_id

  vcn_name      = "test-vcn"
  vcn_dns_label = "testvcn"
  vcn_cidr      = "10.0.0.0/16"

  public_subnet_name = "k8s-public-subnet"
  public_subnet_cidr = "10.0.0.0/24"

  private_subnet_name = "k8s-private-subnet"
  private_subnet_cidr = "10.0.1.0/24"
}

module "oke" {
  source = "../common/oke"

  compartment_id = var.compartment_id

  oke_cluster_name    = "k8s-cluster"
  oke_cluster_version = "v1.28.2"

  oke_node_pool_name = "k8s-node-pool"
  oke_node_pool_size = 2

  oke_node_linux_version = "8"

  oke_pods_cidr     = "10.244.0.0/16"
  oke_services_cidr = "10.96.0.0/16"

  vcn_id = module.vcn.vcn_id

  vcn_public_subnet_id  = module.vcn.public_subnet_id
  vcn_private_subnet_id = module.vcn.private_subnet_id
}

resource "local_file" "oke_kubeconfig" {
  content         = yamlencode(module.oke.kubeconfig)
  filename        = "${path.root}/generated/kubeconfig"
  file_permission = "0644"
}
