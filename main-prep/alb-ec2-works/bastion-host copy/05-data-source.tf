# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpcs

# data "aws_vpc" "adl_eks_vpc" {
#   tags = {
#     Name = "adl-eks-vpc"
#   }
# }

# data "aws_subnet" "eks_public_subnet_01" {
#   tags = {
#     Name = "eks-public-subnet-01"
#   }
# }


# https://wahlnetwork.com/2020/04/30/filter-terraform-data-source-by-aws-tag-value/

# https://www.youtube.com/watch?v=9cDDZzl7zow

data "aws_vpc" "adl_eks_vpc" {                        #
  filter {
    name   = "tag:Name"                                        # from aws and grab pubic vpc id or on  tag and name. 
    values = ["11111-dev-pipeline-vpc"]
  }
}

data "aws_subnet" "eks_public_subnet_01" {       # refet in the bastion-host   data.aws_subnet.eks_public_subnet_01.id
  filter {
    name   = "tag:Name"
    values = ["11111-dev-pipeline-vpc-public-subnet-01"]           # from aws and grab pubic subnet id or on  tag and name
  }
}


