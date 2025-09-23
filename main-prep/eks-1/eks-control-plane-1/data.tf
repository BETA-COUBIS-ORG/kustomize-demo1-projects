#data "aws_vpc" "vpc" {
#  filter {
#    name   = "tag:Name"
#    values = ["eks-put-in-one-baskect"]
#  }
#}
#
#data "aws_subnet" "private_subnet1" {
#  filter {
#    name   = "tag:Name"
#    values = ["2560-dev-alpha-vpc-private-subnet-eks-ec2-01"]
#  }
#}
#
#data "aws_subnet" "private_subnet2" {
#  filter {
#    name   = "tag:Name"
#    values = ["2560-dev-alpha-vpc-private-subnet-eks-ec2-02"]
#  }
#}
#
#
#data "aws_subnet" "public_1" {
#  filter {
#    name   = "tag:Name"
#    values = ["2560-dev-alpha-vpc-public-subnet-01"]
#  }
#}
#
#data "aws_subnet" "public_2" {
#  filter {
#    name   = "tag:Name"
#    values = ["2560-dev-alpha-vpc-public-subnet-02"]
#  }
#}


#data "aws_vpc" "main" {
#  filter {
#    name   = "tag:Name"
#    values = ["11111-dev-pipeline-vpc"]
#  }
#}
#
#data "aws_subnet" "eks_private_subnet_01" {     #data.aws_subnet.eks_private_subnet_01.id,
#  filter {
#    name   = "tag:Name"
#    values = ["11111-dev-pipeline-vpc-private_subnets_eks_ec2_01"]
#  }
#}
#
#
#data "aws_subnet" "eks_private_subnet_02" {
#  filter {
#    name   = "tag:Name"
#    values = ["11111-dev-pipeline-vpc-private_subnets_eks_ec2_02"]
#  }
#}
#
#
#data "aws_subnet" "eks_public_subnet_01" {
#  filter {
#    name   = "tag:Name"
#    values = ["11111-dev-pipeline-bastion-host"]
#  }
#}
#
#data "aws_subnet" "eks_public_subnet_02" {
#  filter {
#    name   = "tag:Name"
#    values = ["11111-dev-pipeline-vpc-public-subnet-01"]
#  }
#}
#
###############################################################################
data "aws_vpc" "main" {    #resource 
  filter {
    name   = "tag:Name"
    values = ["11111-dev-pipeline-vpc"]
  }    
}

data "aws_subnet" "public-subnet-02" {
  filter {
    name   = "tag:Name"
    values = ["11111-dev-pipeline-bastion-host"]
  }  
}  
  data "aws_subnet" "public-subnet-01" {
  filter {
    name   = "tag:Name"
    values = ["11111-dev-pipeline-vpc-public-subnet-01"]
  }   
  } 
  data "aws_subnet" "private_subnets_eks_ec2_02" {
  filter {
    name   = "tag:Name"
    values = ["11111-dev-pipeline-vpc-private_subnets_eks_ec2_02"]
  }    
}   
data "aws_subnet" "private_subnets_eks_ec2_01" {
  filter {
    name   = "tag:Name"
    values = ["11111-dev-pipeline-vpc-private_subnets_eks_ec2_01"]
  }    
}