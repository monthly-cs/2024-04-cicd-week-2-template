resource "aws_acm_certificate" "acm" {
  domain_name = var.domain_name

  validation_method = "DNS"
  lifecycle {
    create_before_destroy = true
  }

  depends_on = [
    aws_route53_zone.zone
  ]

  tags = {
    "monthly-cs" : "monthly-cs"
    "week" : 1
  }
}