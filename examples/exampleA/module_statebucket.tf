module "statebucket" {
  source  = "JamesWoolfenden/statebucket/aws"
  version = "0.0.3"
  common_tags = "${var.common_tags}"
}
