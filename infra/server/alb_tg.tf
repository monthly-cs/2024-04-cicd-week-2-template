resource "aws_lb_target_group" "alb_tg" {
  name        = local.alb_tg_name
  port        = 3000
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = aws_vpc.vpc.id

  health_check {
    path = "/"
    port = 3000
  }
}
