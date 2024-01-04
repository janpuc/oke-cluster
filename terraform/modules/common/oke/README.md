# oke

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.6.0 |
| <a name="requirement_oci"></a> [oci](#requirement\_oci) | ~> 5.23.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci"></a> [oci](#provider\_oci) | 5.23.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [oci_containerengine_cluster.k8s_cluster](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/containerengine_cluster) | resource |
| [oci_containerengine_node_pool.k8s_node_pool](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/containerengine_node_pool) | resource |
| [oci_containerengine_cluster_kube_config.cluster_kube_config](https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/containerengine_cluster_kube_config) | data source |
| [oci_containerengine_node_pool_option.node_pool_options](https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/containerengine_node_pool_option) | data source |
| [oci_identity_availability_domains.ads](https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/identity_availability_domains) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_compartment_id"></a> [compartment\_id](#input\_compartment\_id) | Compartment ID (OCID) of the Tenancy | `string` | n/a | yes |
| <a name="input_oke_cluster_name"></a> [oke\_cluster\_name](#input\_oke\_cluster\_name) | OKE Cluster Name | `string` | n/a | yes |
| <a name="input_oke_cluster_version"></a> [oke\_cluster\_version](#input\_oke\_cluster\_version) | OKE Cluster Version | `string` | `"v1.28.2"` | no |
| <a name="input_oke_node_linux_version"></a> [oke\_node\_linux\_version](#input\_oke\_node\_linux\_version) | OKE Node Linux Version | `string` | `"8"` | no |
| <a name="input_oke_node_pool_name"></a> [oke\_node\_pool\_name](#input\_oke\_node\_pool\_name) | OKE Node Pool Name | `string` | n/a | yes |
| <a name="input_oke_node_pool_size"></a> [oke\_node\_pool\_size](#input\_oke\_node\_pool\_size) | OKE Node Pool Size | `number` | `2` | no |
| <a name="input_oke_pods_cidr"></a> [oke\_pods\_cidr](#input\_oke\_pods\_cidr) | OKE Pods CIDR | `string` | `"10.244.0.0/16"` | no |
| <a name="input_oke_services_cidr"></a> [oke\_services\_cidr](#input\_oke\_services\_cidr) | OKE Services CIDR | `string` | `"10.96.0.0/16"` | no |
| <a name="input_vcn_id"></a> [vcn\_id](#input\_vcn\_id) | VCN ID | `string` | n/a | yes |
| <a name="input_vcn_private_subnet_id"></a> [vcn\_private\_subnet\_id](#input\_vcn\_private\_subnet\_id) | VCN Private Subnet ID | `string` | n/a | yes |
| <a name="input_vcn_public_subnet_id"></a> [vcn\_public\_subnet\_id](#input\_vcn\_public\_subnet\_id) | VCN Public Subnet ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_certificate_authority_data"></a> [certificate\_authority\_data](#output\_certificate\_authority\_data) | OKE Cluster CA |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | OKE Cluster Endpoint |
| <a name="output_id"></a> [id](#output\_id) | OKE Cluster ID |
| <a name="output_kubeconfig"></a> [kubeconfig](#output\_kubeconfig) | Kubeconfig |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
