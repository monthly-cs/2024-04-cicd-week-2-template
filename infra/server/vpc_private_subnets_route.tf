# vpc_private_subnets_rtb.tf에서 생성한 라우팅 테이블을 서브넷과 연결
resource "aws_route" "vpc_private_subnets_route" {
  route_table_id         = aws_route_table.vpc_private_subnets_rtb.id
  nat_gateway_id         = aws_nat_gateway.vpc_nat.id
  destination_cidr_block = "0.0.0.0/0"
}