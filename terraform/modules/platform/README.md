# platform

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.6.0 |
| <a name="requirement_oci"></a> [oci](#requirement\_oci) | ~>5.23.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci"></a> [oci](#provider\_oci) | 5.23.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vcn"></a> [vcn](#module\_vcn) | ../common/vcn | n/a |

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

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kubeconfig"></a> [kubeconfig](#output\_kubeconfig) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
