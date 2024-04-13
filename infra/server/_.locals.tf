# Terraform의 변수 선언 방식 
locals {
  tags = {
    "monthly-cs" : "monthly-cs"
    "week" : 2
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

  asg_name            = "monthly-cs-asg"
  asg_desire_capacity = 1
  asg_max_size        = 1
  asg_min_size        = 1

  s3_bucket_name = "monthly-cs-s3-bucket"

  bastion_host_name                   = "monthly-cs-bastion-host-name"
  bastion_host_instance_type          = "t2.medium"
  bastion_host_instance_profile_name  = "monthly-cs-bastion-instance-profile"
  bastion_host_iam_role_name          = "monthly-cs-bastion-iam-role"
  bastion_host_iam_inline_policy_name = "monthly-cs-bastion-iam-inline-policy"

  ec2_sg_name                = "monthly-cs-ec2-sg"
  ec2_instance_type          = "t3.large"
  ec2_instance_profile_name  = "monthly-cs-ec2-instance-profile"
  ec2_iam_role_name          = "monthly-cs-ec2-iam-role"
  ec2_iam_inline_policy_name = "monthly-cs-ec2-iam-inline-policy"
  ec2_launch_template_name   = "monthly-cs-ec2-launch-template"

  codedeploy_app_compute_platform = "Server"

  codedeploy_iam_role_name          = "monthly-cs-codedeploy-iam-role"
  codedeploy_iam_inline_policy_name = "monthly-cs-codedeploy-iam-inline-policy"
  codedeploy_app_name               = "monthly-cs-codedeploy-app"
  codedeploy_deployment_name        = "monthly-cs-codedeploy-deployment"
}