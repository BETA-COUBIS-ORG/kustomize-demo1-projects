resource "aws_db_instance" "eva-db1" {
  instance_class          = "db.t2.small" #1cpu and 2G of ram
  engine                  = "postgres"
  identifier              = "eva-cicd-db"            #when you want to create db video part 5  1:14:00 
  engine_version          = "12"    #check update version
  port                    = 5432        # open door for sucurity group
  multi_az                = false      
  publicly_accessible     = false
  deletion_protection     = false     # ENABLE TRUE IF YOU DONT WANT SOMEONE TO WIPRE OT YOU DB
  storage_encrypted       = true
  storage_type            = "gp2"
  allocated_storage       = 20
  max_allocated_storage   = 50
  name                    = "eva"
  username                = data.aws_secretsmanager_secret_version.rds_username.secret_string
  password                = data.aws_secretsmanager_secret_version.rds_password.secret_string
  apply_immediately       = "true"   #in case if make change it will apply immediatly  check s3 vodeo db 
  backup_retention_period = 0
  skip_final_snapshot     = true
  # backup_window           = "09:46-10:16"
  db_subnet_group_name   = aws_db_subnet_group.eva-postgres-db-subnet.name
  vpc_security_group_ids = ["${aws_security_group.eva-postgres-db-sg.id}"]

  tags = {
    Name = "postgres-eva-cicd-db"
  }
}


resource "aws_db_subnet_group" "eva-postgres-db-subnet" {
  name = "eva-postgres-db-subnet"
  subnet_ids = [
    "${data.aws_subnet.db-subnet-private-01.id}", # data "aws_subnet" "db-subnet-private-01"
    "${data.aws_subnet.db-subnet-private-02.id}",
  ]
}

resource "aws_route53_record" "cluster-alias" {
  depends_on = [aws_db_instance.eva-db1]
  zone_id    = "Z09289712OR1E49S4E493"    # go look in aws route 53 hosted zone id    
  name       = "test"                 # my main domain 
  type       = "CNAME"
  ttl        = "60"
                                                #alpha-rds.betacoubis.link
 # alpha-rds.betacoubis.link

# records = [split(":", aws_db_instance.alpha-db.endpoint)[0]]
# https://github.com/hashicorp/terraform/issues/4996
 records    = [aws_db_instance.eva-db1.endpoint]
}                                       #it goes to aws route 53 en get the enpoint
resource "aws_security_group" "eva-postgres-db-sg" {
  name   = "postgres-rds-sg"
  vpc_id = data.aws_vpc.postgres_vpc.id
}

resource "aws_security_group_rule" "postgres-rds-sg-rule" {
  from_port         = 5432
  protocol          = "tcp"
  to_port           = 5432
  security_group_id = aws_security_group.eva-postgres-db-sg.id
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "outbound_rule" {
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.eva-postgres-db-sg.id
  to_port           = 0
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
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


#####PROBLEMES THAT I ENCOUNT IS WHEN I WAS CREATED MY PROSGRES DB, 
##I CREATE THE USERNAME AND PASSWORD OF MY RDS  DB . THE MISTAKE WAS WHEN I WERE REFEREING
# THE USERNAME AND PASSWORK IN THE MAIN.TF, i DID NOT SEE THE DIFFERENT
#"rds_password"  AND IN MY DATA SOURCE WAS rds-password
# SO WHEN I TERRAFORM PLAN I HAD THE ERROR AND TERRAFORM SHOW ME EXACTLY WHERE TO GO FIX




####mine### go paste on git bash   and type \l
#psql --host=alpha-cicd-db.cbggprguolhn.us-east-1.rds.amazonaws.com --port=5432 --username=coubis_admin --password --dbname=alpha

