resource "aws_lb" "alb" {
  name                       = local.alb_name
  internal                   = false
  load_balancer_type         = "application"
  enable_http2               = true
  enable_deletion_protection = false
  tags                       = local.tags

  security_groups = [aws_security_group.alb_sg.id]
  subnets = [
    aws_subnet.public_subnets["public1-ap-ne-2a"].id,
    aws_subnet.public_subnets["public1-ap-ne-2c"].id
  ]
}
