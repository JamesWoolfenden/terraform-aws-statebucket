terraform {
  required_providers {
    aws = {
      version = "3.35.0"
      source  = "hashicorp/aws"
    }

    template = {
      version = "2.1"
    }

    local = {
      version = "1.2"
    }

  }
  required_version = ">=0.14.8"
}
