resource "aws_instance" "bastion_host" {
  ami           = var.ami_id
  instance_type = local.bastion_host_instance_type

  key_name = local.ec2_ssh_keyname

  tags = local.tags

  vpc_security_group_ids = [aws_security_group.bastion_host_sg.id]
  subnet_id              = values(aws_subnet.public_subnets)[0].id

  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.bastion_host_instance_profile.name
}