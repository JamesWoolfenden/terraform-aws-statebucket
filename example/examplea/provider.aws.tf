provider "aws" {
  region = "eu-west-2"
  default_tags {
    application = "terraform"
    module      = "terraform-aws-statebucket"
    createdby   = "James Woolfenden"
  }
}
