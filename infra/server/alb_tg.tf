resource "aws_lb_target_group" "alb_tg" {
  name     = local.alb_tg_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id

  health_check {
    path     = "/"
    protocol = "HTTP"
  }
}
