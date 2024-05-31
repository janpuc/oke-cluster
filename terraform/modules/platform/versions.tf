terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.30.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5.0"
    }
    oci = {
      source  = "oracle/oci"
      version = "~> 5.33.0"
    }
  }
  required_version = "~> 1.8.0"
}
