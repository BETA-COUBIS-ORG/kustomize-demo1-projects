# get details about a route 53 hosted zone
data "aws_route53_zone" "route53_zone" {          #go check   # call from resource   betacoubis.com
  name = var.domain_name                
  # This can be true or false
  private_zone = false
}



# aws_region                = "us-east-1"
# domain_name               = "devopseasylearning.com"
# subject_alternative_names = "*.devopseasylearning.com"
# common_tags = {
#   "AssetID"       = "2560"
#   "AssetName"     = "Insfrastructure"
#   "AssetAreaName" = "ADL"
#   "ControlledBy"  = "Terraform"
#   "cloudProvider" = "aws"
# }

