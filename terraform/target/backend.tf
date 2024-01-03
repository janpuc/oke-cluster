terraform {
  backend "s3" {
    bucket                      = "oke-cluster"
    region                      = "eu-frankfurt-1"
    key                         = "terraform.tfstate"
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    use_path_style              = true
    skip_metadata_api_check     = true
    endpoints                   = { s3 = "https://fr2kdr2nkebq.compat.objectstorage.eu-frankfurt-1.oraclecloud.com" }
    shared_credentials_files    = ["~/.oci/config"]
  }
}
