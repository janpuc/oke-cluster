terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "~> 5.45.0"
    }
  }
  required_version = "~> 1.9.0"
}
