# 공용 인터넷과 연결된 서브넷
resource "aws_subnet" "public_subnets" {
  vpc_id = aws_vpc.vpc.id

  for_each = local.vpc_public_subnet_cidr_blocks

  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.availability_zone
  map_public_ip_on_launch = true
  tags                    = local.tags
}