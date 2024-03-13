terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "~> 5.33.0"
    }
  }
  required_version = "~> 1.7.0"
}
