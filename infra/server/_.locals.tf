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
    "public2-ap-ne-2c" = {
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
}