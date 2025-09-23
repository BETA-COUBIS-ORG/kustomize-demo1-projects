variable "aws_region_s3" {
  type    = string
  default = "us-east-1"
}



variable "common_tags" {
  type = map(any)
  default = {
    "id"             = "19002"
    "owner"          = "DevOps Coubis Learning"
    "teams"          = "DEL"
    "environment"    = "dev"
    "project"        = "beta"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}
