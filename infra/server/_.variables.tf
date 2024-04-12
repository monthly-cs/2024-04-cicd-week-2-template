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
variable "ami_id" {
  type = string
}