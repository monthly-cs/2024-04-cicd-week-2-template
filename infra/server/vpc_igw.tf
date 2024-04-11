# 공용 네트워크(인터넷)에서 사설 네트워크(VPC 내부)로 요청하기 위해 필요함
resource "aws_internet_gateway" "vpc_igw" {
  vpc_id = aws_vpc.vpc.id
  tags   = local.tags
}
