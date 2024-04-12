resource "aws_iam_role" "codedeploy_iam_role" {
  name = local.codedeploy_iam_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action    = "sts:AssumeRole",
        Effect    = "Allow",
        Principal = { Service = "codedeploy.amazonaws.com" }
      }
    ]
  })

  inline_policy {
    name = local.codedeploy_iam_inline_policy_name
    policy = jsonencode({
      Version = "2012-10-17",
      Statement = [{
        Action = [
          "autoscaling:*",
          "iam:PassRole",
          "ec2:*",
          "elasticloadbalancing:*",
          "elasticloadbalancing:DescribeLoadBalancers"
        ],
        Effect   = "Allow"
        Resource = "*"
      }]
    })
  }

  tags = local.tags
}
