output "codedeploy_app_name" { value = aws_codedeploy_app.codedeploy_app.name }
output "codedeploy_deployment_name" { value = aws_codedeploy_deployment_group.codedeploy_deployment.deployment_group_name }
output "s3_name" { value = aws_s3_bucket.s3.bucket_domain_name }