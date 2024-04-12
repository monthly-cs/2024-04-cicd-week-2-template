resource "aws_codedeploy_app" "codedeploy_app" {
  name             = local.codedeploy_app_name
  compute_platform = local.codedeploy_app_compute_platform # "Server"
}
