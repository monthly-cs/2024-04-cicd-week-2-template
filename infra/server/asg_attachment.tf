resource "aws_autoscaling_attachment" "aws_autoscaling_attachment_module" {
  lb_target_group_arn    = aws_lb_listener.alb_listener.arn
  autoscaling_group_name = aws_autoscaling_group.asg.name
}
