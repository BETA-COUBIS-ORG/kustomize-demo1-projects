 terraform {  
   backend "s3" {   
      bucket         = "11111-dev-pipeline-terraff-pipeline-state"     # name of the bucker
      key            = "bastion-host/terraform.tfstate"               # sub repository for statefile 
      region         = "us-east-1"                           # region
      dynamodb_table = "11111-dev-pipeline-terraff-pipeline-dynamo-state-lock" # dynamodb name have 
    } 
}





# this backend come from the module /vpc
