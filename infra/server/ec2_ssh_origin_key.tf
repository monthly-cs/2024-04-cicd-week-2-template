# EC2 SSH 사용을 위한 TLS 키 원본
resource "tls_private_key" "ec2_ssh_origin_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}