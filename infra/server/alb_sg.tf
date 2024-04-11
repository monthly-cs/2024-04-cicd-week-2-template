resource "aws_security_group" "alb_sg" {
  vpc_id = aws_vpc.vpc.id
  name   = local.alb_sg_name
  tags   = local.tags

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}