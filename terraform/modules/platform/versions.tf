terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.24.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4.0"
    }
    oci = {
      source  = "oracle/oci"
      version = "~> 5.23.0"
    }
  }
  required_version = "~> 1.7.0"
}
