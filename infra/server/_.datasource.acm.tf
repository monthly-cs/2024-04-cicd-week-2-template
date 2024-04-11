data "aws_acm_certificate" "acm" {
  domain   = var.domain_name
  statuses = ["PENDING_VALIDATION", "ISSUED"]
}