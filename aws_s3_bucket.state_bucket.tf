resource "aws_s3_bucket" "statebucket" {
  bucket        = "${data.aws_caller_identity.current.account_id}-terraform-state"
  acl           = var.acl
  force_destroy = var.force_destroy
  versioning {
    enabled    = var.versioning["enabled"]
    mfa_delete = var.versioning["mfa_delete"]
  }

  tags = var.common_tags
}
