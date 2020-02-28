resource "aws_s3_bucket_public_access_block" "state_bucket" {
  bucket = aws_s3_bucket.state_bucket.id

  block_public_acls       = var.access_block["block_public_acls"]
  block_public_policy     = var.access_block["block_public_policy"]
  ignore_public_acls      = var.access_block["ignore_public_acls"]
  restrict_public_buckets = var.access_block["restrict_public_buckets"]
}
