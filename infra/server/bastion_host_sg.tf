resource "aws_security_group" "bastion_host_sg" {
  vpc_id = aws_vpc.vpc.id
  name   = local.bastion_host_name
  tags   = local.tags

  ingress {
    from_port   = 22
    to_port     = 22
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