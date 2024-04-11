# vpc_private_subnets.tf에 대한 라우팅 테이블
# 별도로 명시적인 테이블 연결이 필요하고 이는 vpc_private_subnets_rtb_association.tf에서 선언
resource "aws_route_table" "vpc_private_subnets_rtb" {
  vpc_id = aws_vpc.vpc.id
  tags   = local.tags
}
