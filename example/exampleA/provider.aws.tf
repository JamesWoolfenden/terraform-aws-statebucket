provider "aws" {
  version = "2.39"
  region  = var.aws_region
}

provider "template" {
  version = "2.1"
}

provider "local" {
  version = "1.2"
}
