# Terraform의 변수 선언 방식 
locals {
  tags = {
    "monthly-cs" : "monthly-cs"
    "week" : 1
  }
  vpc_cidr_block = "10.0.0.0/16"
  vpc_public_subnet_cidr_blocks = {
    "public1-ap-ne-2a" = {
      cidr_block        = "10.0.0.0/22",
      availability_zone = "us-east-1a",
    },
    "public1-ap-ne-2c" = {
      cidr_block        = "10.0.128.0/22",
      availability_zone = "us-east-1c",
    }
  }
  vpc_private_subnet_cidr_blocks = {
    "private1-react-ap-ne-2a" = {
      cidr_block        = "10.0.8.0/21",
      availability_zone = "us-east-1a"
    },
    "private1-react-ap-ne-2c" = {
      cidr_block        = "10.0.136.0/21",
      availability_zone = "us-east-1c"
    },
  }

  ec2_ssh_keyname = "monthly-cs.pem"

  alb_name    = "monthly-cs-alb"
  alb_sg_name = "monthly-cs-alb-sg"
  alb_tg_name = "monthly-cs-alb-tg"

  asg_name = "monthly-cs-asg"
  asg_desire_capacity = 0
  asg_max_size = 0
  asg_min_size = 0

  ec2_sg_name                = "monthly-cs-ec2-sg"
  ec2_iam_role_name          = "monthly-cs-ec2-iam-role"
  ec2_launch_template_name   = "monthly-cs-ec2-launch-template"
  ec2_instance_profile_name  = "monthly-cs-ec2-instance-profile"
  ec2_iam_inline_policy_name = "monthly-cs-ec2-iam-inline-policy"
}