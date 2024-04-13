# vpc_public_subnets.tf와 vpc_public_subnets_rtb.tf를 연결
resource "aws_route_table_association" "vpc_public_subnets_rtb_association" {
  for_each = aws_subnet.public_subnets

  subnet_id      = each.value.id
  route_table_id = aws_route_table.vpc_public_subnets_rtb.id
}