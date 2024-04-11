resource "aws_route53_record" "alb_acm_record" {
  for_each = {
    for aco_map in aws_acm_certificate.alb_acm.domain_validation_options
    : aco_map.domain_name => {
      record_name  = aco_map.resource_record_name
      record_type  = aco_map.resource_record_type
      record_value = aco_map.resource_record_value
    }
  }

  zone_id = data.aws_route53_zone.zone.id
  name    = each.value.record_name
  type    = each.value.record_type
  records = [each.value.record_value]
  ttl     = 300
}