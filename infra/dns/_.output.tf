output "dns_ns_record" {
  value = aws_route53_zone.zone.name_servers
}