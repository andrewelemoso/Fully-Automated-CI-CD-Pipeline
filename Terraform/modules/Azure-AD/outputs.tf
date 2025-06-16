output "group_object_id" {
  description = "The object ID of the AKS admin group."
  value       = azuread_group.aks_admin.object_id
}
