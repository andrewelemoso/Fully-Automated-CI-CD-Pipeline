variable "storage_account_prefix" {
  description = "The prefix name of the Azure Storage Account"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to resources"
  type        = map(string)
  default     = {}
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the storage account"
  type        = string
}

variable "location" {
  description = "The Azure region where the storage account will be created"
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

variable "state_account_tier" {
  description = "The tier of the state storage account (Standard or Premium)"
  type        = string
  default     = "Standard"
}

variable "state_account_replication_type" {
  description = "The replication type of the state storage account (LRS, GRS, etc.)"
  type        = string
  default     = "LRS"
}

variable "storage_account_state_prefix" {
  description = "The prefix name of the state storage account"
  type        = string
  default     = "tfstate"
}