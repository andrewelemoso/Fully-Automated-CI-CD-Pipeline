module "aks" {
  source                     = "./modules/aks"
  resource_group_name        = "${var.resource_group_name}-aks"
  cluster_location           = var.cluster_location
  cluster_name               = var.cluster_name
  node_count                 = var.node_count
  vm_size                    = var.vm_size
  aad_admin_group_object_ids = var.aad_admin_group_object_ids
  tags                       = var.tags
}

module "storage" {
  source                   = "./modules/storage"
  resource_group_name      = "${var.resource_group_name}-storage"
  location                 = var.location
  storage_account_prefix   = var.storage_account_prefix
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  container_name           = var.container_name
  container_access_type    = var.container_access_type
  tags                     = var.tags
}

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

module "rbac" {
  source           = "./modules/rbac"
  scope            = var.scope
  role_name        = var.role_name
  principal_id     = module.entra_id.son_object_id
  mom_scope        = var.mom_scope
  mom_role_name    = var.mom_role_name
  mom_principal_id = module.entra_id.mom_object_id
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

#data "azurerm_client_config" "current" {}
