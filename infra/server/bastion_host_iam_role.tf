resource "aws_iam_role" "bastion_host_iam_role" {
  name = local.bastion_host_iam_role_name
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
    name = local.bastion_host_iam_inline_policy_name
    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action = [
            "ssm:*",
            "ec2messages:AcknowledgeMessage",
            "ec2messages:DeleteMessage",
            "ec2messages:FailMessage",
            "ec2messages:GetEndpoint",
            "ec2messages:GetMessages",
            "ec2messages:SendReply"
          ],
          Effect   = "Allow"
          Resource = "*"
        }
      ]
    })
  }
}