resource "aws_s3_bucket" "state_bucket" {
  #checkov:skip=CKV_AWS_18: "Ensure the S3 bucket has access logging enabled"
  bucket        = "${data.aws_caller_identity.current.account_id}-terraform-state"
  acl           = var.acl
  force_destroy = var.force_destroy

  versioning {
    enabled    = var.versioning["enabled"]
    mfa_delete = var.versioning["mfa_delete"]
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = var.sse_algorithm
      }
    }
  }

  tags = var.common_tags
}
