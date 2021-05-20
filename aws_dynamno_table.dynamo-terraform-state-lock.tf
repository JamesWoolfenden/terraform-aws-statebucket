resource "aws_dynamodb_table" "dynamodb-state-lock" {
  # checkov:skip=CKV_AWS_119: ADD REASON
  # checkov:skip=CKV_AWS_125: ADD REASON
  # checkov:skip=CKV_AWS_28: "Ensure Dynamodb point in time recovery (backup) is enabled"
  # tfsec:ignore:AWS086
  # tfsec:ignore:AWS092
  name           = "dynamodb-state-lock"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = var.common_tags
}
