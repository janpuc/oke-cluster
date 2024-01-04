provider "oci" {
  config_file_profile = "DEFAULT"
}

provider "kubernetes" {
  host                   = module.oke.endpoint
  cluster_ca_certificate = base64decode(module.oke.certificate_authority_data)

  exec {
    api_version = "client.authentication.k8s.io/v1"
    command     = "oci"
    args        = ["ce", "cluster", "generate-token", "--cluster-id", module.oke.id, "--region", var.region]
  }
}
