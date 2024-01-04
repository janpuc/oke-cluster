output "kubeconfig" {
  description = "Kubeconfig"
  value       = local.kubeconfig
}

output "endpoint" {
  description = "OKE Cluster Endpoint"
  value       = local.kubeconfig.clusters[0].cluster.server
}

output "certificate_authority_data" {
  description = "OKE Cluster CA"
  value       = local.kubeconfig.clusters[0].cluster.certificate-authority-data
}

output "id" {
  description = "OKE Cluster ID"
  value       = oci_containerengine_cluster.k8s_cluster.id
}
