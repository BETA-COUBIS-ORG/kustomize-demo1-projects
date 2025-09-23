# terraform {
#   backend "s3" {
#     bucket         = "ektec-terraform-state"
#     key            = "aws-terraform/eks/eks-02/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "ektec-terraform-state-lock"
#   }
# }


terraform {
  backend "s3" {
    bucket         = "1759-dev-alpha-state"
    dynamodb_table = "1759-dev-alpha-state-lock"
    key            = "bastion-host/terraform.tfstate"
    region         = "us-east-1"
  }
}

