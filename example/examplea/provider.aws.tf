provider "aws" {
  version = "3.2.0"
  region  = "eu-west-1"
}

provider "template" {
  version = "2.1"
}

provider "local" {
  version = "1.2"
}
