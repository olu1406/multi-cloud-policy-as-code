package policy.tests

import data.policy.aws.s3.deny

bad_input := {
  "resource_changes": [
    {
      "address": "aws_s3_bucket.bad",
      "type": "aws_s3_bucket",
      "change": {
        "after": {
          "bucket": "bad-bucket"
        }
      }
    },
    {
      "address": "aws_s3_bucket_public_access_block.bad",
      "type": "aws_s3_bucket_public_access_block",
      "change": {
        "after": {
          "bucket": "bad-bucket",
          "block_public_acls": false,
          "block_public_policy": false,
          "ignore_public_acls": false,
          "restrict_public_buckets": false
        }
      }
    }
  ]
}

test_s3_denies_insecure_public_access {
  results := deny with input as bad_input
  count(results) == 2
}
