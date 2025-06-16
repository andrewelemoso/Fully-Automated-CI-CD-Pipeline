resource "azurerm_role_assignment" "son" {
  scope                = var.scope
  role_definition_name = var.role_name
  principal_id         = var.principal_id
}

resource "azurerm_role_assignment" "mom" {
  scope                = var.mom_scope
  role_definition_name = var.mom_role_name
  principal_id         = var.mom_principal_id
}
