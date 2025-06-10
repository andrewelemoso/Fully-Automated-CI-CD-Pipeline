output "entra_id_id" {
  value = azurerm_user_assigned_identity.entra_id.id
}

output "entra_id_name" {
  value = azurerm_user_assigned_identity.entra_id.name
}

output "son_object_id" {
  value = azuread_user.son.object_id
}

output "mom_object_id" {
  value = azuread_user.mom.object_id
}