## Get latest AMI ID for Amazon Linux2 OS
#data "aws_ami" "amzlinux2" {
#  most_recent = true
#  owners      = ["amazon"]
#  filter {
#    name   = "name"
#    values = ["amzn2-ami-hvm-*-gp2"]
#  }
#  filter {
#    name   = "root-device-type"
#    values = ["ebs"]
#  }
#  filter {
#    name   = "virtualization-type"
#    values = ["hvm"]
#  }
#  filter {
#    name   = "architecture"
#    values = ["x86_64"]
#  }
#}
#
#here is the code to koueri the ami id / because in order to lunch ec2, you need the ami id but because that id change depending of the 
#region, aws found the way to solve that issue with this code 
# how to get the latest ami with data 

data "aws_ami" "ubuntu_20_04" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  owners = ["099720109477"]
}


output "ami_id" {
  value = data.aws_ami.ubuntu_20_04.id
}