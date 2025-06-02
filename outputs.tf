output "aks_cluster_name" {
  value = module.aks.aks_cluster_name
}

output "entra_id" {
  value = module.entra_id.entra_id_id
}

output "rbac_son_role_assignment_id" {
  value = module.rbac.son_role_assignment_id
}

output "rbac_son_role_assignment_name" {
  value = module.rbac.son_role_assignment_name
}

output "rbac_mom_role_assignment_id" {
  value = module.rbac.mom_role_assignment_id
}

output "rbac_mom_role_assignment_name" {
  value = module.rbac.mom_role_assignment_name
}