resource "aws_acm_certificate" "alb_acm" {
  domain_name       = "week2.${var.domain_name}"
  validation_method = "DNS"
  tags              = local.tags
}
