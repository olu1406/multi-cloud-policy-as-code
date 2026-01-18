variable "name" {
  type        = string
  description = "Config recorder name."
}

variable "role_arn" {
  type        = string
  description = "IAM role ARN for AWS Config."
}

variable "bucket_name" {
  type        = string
  description = "S3 bucket for AWS Config delivery."
}
