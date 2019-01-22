variable "common_tags" {
  description = "This is a map type for applying tags on resources"
  type        = "map"
}
# this is enables you to add dependancies
variable depends_on {
  default     = []
  description = "This is a way to make a module depends on, which isnt built in."
  type        = "list"
}
