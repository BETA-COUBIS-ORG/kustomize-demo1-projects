
data "aws_vpc" "main" {    
  filter {
    name   = "tag:Name"
    values = ["default-vpc-vpc"]
  }    
}

data "aws_subnet" "public-subnet-02" {
  filter {
    name   = "tag:Name"
    values = ["default-vpc-subnet-public1-us-east-1a"]
  }  
}  
  data "aws_subnet" "public-subnet-01" {
  filter {
    name   = "tag:Name"
    values = ["default-vpc-subnet-public2-us-east-1b"]
  }   
  } 
#  data "aws_subnet" "private_subnets_eks_ec2_02" { 
#  filter {
#    name   = "tag:Name"
#    values = ["11111-dev-pipeline-vpc-private_subnets_eks_ec2_02"]
#  }    
#}   
#data "aws_subnet" "private_subnets_eks_ec2_01" {  
#  filter {
#    name   = "tag:Name"
#    values = ["11111-dev-pipeline-vpc-private_subnets_eks_ec2_01"]
#  }    
#}


data "aws_eks_cluster" "example" {
  name = "123-dev-pipeline-eks1"
}

output "eks_cluster_name" {
  value = data.aws_eks_cluster.example.name
}



##########################################################
#data "aws_vpc" "adl_eks_vpc" {                        
#  filter {
#    name   = "tag:Name"                                         
#    values = ["default-vpc-vpc"]
#  }
#}
#
#data "aws_subnet" "eks_public_subnet_01" {      
#  filter {
#    name   = "tag:Name"
#    values = ["default-vpc-subnet-public1-us-east-1a"]           
#  }
#}
