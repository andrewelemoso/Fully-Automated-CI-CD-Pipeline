variable "storage_account_prefix" {
  description = "The name of the Azure Storage Account"
  type        = string
}

variable "entra_id_name" {
  description = "The name of the Azure Entra ID"
  type        = string
}

variable "rbac_role_name" {
  description = "The name of the RBAC role"
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be deployed"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to resources"
  type        = map(string)
  default     = {}
}

variable "resource_group_name" {
  description = "The name of the resource group for AKS and Storage modules"
  type        = string
}

variable "node_count" {
  description = "The number of nodes in the AKS default node pool"
  type        = number
}

variable "vm_size" {
  description = "The VM size for the AKS default node pool"
  type        = string
}

variable "account_tier" {
  description = "The tier of the storage account (Standard or Premium)"
  type        = string
}

variable "account_replication_type" {
  description = "The replication type of the storage account (LRS, GRS, etc.)"
  type        = string
}

variable "container_name" {
  description = "The name of the storage container to create"
  type        = string
}

variable "container_access_type" {
  description = "The access type for the storage container (private, blob, or container)"
  type        = string
}

variable "son_user_principal_name" {
  description = "User principal name for Son"
  type        = string
}

variable "son_display_name" {
  description = "Display name for Son"
  type        = string
}

variable "son_password" {
  description = "Password for the Son user"
  type        = string
}

variable "mom_user_principal_name" {
  description = "User principal name for Mom"
  type        = string
}

variable "mom_display_name" {
  description = "Display name for Mom"
  type        = string
}

variable "mom_password" {
  description = "Password for the Mom user"
  type        = string
}

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

variable "subscription_id" {
  description = "The Azure subscription ID"
  type        = string
}

variable "cluster_name" {
  description = "The name of the AKS cluster"
  type        = string
}

variable "cluster_location" {
  description = "The name of the AKS cluster"
  type        = string
}

variable "state_account_tier" {
  description = "The tier of the state storage account (Standard or Premium)"
  type        = string
}

variable "state_account_replication_type" {
  description = "The replication type of the state storage account (LRS, GRS, etc.)"
  type        = string
}

variable "storage_account_state_prefix" {
  description = "The prefix name of the state storage account"
  type        = string
}

variable "virtual_network_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
}

variable "subnet_prefixes" {
  description = "The address prefixes for the subnets"
  type        = map(string)
}

variable "Azure_AD_group_members" {
  description = "List of Azure AD group members' object IDs"
  type        = list(string)

}

variable "Azure_AD_display_name" {
  description = "The display name for the Azure AD resources"
  type        = string
}