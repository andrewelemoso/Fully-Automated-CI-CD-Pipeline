variable "resource_group_name" {
  description = "The name of the resource group for the AKS cluster"
  type        = string
}

variable "cluster_location" {
  description = "The Azure region where the AKS cluster will be deployed"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to resources"
  type        = map(string)
  default     = {}
}

variable "node_count" {
  description = "The number of nodes in the default node pool"
  type        = number
}

variable "vm_size" {
  description = "The size of the VMs in the default node pool"
  type        = string
}

variable "aad_admin_group_object_ids" {
  description = "A list of Azure AD group object IDs that will have admin access to the AKS cluster."
  type        = list(string)
}

variable "cluster_name" {
  description = "The name of the AKS cluster"
  type        = string
}

