variable "name" {
  type        = string
  description = "CloudTrail name."
}

variable "bucket_name" {
  type        = string
  description = "S3 bucket for CloudTrail logs."
}

variable "is_organization_trail" {
  type        = bool
  default     = true
  description = "Whether this is an organization trail."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags for CloudTrail and S3 bucket."
}
