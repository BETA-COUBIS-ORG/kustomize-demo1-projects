variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "common_tags" {
  type = map(any)
  default = {
    "AssetID"       = "123"
    "Environment"   = "dev"
    "Project"       = "pipeline"
    "CreateBy"      = "Terraform"
    "cloudProvider" = "aws"
    "codeID"        = "eks1"
  }
}
