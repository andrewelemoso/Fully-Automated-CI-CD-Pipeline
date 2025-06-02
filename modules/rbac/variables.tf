variable "scope" {
  description = "The scope at which the RBAC role assignment applies"
  type        = string
}

variable "role_name" {
  description = "The name of the RBAC role to assign"
  type        = string
}

variable "principal_id" {
  description = "The principal ID to assign the role to (user, group, or service principal)"
  type        = string
}

variable "mom_scope" {
  description = "The scope at which the RBAC role assignment applies for Mom"
  type        = string
}

variable "mom_role_name" {
  description = "The name of the RBAC role to assign to Mom"
  type        = string
}

variable "mom_principal_id" {
  description = "The principal ID to assign the role to Mom (user, group, or service principal)"
  type        = string
}
