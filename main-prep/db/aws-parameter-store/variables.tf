variable "param_store_prefix" {
  type    = string
  default = "/1759/adl"
}

variable "common_tags" {
  type = map(any)
  default = {
    "AssetID"       = "1759"
    "AssetName"     = "Insfrastructure"
    "AssetAreaName" = "ADL"
    "ControlledBy"  = "Terraform"
    "cloudProvider" = "aws"
  }
}
