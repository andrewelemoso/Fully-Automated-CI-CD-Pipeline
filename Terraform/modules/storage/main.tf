resource "azurerm_resource_group" "storage_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
}

resource "azurerm_storage_account" "storage" {
  name                     = "${var.storage_account_prefix}${random_string.suffix.result}"
  resource_group_name      = azurerm_resource_group.storage_rg.name
  location                 = azurerm_resource_group.storage_rg.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  tags = merge(var.tags, {
    homelab = "storage account"
  })
}

resource "azurerm_storage_container" "container" {
  name                  = var.container_name
  storage_account_id    = azurerm_storage_account.storage.id
  container_access_type = var.container_access_type
}

resource "azurerm_storage_account" "state_storage" {
  name                            = "${var.storage_account_state_prefix}${random_string.suffix.result}"
  resource_group_name             = azurerm_resource_group.storage_rg.name
  location                        = azurerm_resource_group.storage_rg.location
  account_tier                    = var.state_account_tier
  account_replication_type        = var.state_account_replication_type
  account_kind                    = "StorageV2"
  min_tls_version                 = "TLS1_2"
  shared_access_key_enabled       = true
  default_to_oauth_authentication = false

  blob_properties {
    versioning_enabled            = true
    change_feed_enabled           = true
    change_feed_retention_in_days = 90
    last_access_time_enabled      = true
    delete_retention_policy {
      days = 30
    }
    container_delete_retention_policy {
      days = 30
    }
  }
  tags = merge(var.tags, {
    homelab = "storage account"
  })
}

resource "azurerm_storage_container" "state_container" {
  name                  = var.container_name
  storage_account_id    = azurerm_storage_account.state_storage.id
  container_access_type = var.container_access_type
}

