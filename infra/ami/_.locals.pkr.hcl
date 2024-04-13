locals {
  aws_profile = "monthly-cs"
  aws_region = "us-east-1"

  aws_ebs_name          = "monthly-cs-pkr-ebs"
  aws_ebs_ssh_username  = "ubuntu"
  aws_ebs_instance_type = "t2.medium"

  aws_build_name = "monthly-cs-pkr-build"

  tags = {
    monthly-cs = "monthly-cs"
    week       = 2
  }
}