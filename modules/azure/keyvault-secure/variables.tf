variable "name" {
  type        = string
  description = "Key Vault name."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group for the Key Vault."
}

variable "location" {
  type        = string
  description = "Azure region."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags for the Key Vault."
}
