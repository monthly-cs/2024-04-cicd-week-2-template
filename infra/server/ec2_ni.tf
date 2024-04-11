resource "aws_network_interface" "example" {
  subnet_id       = aws_subnet.public_subnets["public1-ap-ne-2a"].id
  security_groups = [aws_security_group.ec2_sg.id]
}
