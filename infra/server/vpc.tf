# 사설 네트워크망
resource "aws_vpc" "vpc" {
  cidr_block = local.vpc_cidr_block
  tags       = local.tags
}
