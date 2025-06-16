variable "display_name" {
  description = "The display name for the Azure AD resources."
  type        = string
}

variable "group_members" {
  description = "The object IDs of the group members."
  type        = list(string)
}

