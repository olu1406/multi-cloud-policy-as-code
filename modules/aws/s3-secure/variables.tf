variable "name" {
  type        = string
  description = "S3 bucket name."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags for the bucket."
}
