variable "common_tags" {
  description = "This is the common tags scheme map type for applying tags on resources"
  type        = map
}

variable "acl" {
  description = "Not Likely/Unwise to want a public state bucket, but here's the option"
  default     = "private"
}

variable "force_destroy" {
  description = "Set force_destroy property - unlikely to anything else but may want rid of at some point"
  default     = false
}

variable "versioning" {
  description = "Object to control version behaviour"
  default = {
    enabled    = true
    mfa_delete = true
  }
}

variable "sse_algorithm" {
  description = "The type of encryption algorithm to use"
  type        = string
  default     = "aws:kms"
}


variable "access_block" {
  description = ""
  type        = map
  default = {
    block_public_acls       = false
    block_public_policy     = false
    ignore_public_acls      = false
    restrict_public_buckets = false
  }
}
