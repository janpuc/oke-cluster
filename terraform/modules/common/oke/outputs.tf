output "kubeconfig" {
  description = "Kubeconfig"
  value       = data.oci_containerengine_cluster_kube_config.cluster_kube_config.content
}
