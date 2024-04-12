# https://developer.hashicorp.com/packer/docs/templates/hcl_templates/blocks/build
build {
  name    = local.aws_build_name
  sources = ["source.amazon-ebs.custom_ami_ebs"]

  provisioner "shell" {
    inline = [
      "sudo apt update -y",
      "sudo apt-get update -y",
      "sudo apt install ruby-full -y",
      "sudo apt install wget -y",

      "cd /home/ubuntu",
      # "wget https://<bucket-name>.s3.<region-identifier>.amazonaws.com/latest/install",
      # https://docs.aws.amazon.com/ko_kr/codedeploy/latest/userguide/resource-kit.html#resource-kit-bucket-names
      "wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install",
      "chmod +x ./install",

      "sudo ./install auto > /tmp/logfile"
    ]
  }
}