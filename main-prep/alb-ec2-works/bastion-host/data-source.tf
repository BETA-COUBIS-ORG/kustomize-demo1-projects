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

data "aws_vpc" "main" {
  filter {
    name   = "tag:Name"
    values = ["1759-dev-alpha-vpc"]
  }
}

data "aws_subnet" "public-subnet-01" {
  filter {
    name   = "tag:Name"
    values = ["1759-dev-alpha-vpc-public-subnet-01"]
  }
}

data "aws_subnet" "public-subnet-02" {
  filter {
    name   = "tag:Name"
    values = ["1759-dev-alpha-vpc-public-subnet-02"]
  }
}



