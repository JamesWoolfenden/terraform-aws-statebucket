resource "aws_s3_bucket" "statebucket" {
  bucket        = "${data.aws_caller_identity.current.account_id}-terraform-state"
  acl           = "private"
  force_destroy = "false"

  versioning {
    enabled = true
  }

  tags = "${merge(var.common_tags,
    map("Name", "${upper(substr(var.common_tags["Environment"],0,1))}-${upper(var.common_tags["Module"])}-${upper(var.common_tags["Application"])}-S3")
    )}"
}
