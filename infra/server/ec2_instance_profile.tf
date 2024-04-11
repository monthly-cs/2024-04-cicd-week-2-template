resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = local.ec2_instance_profile_name
  role = aws_iam_role.ec2_iam_role.name
}