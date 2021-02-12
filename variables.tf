variable "common_tags" {
  description = "This is the common tags scheme map type for applying tags on resources"
  type        = map(any)
}

variable "acl" {
  description = "Not Likely/Unwise to want a public state bucket, but here's the option"
  default     = "private"
}

variable "force_destroy" {
  type        = bool
  description = "Set force_destroy property - unlikely to anything else but may want rid of at some point"
  default     = false
}

variable "mfa_delete" {
  type        = bool
  description = "Object to control version behaviour"
  default     = false
}

variable "sse_algorithm" {
  description = "The type of encryption algorithm to use"
  type        = string
  default     = "aws:kms"
}
