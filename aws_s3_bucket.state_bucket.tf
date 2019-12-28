resource "aws_s3_bucket" "statebucket" {
  bucket        = "${data.aws_caller_identity.current.account_id}-terraform-state"
  acl           = "private"
  force_destroy = "false"

  versioning {
    enabled    = true
    mfa_delete = s3_mfa_delete
  }

  tags = var.common_tags
}
