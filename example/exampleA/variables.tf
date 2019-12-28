variable "common_tags" {
  description = "This is a map type for applying tags on resources"
  type        = map
}

variable "s3_mfa_delete" {
  description = "Allow for disabling mfa deletion"
  default = true
}

variable "aws_region" {
  description = "This is the default AWS region"
  default = "eu-west-1"
}
