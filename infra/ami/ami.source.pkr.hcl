source "amazon-ebs" "custom_ami_ebs" {
  profile = local.aws_profile
  region  = local.aws_region

  ami_name      = local.aws_ebs_name
  instance_type = local.aws_ebs_instance_type
  ssh_username  = local.aws_ebs_ssh_username
  tags          = local.tags

  source_ami_filter {
    filters = {
      virtualization-type = "hvm"
      # name                = "ubuntu/images/*ubuntu-jammy-22.04-amd64-server-*"
      name                = "ubuntu/images/*ubuntu-focal-20.04-amd64-server-*"
      root-device-type    = "ebs"
    }
    owners      = ["099720109477"]
    most_recent = true
  }
}