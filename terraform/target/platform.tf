terraform {
  required_version = "~> 1.7.0"
}

module "platform" {
  source = "../modules/platform"

  compartment_id = var.compartment_id
}
