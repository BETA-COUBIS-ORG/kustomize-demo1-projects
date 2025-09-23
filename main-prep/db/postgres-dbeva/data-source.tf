data "aws_vpc" "postgres_vpc" {            # 
  filter {
    name   = "tag:Name"
    values = ["11111-dev-pipeline-vpc"]    
  }
}

data "aws_subnet" "db-subnet-private-01" {          # for more security, dont expose you db public should be private
  filter {
    name   = "tag:Name"
    values = ["11111-dev-pipeline-vpc-private-subnet-db-01"]
  }
}

data "aws_subnet" "db-subnet-private-02" {
  filter {
    name   = "tag:Name"
    values = ["11111-dev-pipeline-vpc-private-subnet-db-02"]
  }
}


# Get secret information for RDS password   FROM SECRET-WITH-NO-VALUE
data "aws_secretsmanager_secret" "rds_password" {
  name = "/111111/eva/db/databases-password"
}

data "aws_secretsmanager_secret_version" "rds_password" {
  secret_id = data.aws_secretsmanager_secret.rds_password.id #data.aws_secretsmanager_secret.rds_password.id    #this will give you the actuel password 
}

# Get secret information for RDS username   FROM SECRET-WITH-NO-VALUE
data "aws_secretsmanager_secret" "rds_username" {
  name = "/111111/eva/db/databases-usename"
}


data "aws_secretsmanager_secret_version" "rds_username" {
  secret_id = data.aws_secretsmanager_secret.rds_username.id 
}

/*
RESULT:
Outputs:
rds_password = <sensitive>
rds_username = <sensitive>
*/

/*
// CREATE A DATABASE WITH USERNAME AND PASSWORD
password = data.aws_secretsmanager_secret_version.rds-password.secret_string
username = data.aws_secretsmanager_secret_version.rds-username.secret_string
*/

