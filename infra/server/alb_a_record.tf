resource "aws_route53_record" "alb_a_record" {
  zone_id = data.aws_route53_zone.zone.id
  type    = "A"
  name    = "week2.${var.domain_name}"

  alias {
    name                   = "dualstack.${aws_lb.alb.dns_name}"
    zone_id                = aws_lb.alb.zone_id
    evaluate_target_health = true
  }
}
