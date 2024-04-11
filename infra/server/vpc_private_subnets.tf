# 공용 인터넷과 연결되지 않은 서브넷
resource "aws_subnet" "private_subnets" {
  vpc_id = aws_vpc.vpc.id

  for_each = local.vpc_private_subnet_cidr_blocks

  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.availability_zone
  map_public_ip_on_launch = true
  tags                    = local.tags
}