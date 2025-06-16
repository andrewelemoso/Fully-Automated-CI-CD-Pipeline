resource "azuread_group" "aks_admin" {
  display_name     = var.display_name
  security_enabled = true
  mail_enabled     = false
}

resource "azuread_group_member" "members" {
  for_each         = toset(var.group_members)
  group_object_id  = azuread_group.aks_admin.object_id
  member_object_id = each.value
}

