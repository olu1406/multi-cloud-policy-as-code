variable "name" {
  type        = string
  description = "Logging bucket name."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags for the bucket."
}
