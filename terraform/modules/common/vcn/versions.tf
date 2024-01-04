terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "~>5.23.0"
    }
  }
  required_version = "~> 1.6.0"
}
