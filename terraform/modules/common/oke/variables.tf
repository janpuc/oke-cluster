variable "compartment_id" {
  description = "Compartment ID (OCID) of the Tenancy"
  type        = string
}

variable "oke_cluster_name" {
  description = "OKE Cluster Name"
  type        = string
}

variable "oke_cluster_version" {
  description = "OKE Cluster Version"
  type        = string
  default     = "v1.28.2"
}

variable "oke_node_pool_name" {
  description = "OKE Node Pool Name"
  type        = string
}

variable "oke_node_pool_size" {
  description = "OKE Node Pool Size"
  type        = number
  default     = 2
}

variable "oke_node_linux_version" {
  description = "OKE Node Linux Version"
  type        = string
  default     = "8"
}

variable "oke_pods_cidr" {
  description = "OKE Pods CIDR"
  type        = string
  default     = "10.244.0.0/16"
}

variable "oke_services_cidr" {
  description = "OKE Services CIDR"
  type        = string
  default     = "10.96.0.0/16"
}

variable "vcn_id" {
  description = "VCN ID"
  type        = string
}

variable "vcn_public_subnet_id" {
  description = "VCN Public Subnet ID"
  type        = string
}

variable "vcn_private_subnet_id" {
  description = "VCN Private Subnet ID"
  type        = string
}
