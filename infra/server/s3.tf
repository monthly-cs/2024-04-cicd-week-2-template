resource "aws_s3_bucket" "s3" {
  bucket = "${random_pet.s3_name_prefix.id}-${local.s3_bucket_name}"
  tags   = local.tags
}