# vpc_nat.tf 에서 외부와 통신하기 위해 고정된 IP가 필요
resource "aws_eip" "vpc_nat_eip" {
  tags = local.tags
}