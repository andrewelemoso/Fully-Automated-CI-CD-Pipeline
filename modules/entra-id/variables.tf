variable "resource_group_name" {
  description = "The name of the resource group for Entra ID"
  type        = string
}

variable "location" {
  description = "The Azure region for Entra ID"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to resources"
  type        = map(string)
  default     = {}
}

variable "entra_id_name" {
  description = "The name of the Azure Entra ID (User Assigned Identity)"
  type        = string
}

variable "son_password" {
  description = "Password for the Son user"
  type        = string
}

variable "mom_password" {
  description = "Password for the Mom user"
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

variable "mom_user_principal_name" {
  description = "User principal name for Mom"
  type        = string
}

variable "mom_display_name" {
  description = "Display name for Mom"
  type        = string
}
