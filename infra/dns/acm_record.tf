resource "aws_route53_record" "acm_record" {

  zone_id = aws_route53_zone.zone.id

  for_each = {
    for acm_map in aws_acm_certificate.acm.domain_validation_options
    : acm_map.domain_name => {
      record_name  = acm_map.resource_record_name
      record_type  = acm_map.resource_record_type
      record_value = acm_map.resource_record_value
    }
  }
  name    = each.value.record_name
  type    = each.value.record_type
  records = [each.value.record_value]

  ttl = 330

  depends_on = [
    aws_acm_certificate.acm,
    aws_route53_zone.zone
  ]
}