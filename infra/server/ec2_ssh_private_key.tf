# Local PC에서 사용할 EC2 SSH Private Key
resource "local_file" "ec2_ssh_private_key" {
  filename = local.ec2_ssh_keyname
  content  = tls_private_key.ec2_ssh_origin_key.private_key_pem
}