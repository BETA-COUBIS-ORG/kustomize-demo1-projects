terraform {
  backend "s3" {
    bucket         = "1759-dev-alpha-state"
    dynamodb_table = "1759-dev-alpha-state-lock"
    key            = "alpa-db/terraform.tfstate"
    region         = "us-east-1"
  }
}


#lock the state file mean two engineer cant apply terraform apply at the same time. 