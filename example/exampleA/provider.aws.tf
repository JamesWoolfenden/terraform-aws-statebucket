provider "aws" {
  region  = "eu-west-1"
  version = "2.18.0"
}

provider "template" {
  version = "2.1"
}

provider "local" {
  version = "1.2"
}
