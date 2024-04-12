resource "random_pet" "s3_name_prefix" {
  length = 2
  separator = "-"
}
