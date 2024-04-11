resource "aws_iam_role" "ec2_iam_role" {
  name = local.ec2_iam_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags                = local.tags
  managed_policy_arns = []

  inline_policy {
    name = local.ec2_iam_inline_policy_name
    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action   = ["codedeploy:*", "s3:*", "ec2:*"],
          Effect   = "Allow"
          Resource = "*"
        }
      ]
    })
  }
}
