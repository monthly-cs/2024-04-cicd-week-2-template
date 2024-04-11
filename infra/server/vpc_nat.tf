# 공용 IP가 할당되지 않은 사설 네트워크(Private Subnet)의 EC2 인스턴스가 공용 네트워크로 요청을 보내기 위해서 필요
resource "aws_nat_gateway" "vpc_nat" {
  allocation_id = aws_eip.vpc_nat_eip.id
  subnet_id     = aws_subnet.public_subnets["public1-ap-ne-2a"].id
  tags          = local.tags
}
