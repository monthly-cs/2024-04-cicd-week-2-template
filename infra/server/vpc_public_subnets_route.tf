# vpc_public_subnets_rtb.tf에서 생성한 라우팅 테이블을 서브넷과 연결
resource "aws_route" "vpc_public_subnets_route" {
  route_table_id         = aws_route_table.vpc_public_subnets_rtb.id
  gateway_id             = aws_internet_gateway.vpc_igw.id
  destination_cidr_block = "0.0.0.0/0"
}