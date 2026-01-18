package policy.aws.s3

import data.lib.helpers.resource_changes
import data.lib.helpers.resource_after

bucket_encryption[bucket_name] {
  rc := resource_changes["aws_s3_bucket_server_side_encryption_configuration"][_]
  after := resource_after(rc)
  bucket_name := after.bucket
}

# Require encryption for all S3 buckets.

deny[msg] {
  rc := resource_changes["aws_s3_bucket"][_]
  after := resource_after(rc)
  not bucket_encryption[after.bucket]
  msg := sprintf("S3 bucket %s does not configure default encryption", [after.bucket])
}

# Require public access block settings.

deny[msg] {
  rc := resource_changes["aws_s3_bucket_public_access_block"][_]
  after := resource_after(rc)
  (after.block_public_acls == false) or
  (after.block_public_policy == false) or
  (after.ignore_public_acls == false) or
  (after.restrict_public_buckets == false)
  msg := sprintf("S3 bucket %s is missing full public access block", [after.bucket])
}
