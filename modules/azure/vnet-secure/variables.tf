variable "name" {
  type        = string
  description = "Virtual network name."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group for the VNet."
}

variable "location" {
  type        = string
  description = "Azure region."
}

variable "address_space" {
  type        = list(string)
  description = "Address space for the VNet."
}

variable "subnet_prefix" {
  type        = string
  description = "CIDR prefix for the default subnet."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags for the VNet."
}
