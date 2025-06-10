resource "azurerm_resource_group" "aks_rg" {
  name     = var.resource_group_name
  location = var.cluster_location
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = "myaks"

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = var.vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  azure_active_directory_role_based_access_control {
    azure_rbac_enabled     = true
    admin_group_object_ids = var.aad_admin_group_object_ids
  }

  network_profile {
    network_plugin = "kubenet"
    network_policy = "calico"
  }

  tags = merge(var.tags, { homelab = "aks" })
}
