data "aws_vpc" "adl_eks_vpc" {
  filter {
    name   = "tag:Name"
    values = ["11111-dev-pipeline-vpc"]
  }
}

#data "aws_subnet" "eks_public_subnet_01" {       # refet in the bastion-host   data.aws_subnet.eks_public_subnet_01.id
data "aws_subnet" "private_subnets_eks_ec2_01" {
    filter {
    name   = "tag:Name"
    values = ["11111-dev-pipeline-vpc-private_subnets_eks_ec2_01"]           # from aws and grab pubic subnet id or on  tag and name
  }
}
