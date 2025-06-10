resource "azurerm_resource_group" "entra_rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = merge(var.tags, {
    homelab = "resource group"
  })
}

resource "azurerm_user_assigned_identity" "entra_id" {
  name                = var.entra_id_name
  resource_group_name = azurerm_resource_group.entra_rg.name
  location            = azurerm_resource_group.entra_rg.location
  tags                = merge(var.tags, {
    homelab = "entra id"
  })
}

resource "azuread_user" "son" {
  user_principal_name   = var.son_user_principal_name
  display_name          = var.son_display_name
  password              = var.son_password
  force_password_change = false
}

resource "azuread_user" "mom" {
  user_principal_name   = var.mom_user_principal_name
  display_name          = var.mom_display_name
  password              = var.mom_password
  force_password_change = false
}

