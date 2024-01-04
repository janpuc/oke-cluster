terraform {
  required_version = "~> 1.6.0"
}

module "platform" {
  source = "../modules/platform"

  compartment_id = var.compartment_id
}

# output "kubeconfig" {
#   value = module.platform.kubeconfig
# }

# resource "local_file" "oke_kubeconfig" {
#   content         = module.platform.kubeconfig
#   filename        = "${path.root}/generated/kubeconfig"
#   file_permission = "0644"
# }
