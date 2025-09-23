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