# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Import blocks for existing resources
import {
  id = "/subscriptions/57f52bfd-cff3-4a5b-9e96-40c260013804/resourceGroups/homelab"
  to = azurerm_resource_group.rg
}

import {
  id = "/subscriptions/57f52bfd-cff3-4a5b-9e96-40c260013804/resourceGroups/homelab-aks"
  to = module.aks.azurerm_resource_group.aks_rg
}

import {
  id = "/subscriptions/57f52bfd-cff3-4a5b-9e96-40c260013804/resourceGroups/homelab-entra-id"
  to = module.entra_id.azurerm_resource_group.entra_rg
}

import {
  id = "/subscriptions/57f52bfd-cff3-4a5b-9e96-40c260013804/resourceGroups/homelab-storage"
  to = module.storage.azurerm_resource_group.storage_rg
}

import {
  id = "/subscriptions/57f52bfd-cff3-4a5b-9e96-40c260013804/resourceGroups/homelab/providers/Microsoft.Network/virtualNetworks/isaac-vnet"
  to = module.vnet.azurerm_virtual_network.isaac_vnet
}

import {
  id = "/subscriptions/57f52bfd-cff3-4a5b-9e96-40c260013804/resourceGroups/homelab-aks/providers/Microsoft.ContainerService/managedClusters/isaac-cluster"
  to = module.aks.azurerm_kubernetes_cluster.aks
}

import {
  id = "/subscriptions/57f52bfd-cff3-4a5b-9e96-40c260013804/resourceGroups/homelab-entra-id/providers/Microsoft.ManagedIdentity/userAssignedIdentities/myentra"
  to = module.entra_id.azurerm_user_assigned_identity.entra_id
}

import {
  id = "/subscriptions/57f52bfd-cff3-4a5b-9e96-40c260013804/resourceGroups/homelab/providers/Microsoft.Network/virtualNetworks/isaac-vnet/subnets/subnet1"
  to = module.vnet.azurerm_subnet.subnet1
}

# AKS Module
module "aks" {
  source                     = "./modules/aks"
  resource_group_name        = "${var.resource_group_name}-aks"
  cluster_location           = var.cluster_location
  cluster_name               = var.cluster_name
  node_count                 = var.node_count
  vm_size                    = var.vm_size
  aad_admin_group_object_ids = [module.azure_ad.group_object_id]
  tags                       = var.tags
}

# Storage Module
module "storage" {
  source                         = "./modules/storage"
  resource_group_name            = "${var.resource_group_name}-storage"
  location                       = var.location
  storage_account_prefix         = var.storage_account_prefix
  storage_account_state_prefix   = var.storage_account_state_prefix
  account_tier                   = var.account_tier
  account_replication_type       = var.account_replication_type
  container_name                 = var.container_name
  container_access_type          = var.container_access_type
  state_account_tier             = var.state_account_tier
  state_account_replication_type = var.state_account_replication_type
  tags                           = var.tags
}

# Entra ID Module
module "entra_id" {
  source                  = "./modules/entra-id"
  resource_group_name     = "${var.resource_group_name}-entra-id"
  location                = var.location
  entra_id_name           = var.entra_id_name
  son_user_principal_name = var.son_user_principal_name
  son_display_name        = var.son_display_name
  son_password            = var.son_password
  mom_user_principal_name = var.mom_user_principal_name
  mom_display_name        = var.mom_display_name
  mom_password            = var.mom_password
  tags                    = var.tags
}

# RBAC Module
module "rbac" {
  source           = "./modules/rbac"
  scope            = var.scope
  role_name        = var.role_name
  principal_id     = module.entra_id.son_object_id
  mom_scope        = var.mom_scope
  mom_role_name    = var.mom_role_name
  mom_principal_id = module.entra_id.mom_object_id
}

# Virtual Network Module
module "vnet" {
  source               = "./modules/vnet"
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name
  location             = var.location
  address_space        = var.address_space
  subnet_prefixes      = var.subnet_prefixes
  tags                 = var.tags
}

# Azure AD Module
module "azure_ad" {
  source        = "./modules/Azure-AD"
  display_name  = var.Azure_AD_display_name
  group_members = var.Azure_AD_group_members
}
