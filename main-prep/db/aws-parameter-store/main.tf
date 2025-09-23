resource "aws_ssm_parameter" "db-username" {
  name  = join("/", ["${var.param_store_prefix}", "db-username"])     #or 
  #name = "${var.param_store_prefix}/db-username"        
  type  = "String"
  value = "admin"
  tags  = var.common_tags
}

resource "aws_ssm_parameter" "db-password" {
  name  = join("/", ["${var.param_store_prefix}", "db-password"])      #or 
  #name = "${var.param_store_prefix}/db-password"
  type  = "SecureString"
  value = "db-password"     
  tags  = var.common_tags
}

# name  = join("/", ["${var.param_store_prefix}", "db-username"])   

#this mens join  two elements.   var.param_store_prefix / db-username

# from variable . just for eg purpose
#variable "param_store_prefix" {
#  type    = string
# default = "/2560/adl"
#}
#
#variable "common_tags" {
#  type = map(any)
#  default = {
#    "AssetID"       = "2560"
#    "AssetName"     = "Insfrastructure"
#    "AssetAreaName" = "ADL"
#    "ControlledBy"  = "Terraform"
#    "cloudProvider" = "aws"
#  }
#}
