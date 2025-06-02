output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_admin_config
}

output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}