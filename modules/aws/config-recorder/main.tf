resource "aws_config_configuration_recorder" "this" {
  name     = var.name
  role_arn = var.role_arn

  recording_group {
    all_supported                 = true
    include_global_resource_types = true
  }
}

resource "aws_config_delivery_channel" "this" {
  name           = var.name
  s3_bucket_name = var.bucket_name
}
