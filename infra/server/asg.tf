resource "aws_autoscaling_group" "asg" {
  name             = local.asg_name
  desired_capacity = local.asg_desire_capacity
  max_size         = local.asg_max_size
  min_size         = local.asg_min_size
  
  vpc_zone_identifier = [
    aws_subnet.private_subnets["private1-react-ap-ne-2a"].id,
    aws_subnet.private_subnets["private1-react-ap-ne-2c"].id,
  ]

  # health_check_type    = "EC2"
  # termination_policies = ["OldestInstance"]

  launch_template {
    id      = aws_launch_template.ec2_launch_template.id
    version = "$Latest"
  }
}
