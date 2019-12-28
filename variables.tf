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
