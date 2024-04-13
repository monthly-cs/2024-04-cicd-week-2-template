resource "aws_iam_instance_profile" "bastion_host_instance_profile" {
  name = local.bastion_host_instance_profile_name
  role = aws_iam_role.bastion_host_iam_role.name
}