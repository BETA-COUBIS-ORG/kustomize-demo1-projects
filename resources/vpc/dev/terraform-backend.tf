terraform {  
   backend "s3" {   
      bucket         = "2560-dev-alpha-terraform11-state"     
      key            = "dev-vpc-resource1/terraform.tfstate"               
      region         = "us-east-1"                           
      dynamodb_table = "2560-dev-alpha-terraform2-state-lock" 
    } 
}
