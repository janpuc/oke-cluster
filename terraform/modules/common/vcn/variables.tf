variable "compartment_id" {
  description = "Compartment ID (OCID) of the Tenancy"
  type        = string
}

variable "vcn_name" {
  description = "VCN name"
  type        = string
}

variable "vcn_dns_label" {
  description = "VCN DNS label"
  type        = string
}

variable "vcn_cidr" {
  description = "VCN CIDR block"
  type        = string
}

variable "public_subnet_name" {
  description = "Public subnet name"
  type        = string
}

variable "public_subnet_cidr" {
  description = "Public subnet CIDR"
  type        = string
}

variable "private_subnet_name" {
  description = "Private subnet name"
  type        = string
}

variable "private_subnet_cidr" {
  description = "Private subnet CIDR"
  type        = string
}
