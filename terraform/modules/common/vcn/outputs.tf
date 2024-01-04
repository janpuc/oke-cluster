output "vcn_id" {
  description = "VCN ID"
  value       = module.vcn.vcn_id
}

output "public_subnet_id" {
  description = "Public subnet ID"
  value       = oci_core_subnet.vcn_public_subnet.id
}

output "private_subnet_id" {
  description = "Private subnet ID"
  value       = oci_core_subnet.vcn_private_subnet.id
}
