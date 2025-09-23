# Get secret information for RDS password     # 
data "aws_secretsmanager_secret" "rds_password" {
  name = "/111111/eva/db/databases-password"            # coming from aws secret manager so we create fisrt "create-secret-with-no-value "
}                                                       # without data.tf   and to get the password from aws, we add data.tf on "create-secret-with-no-value "

data "aws_secretsmanager_secret_version" "rds_password" {
  secret_id = data.aws_secretsmanager_secret.rds_password.id    #this will give you the actuel password 
}

output "rds_password" {
  sensitive = true
  value     = data.aws_secretsmanager_secret_version.rds_password.secret_string
}


# Get secret information for RDS username
data "aws_secretsmanager_secret" "rds_username" {
  name = "/111111/eva/db/databases-usename"
}


data "aws_secretsmanager_secret_version" "rds_username" {
  secret_id = data.aws_secretsmanager_secret.rds_username.id
}

output "rds_username" {
  sensitive = true
  value     = data.aws_secretsmanager_secret_version.rds_username.secret_string
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