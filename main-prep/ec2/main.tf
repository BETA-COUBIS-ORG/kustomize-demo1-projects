provider "aws" {
  region = "us-east-1" # Replace with your desired AWS region
}

# Existing VPC and Subnet (replace with your actual VPC and Subnet IDs)
variable "vpc_id" {
  default = "11111-dev-pipeline-vpc" # Replace with your existing VPC ID
}

variable "subnet_id" {
  default = "11111-dev-pipeline-vpc-public-subnet-01" # Replace with your existing Subnet ID
}

# Elastic IP Resource (without the `public_ip` attribute)
resource "aws_eip" "my_existing_eip" {
  # This will allocate a new Elastic IP. If the IP already exists, it must be managed manually.
  tags = {
    Name = "MyElasticIP"
  }
}

# Security Group for EC2 Instance (adjust as needed)
resource "aws_security_group" "my_ec2_sg" {
  name        = "my-ec2-sg"
  vpc_id      = var.vpc_id
  description = "Allow SSH and HTTP access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow SSH from anywhere; restrict as needed
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow HTTP access
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "MySecurityGroup"
  }
}

# EC2 Instance
resource "aws_instance" "my_ec2_instance" {
  ami           = data.aws_ami.ubuntu_20_04.id # Replace with your desired AMI ID
  instance_type = "t2.micro"              # Replace with your instance type
  subnet_id     = var.subnet_id           # Use your existing Subnet
  security_groups = [aws_security_group.my_ec2_sg.name] # Attach the security group

  tags = {
    Name = "MyEC2Instance"
  }
}

# Associate Elastic IP with EC2 Instance
resource "aws_eip_association" "eip_association" {
  instance_id   = aws_instance.my_ec2_instance.id
  allocation_id = aws_eip.my_existing_eip.id
}

