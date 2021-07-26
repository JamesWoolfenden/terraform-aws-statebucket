terraform {
  required_providers {
    aws = {
      version = "3.51.0"
      source  = "hashicorp/aws"
    }
    template = {
      version = "2.2.0"
    }

    local = {
      version = "1.2"
    }
  }
  required_version = ">=0.14.8"
}
