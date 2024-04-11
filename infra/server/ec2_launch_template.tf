resource "aws_launch_template" "ec2_launch_template" {
  name     = local.ec2_launch_template_name
  key_name = local.ec2_ssh_keyname
  image_id = "ami-04b67a4e25d924c70"

  instance_type        = "t2.medium"
  security_group_names = [aws_security_group.ec2_sg.id]
  tags                 = local.tags

  iam_instance_profile {
    arn = aws_iam_instance_profile.ec2_instance_profile.arn
  }

  tag_specifications {
    resource_type = "instance"
    tags          = local.tags
  }

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size           = 32
      volume_type           = "gp2"
      delete_on_termination = true
      encrypted             = false
    }
  }
}