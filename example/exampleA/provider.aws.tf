provider "aws" {
  version = "2.42"
  region  = "eu-west-1"
}

provider "template" {
  version = "2.1"
}

provider "local" {
  version = "1.2"
}
