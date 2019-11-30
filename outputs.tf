output "bucket_domain_name" {
  value       = aws_s3_bucket.statebucket.bucket_domain_name
  description = "The FQDN for the bucket"
}

output "statebucket" {
  value       = aws_s3_bucket.statebucket
  description = "The state bucket details"
}
