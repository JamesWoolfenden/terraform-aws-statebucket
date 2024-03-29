
variable "acl" {
  description = "Not Likely/Unwise to want a public state bucket, but here's the option"
  default     = "private"
}

variable "force_destroy" {
  type        = bool
  description = "Set force_destroy property - unlikely to anything else but may want rid of at some point"
  default     = false
}

variable "sse_algorithm" {
  description = "The type of encryption algorithm to use"
  type        = string
  default     = "aws:kms"
}
