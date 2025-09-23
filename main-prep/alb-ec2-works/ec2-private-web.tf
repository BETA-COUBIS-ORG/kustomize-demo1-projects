 ## https://registry.terraform.io/modules/terraform-aws-modules/ec2-instance/aws/latest/examples/complete
 #module "ec2_private1" {
 #  source = "terraform-aws-modules/ec2-instance/aws"
 #  # if we are creating instances in the private subnets, we need to create the entire vpc first so that 
 #  # the user data script will not failed while trying to be exected because the nat in the public subnet
 #  # is not yet created
 #  #   depends_on = [
 #  #     module.vpc
 #  #   ]
 #  #   version = "2.17.0"
 #  version = "4.1.4"
 #  name                        = "web-server-01"
 #  count                       = 2
 #  ami                         = data.aws_ami.amzlinux2.id
 #  instance_type               = "t2.micro"
 #  key_name                    = "jenkins-key"
 #  monitoring                  = false
 #  associate_public_ip_address = true
 #  subnet_id                   = "subnet-03bf652de9b70de10"   #private subnet
 #  vpc_security_group_ids      = [aws_security_group.webserver-private-sg.id]
 #  user_data                   = file("${path.module}/user-data/web-servers.sh")
 #  user_data_replace_on_change = true
 #  tags = {
 #    Name = "web-server-${count.index}"
 #  }
 #}
 #variable "subnet_id" {
 #  type = list(any)
 #  default = [
 #    "subnet-0890d120f106adcd3",
 #    "subnet-0d24d4e142aac0b29"
 #  ]
 #}



module "ec2_private1" {
  source = "terraform-aws-modules/ec2-instance/aws"

  # if we are creating instances in the private subnets, we need to create the entire vpc first so that 
  # the user data script will not failed while trying to be exected because the nat in the public subnet
  # is not yet created
  #   depends_on = [
  #     module.vpc
  #   ]
  #   version = "2.17.0"
  version = "4.1.4"

  name                        = "web-server-01"
  ami                         = data.aws_ami.amzlinux2.id   # refer here go loock to bastion-ami data source   "aws_ami" "amzlinux2"  1:55
  instance_type               = "t2.micro"
  key_name                    = "terraform-key"  # terraform-key
  monitoring                  = false
  associate_public_ip_address = true
  subnet_id                   = data.aws_subnet.private_subnets_eks_ec2_01.id#"subnet-0b24ef8cc4db253a0"
  vpc_security_group_ids      = [aws_security_group.webserver-private-sg.id]
  user_data                   = file("${path.module}/user-data/static.sh")   #bastion-host-user-data.sh  web-servers.sh
  user_data_replace_on_change = true
  tags = {
    Name = "web-server-01"
  }
}


module "ec2_private2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.1.4"

  name                        = "web-server-02"
  ami                         = data.aws_ami.amzlinux2.id
  instance_type               = "t2.micro"
  key_name                    = "terraform-key"
  monitoring                  = false
  associate_public_ip_address = true
  subnet_id                   = data.aws_subnet.private_subnets_eks_ec2_02.id#"subnet-02c35db4695bb887a"
  vpc_security_group_ids      = [aws_security_group.webserver-private-sg.id]
  user_data                   = file("${path.module}/user-data/covid.sh")
  user_data_replace_on_change = true
  tags = {
    Name = "web-server-02"
  }
}

# web-servers.sh  static.sh    web-servers.sh     static.sh

#video paart 7 1:58 
