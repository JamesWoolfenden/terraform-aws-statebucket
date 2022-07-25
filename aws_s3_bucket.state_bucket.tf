resource "aws_s3_bucket" "state_bucket" {
  # checkov:skip=CKV_AWS_144: ADD REASON
  # checkov:skip=CKV_AWS_21:Legacy
  # checkov:skip=CKV_AWS_18: "Ensure the S3 bucket has access logging enabled"
  # checkov:skip=CKV_AWS_52: "Ensure S3 bucket has MFA delete enabled"
  bucket = "${data.aws_caller_identity.current.account_id}-terraform-state"

  force_destroy = var.force_destroy
}

resource "aws_s3_bucket_versioning" "state_bucket" {

  bucket     = aws_s3_bucket.state_bucket.id
  versioning_configuration {
    status = "Enabled"
    mfa_delete = "Disabled"
  }
}

resource "aws_s3_bucket_acl" "state_bucket" {
  bucket = aws_s3_bucket.state_bucket.id
  acl    = var.acl
}

resource "aws_s3_bucket_server_side_encryption_configuration" "state_bucket" {
  bucket = aws_s3_bucket.state_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "aws:kms"
    }
  }
}
