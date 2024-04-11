# AWS에 등록할 EC2 Public SSH Key
resource "aws_key_pair" "aws_key_pair_module" {
  key_name   = local.ec2_ssh_keyname
  public_key = tls_private_key.ec2_ssh_origin_key.public_key_openssh
  tags       = local.tags
}
