resource "aws_s3_bucket" "trail" {
  bucket = var.bucket_name

  tags = var.tags
}

resource "aws_cloudtrail" "this" {
  name                          = var.name
  s3_bucket_name                = aws_s3_bucket.trail.bucket
  is_multi_region_trail         = true
  enable_log_file_validation    = true
  include_global_service_events = true
  is_organization_trail         = var.is_organization_trail

  tags = var.tags
}
