provider "aws" {
  region  = "eu-west-1"
  version = "1.50"
}

provider "local" {
  version = "1.1"
}

provider "template" {
  version = "1.0"
}