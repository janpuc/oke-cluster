module "vcn" {
  source = "../common/vcn"

  compartment_id = var.compartment_id

  vcn_name      = "test-vcn"
  vcn_dns_label = "testvcn"
  vcn_cidr      = "10.0.0.0/16"

  public_subnet_name = "k8s-public-subnet"
  public_subnet_cidr = "10.0.0.0/24"

  private_subnet_name = "k8s-private-subnet"
  private_subnet_cidr = "10.0.1.0/24"
}
