variable "name" {
  type        = string
  description = "Storage account name."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group for the storage account."
}

variable "location" {
  type        = string
  description = "Azure region."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags for the storage account."
}
