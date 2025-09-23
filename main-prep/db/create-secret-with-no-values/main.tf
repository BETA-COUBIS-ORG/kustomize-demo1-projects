resource "aws_secretsmanager_secret" "rds_password" {
  #name  = join("/", ["${var.secret-manager-prefix}", "databases-password"])     #or 
  name = "${var.secret-manager-prefix}/databases-password"    # password is input in aws secret manager manually.  good thing is when you run terraform apply, 
  description = "databases password"                         # terraform will no considere the change. and that is great. 
  tags  = {
    "Terraform" = "true"
    "Project"   = "eva"
  }
}

resource "aws_secretsmanager_secret" "rds_usename" {
 # name  = join("/", ["${var.secret-manager-prefix}", "databases-usename"])      #or 
  name = "${var.secret-manager-prefix}/databases-usename"          # from variable
  description = "databases usename"
  tags  = {
    "Terraform" = "true"      # depend of your compagny and projet name you put tag
    "Project"   = "eva"
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret

#resource "aws_secretsmanager_secret" "example" {
#  name = "example"
#}