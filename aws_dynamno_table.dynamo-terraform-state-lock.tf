resource "aws_dynamodb_table" "dynamodb-state-lock" {
  name           = "dynamodb-state-lock"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = "${merge(var.common_tags,
    map("Name", "${upper(substr(var.common_tags["Environment"],0,1))}-${upper(var.common_tags["Module"])}-${upper(var.common_tags["Application"])}-DB")
    )}"
}
