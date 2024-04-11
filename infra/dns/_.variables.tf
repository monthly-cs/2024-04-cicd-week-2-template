# Provider
variable "profile" {
  type = string
}
variable "region" {
  type    = string
  default = "us-east-1"
}

# Resource
variable "domain_name" {
  type = string
}