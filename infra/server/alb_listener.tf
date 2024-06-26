resource "aws_lb_listener" "alb_listener" {

  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  load_balancer_arn = aws_lb.alb.arn
  certificate_arn   = aws_acm_certificate.alb_acm.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_tg.arn
  }

  depends_on = [aws_acm_certificate.alb_acm]

}