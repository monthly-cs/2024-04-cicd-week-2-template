resource "aws_route53_zone" "zone" {
  name    = var.domain_name
  comment = "Created by monthly-cs"
  tags = {
    "monthly-cs" : "monthly-cs"
    "week" : 1
  }
}