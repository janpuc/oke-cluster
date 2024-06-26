terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "~> 5.47.0"
    }
  }
  required_version = "~> 1.8.0"
}
