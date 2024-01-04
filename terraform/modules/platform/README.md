# platform

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.6.0 |
| <a name="requirement_oci"></a> [oci](#requirement\_oci) | ~>5.23.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_oke"></a> [oke](#module\_oke) | ../common/oke | n/a |
| <a name="module_vcn"></a> [vcn](#module\_vcn) | ../common/vcn | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_compartment_id"></a> [compartment\_id](#input\_compartment\_id) | Compartment ID (OCID) of the Tenancy | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kubeconfig"></a> [kubeconfig](#output\_kubeconfig) | Kubeconfig |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
